package ony.cmm.common.handler;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.fasterxml.jackson.databind.ObjectMapper;

import ony.cmm.common.ConstVal;
import ony.cmm.common.util.EncryptUtil;
import ony.cpes.external.login.service.LoginService;
import ony.cpes.external.user.bean.UserBean;


public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    private String defaultUrl;
    private String userEmailname;
    private String passwordname;
    private String errormsgname;

    private RequestCache reqCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

    @Inject
    private LoginService loginService;

    @Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth) throws IOException, ServletException {
    	boolean chkAuth = true;
/*    	String userAuthCd = req.getParameter(ConstVal.USER_AUTH_CD_KEY);

    	System.out.println("######################userAuthCd="+userAuthCd);

    	Iterator<? extends GrantedAuthority> iter = auth.getAuthorities().iterator();

    	while (iter.hasNext()) {
    		GrantedAuthority auth1 = iter.next();

    		String str = auth1.getAuthority();

    		if(userAuthCd.equals(str)) {
    			chkAuth = true;
    			break;
    		}
    	}*/



//      로그인 세션 지우기
        clrearAuthenticationAttributes(req);


        ObjectMapper om = new ObjectMapper();
        Map<String, Object> map = new HashMap<String, Object>();

    	if(chkAuth == false) {
    		map.put(ConstVal.SUCCESS_YN_KEY, ConstVal.NO_VAL);
    		map.put(ConstVal.MESSAGE_KEY, messageSource.getMessage("security.errors.InternalAuthenticationServiceException",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));
    		map.put(ConstVal.STAT_CD_KEY, "02");
    		//SecurityContextHolder.getContext().setAuthentication(null);
    		new SecurityContextLogoutHandler().logout(req, res, auth);
    	} else {
    		map.put(ConstVal.SUCCESS_YN_KEY, ConstVal.YES_VAL);
    		map.put(ConstVal.MESSAGE_KEY, ConstVal.YES_VAL);

	    	UserBean param = new UserBean();
	    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

	    	System.out.println("=======================authentication.getPrincipal()="+(String)authentication.getPrincipal());
	    	System.out.println("=======================authentication.getCredentials()="+authentication.getCredentials());

	    	String mngId = (String) authentication.getPrincipal();

			param.setMngId(EncryptUtil.getAes256Enc(mngId));
			param.setLangCd(ConstVal.LANG_EN_VAL);

			try {
				param = loginService.selectSearchId(req, param);

			} catch (Exception e1) {
				e1.printStackTrace();
			}
			try {
				if (ConstVal.YES_VAL.equals(param.getDormancyYn())) {//휴면 회원  login old user
					new SecurityContextLogoutHandler().logout(req, res, auth);

					map.put(ConstVal.SUCCESS_YN_KEY, ConstVal.NO_VAL);
					map.put(ConstVal.STAT_CD_KEY, "03");
				} else if (ConstVal.YES_VAL.equals(param.getPwdChgYn())) {//normal
					param.setLastLoginIp(req.getRemoteAddr());
					loginService.updateLogin(req, param);
					map.put(ConstVal.STAT_CD_KEY, "00");
				} else {//비밀번호 기간 오류 pwd date over
					new SecurityContextLogoutHandler().logout(req, res, auth);

					map.put(ConstVal.SUCCESS_YN_KEY, ConstVal.NO_VAL);
		    		map.put(ConstVal.MESSAGE_KEY, messageSource.getMessage("security.errors.CredentialsExpired",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));
					map.put(ConstVal.STAT_CD_KEY, "04");
				}

				if(StringUtils.equals(ConstVal.YES_VAL, map.get(ConstVal.SUCCESS_YN_KEY).toString())) {
					HttpSession session = req.getSession();
					UserBean sessionParam = new UserBean();
					sessionParam.setUserSeq(param.getUserSeq());
					sessionParam.setUserNmEn(param.getUserNmEn());
					sessionParam.setUserAuthCd(param.getUserAuthCd());
					sessionParam.setUserEmail(param.getUserEmail());
					sessionParam.setUserCell(param.getUserCell());
					sessionParam.setJcCd(param.getJcCd());
					sessionParam.setUserAuthNm(param.getUserAuthNm());
					sessionParam.setJcTel(param.getJcTel());
					sessionParam.setJcNm(param.getJcNm());
				    session.setAttribute(ConstVal.CPES_SESSION_KEY, sessionParam);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}

		String jsonString = om.writeValueAsString(map);

		System.out.println("====================jsonString="+jsonString);

		OutputStream out = res.getOutputStream();
		out.write(jsonString.getBytes());
    }

    protected void resultRedirectStrategy(HttpServletRequest req, HttpServletResponse res,
            Authentication authentication) throws IOException, ServletException {


        SavedRequest savedRequest = reqCache.getRequest(req, res);

        if (savedRequest != null) {
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStratgy.sendRedirect(req, res, targetUrl);
        } else {
            redirectStratgy.sendRedirect(req, res, defaultUrl);
        }

    }

    protected void clrearAuthenticationAttributes(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if(session == null) return ;
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }

    public String getDefaultUrl() {
        return defaultUrl;
    }

    public void setDefaultUrl(String defaultUrl) {
        this.defaultUrl = defaultUrl;
    }


	public String getUserEmailname() {
		return userEmailname;
	}

	public void setUserEmailname(String userEmailname) {
		this.userEmailname = userEmailname;
	}

	public String getPasswordname() {
		return passwordname;
	}

	public void setPasswordname(String passwordname) {
		this.passwordname = passwordname;
	}

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}


}
