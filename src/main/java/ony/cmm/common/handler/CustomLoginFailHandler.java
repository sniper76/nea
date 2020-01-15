package ony.cmm.common.handler;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.fasterxml.jackson.databind.ObjectMapper;

import ony.cmm.common.ConstVal;
import ony.cpes.external.login.service.LoginService;
import ony.cpes.external.user.bean.UserBean;


public class CustomLoginFailHandler implements AuthenticationFailureHandler {

	private String userEmailname;
    private String passwordname;
    private String errormsgname;
    private String defaultFailureUrl;

    @Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;

    @Inject
    private LoginService loginService;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {

    	String userEmail = request.getParameter(ConstVal.USER_EMAIL_KEY);
    	String statCd = "";

    	UserBean ub = new UserBean();
    	ub.setMngId(userEmail);




        if(exception instanceof BadCredentialsException) {//비번실패 pwd fail
        	try {
    			ub = loginService.updateLoginFail(request, ub);
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        	System.out.println("====================pwd fail");
        	errormsgname = messageSource.getMessage("security.errors.BadCredentials",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(request));
        	statCd = "01";
        } else if(exception instanceof InternalAuthenticationServiceException) {//사용자없음 nothing user
        	System.out.println("====================nothing user fail");
        	errormsgname = messageSource.getMessage("security.errors.InternalAuthenticationServiceException",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(request));
        	statCd = "02";
        } else if(exception instanceof DisabledException) {//계정잠감 id lock
        	System.out.println("====================id lock");
        	errormsgname = messageSource.getMessage("security.errors.Disaled",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(request));
        	statCd = "03";
        } else if(exception instanceof CredentialsExpiredException) {//비밀번호 기간 오류 pwd date over
        	System.out.println("====================pwd date over");
        	errormsgname = messageSource.getMessage("security.errors.CredentialsExpired",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(request));
        	statCd = "04";
        } else if(exception instanceof LockedException) {//비밀번호 5회이상 실패,fial pwd count 5 more
        	System.out.println("====================pwd date over");
        	errormsgname = messageSource.getMessage("security.errors.CredentialsExpired",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(request));
        	statCd = "05";
        }


        ObjectMapper om = new ObjectMapper();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put(ConstVal.SUCCESS_YN_KEY, ConstVal.NO_VAL);
		map.put(ConstVal.MESSAGE_KEY, errormsgname);
		map.put(ConstVal.STAT_CD_KEY, statCd);

		// {"success" : false, "message" : "..."}
		String jsonString = om.writeValueAsString(map);

		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());

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


	public String getDefaultFailureUrl() {
        return defaultFailureUrl;
    }

    public void setDefaultFailureUrl(String defaultFailureUrl) {
        this.defaultFailureUrl = defaultFailureUrl;
    }

}
