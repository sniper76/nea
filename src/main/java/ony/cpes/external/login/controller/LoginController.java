package ony.cpes.external.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.SmsBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.MaskingUtil;
import ony.cpes.external.login.bean.LoginBean;
import ony.cpes.external.login.service.CustomUserDetailsService;
import ony.cpes.external.login.service.LoginService;
import ony.cpes.external.user.bean.UserBean;
import ony.framework.BaseController;
import ony.framework.util.StringUtil;




@Controller
public class LoginController extends BaseController{

  private static Log log = LogFactory.getLog(LoginController.class);

  @Autowired
  private LoginService loginService;

  @Autowired
  private HttpSession session;

  @Autowired SessionLocaleResolver localeResolver;

  @Autowired MessageSource messageSource;

  @Autowired
  CommonService commonService;

  /**
   * 사용자 로그인 화면
   * user login page
   * @param req
   * @param res
   * @return String
   * @throws Exception
   */
    @RequestMapping("/login")
	public String login(HttpServletRequest req, HttpServletResponse res) throws Exception {

		return "login/login.one";
	}

    /**
     * 사용자 로그인 화면
     * user login page
     * @param req
     * @param res
     * @return String
     * @throws Exception
     */
    @RequestMapping("/logout")
  	public void logout(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	 SecurityContextHolder.clearContext();
    	 if (session != null) {
         	session.invalidate();
    	 }
  		res.sendRedirect("/index.do");
  	}

    /**
     * 사용자 로그인 ㅣ처리
     * user login process
     * @param req
     * @param res
     * @return String
     * @throws Exception
     */
    @RequestMapping("/loginProcess")
  	public String loginProcess(@ModelAttribute("userBean") UserBean userBean,HttpServletRequest req, HttpServletResponse res) throws Exception {
    	  return "auth/login.one";
  	}


    /**
     * ajax 사용자 조회
     * Search User  (account)
     * @param req
     * @param res
     * @return void
     * @throws Exception
     */
    @RequestMapping("/selectSearchIdAjax")
	public void selectSearchIdAjax(HttpServletRequest req, HttpServletResponse res) throws Exception {
		UserBean param = (UserBean) getObjectFromJSON(req, UserBean.class);


		this.outputJSON(req, res, loginService.selectSearchId(req, param));
	}


	/**
	   * 사용자 계정 잠김 페이지
	   * user loginLock
	   * @param req
	   * @param res
	   * @return String
	   * @throws Exception
	   */
	@RequestMapping("/loginLock")
	public String loginLock(HttpServletRequest req, HttpServletResponse res) throws Exception {

		return "login/loginLock.one";
	}

	/**
	   * 사용자  비밀번호 변경 페이지(분기별 비번 변경)
	   * user pwd over date
	   * @param req
	   * @param res
	   * @return String
	   * @throws Exception
	*/
	@RequestMapping("/loginPwdOver")
	public String loginPwdOver(HttpServletRequest req, HttpServletResponse res) throws Exception {

		return "login/loginPwdOver.one";
	}


    /**
     * 사용자 비밀번호 변경 처리
     * user pwd change process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/pwdChangeAjax", method = RequestMethod.POST)
	public ModelAndView pwdChange(@ModelAttribute("LoginBean") LoginBean loginBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();

    	loginBean.setMngId(req.getParameter(ConstVal.USER_EMAIL_KEY));

    	LoginBean param = loginService.selectUser(loginBean);

    	if(StringUtil.isEmpty(param)) {
    		param = new LoginBean();
    		param.setStatCd(ConstVal.CODE_01_VAL);
    		param.setSuccessYn(ConstVal.NO_VAL);
    	} else {

    		if(StringUtils.equals(EncryptUtil.getSha512(loginBean.getCurPwd()), param.getUserPwd())) {//현재비밀번호와 디비에 있는 비밀번호가 같을를경우만  CURRENT PWD = ORG PWD EQUAL
    			param.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
        		param.setSuccessYn(ConstVal.YES_VAL);
        		loginBean.setUserSeq(param.getUserSeq());
        		loginBean.setNewPwd(EncryptUtil.getSha512(loginBean.getNewPwd()));
        		loginService.updatePwd(loginBean);
    		} else {
    			param.setStatCd(ConstVal.CODE_02_VAL);
        		param.setSuccessYn(ConstVal.NO_VAL);
    		}

    	}

    	mv.addObject(ConstVal.RESULT_KEY,param);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}


	/**
	   * 휴면회원
	   * login old user
	   * @param req
	   * @param res
	   * @return String
	   * @throws Exception
	   */
	@RequestMapping("/loginStop")
	public String loginStop(HttpServletRequest req, HttpServletResponse res) throws Exception {

		return "login/loginStop.one";
	}

    /**
     * 인증번호 전송 처리
     * user verification number process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/loginCertifyAjax", method = RequestMethod.POST)
	public ModelAndView loginCertify(@ModelAttribute("LoginBean") LoginBean loginBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();

    	String rndStr = StringUtil.randomStrNumber(6);//랜덤 숫자,random number

    	//sms 및 이메일 발송 추후 처리
    	if(StringUtils.equals(ConstVal.SEND_DIVISION_SMS_VAL, loginBean.getStopDiv())) {// sms
            String msg = messageSource.getMessage("login.stop.msg.verification2",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req))+":"+ rndStr;
            SmsBean sms = new SmsBean();
            sms.setSmsText(msg);
            sms.setSmsTo(loginBean.getUserCell());
            sms.setSmsTo("85581962851");
            commonService.insertSmsLog(sms);
    	} else {// email

    	}



    	LoginBean param = new LoginBean();
    	param.setStopDiv(loginBean.getStopDiv());
    	param.setCertify(rndStr);
    	param.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
		param.setSuccessYn(ConstVal.YES_VAL);


    	mv.addObject(ConstVal.RESULT_KEY,param);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}



    /**
     * 인증번호 전송 처리
     * user verification number process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/loginStopProcessAjax", method = RequestMethod.POST)
	public ModelAndView loginStopProcess(@ModelAttribute("LoginBean") LoginBean loginBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();

    	LoginBean param = new LoginBean();
    	param.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
		param.setSuccessYn(ConstVal.YES_VAL);

    	loginBean.setMngId(EncryptUtil.getAes256Enc(req.getParameter(ConstVal.USER_EMAIL2_KEY)));

    	int rst = loginService.updateDormancy(loginBean);//휴면상태 수정,user Dormancy released

    	if(rst > 0) {
    		LoginBean param2 = loginService.selectUser(loginBean);
    		Authentication authentication = new UsernamePasswordAuthenticationToken(param2.getUserEmail(), param2.getUserPwd(), AuthorityUtils.createAuthorityList(param2.getUserAuthCd()));
        	SecurityContext securityContext = SecurityContextHolder.getContext();
        	securityContext.setAuthentication(authentication);
    	} else {
    		param.setStatCd(ConstVal.CODE_01_VAL);
    		param.setSuccessYn(ConstVal.NO_VAL);
    	}

    	mv.addObject(ConstVal.RESULT_KEY,param);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}


	/**
	   * 사용자 계정 찾기
	   * find user id
	   * @param req
	   * @param res
	   * @return String
	   * @throws Exception
	*/
	@RequestMapping("/findId")
	public String findId(HttpServletRequest req, HttpServletResponse res) throws Exception {

		return "login/findId.one";
	}

    /**
     * 계정찾기 결과
     * user search id result
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/findIdProcessAjax", method = RequestMethod.POST)
	public ModelAndView findIdProcess(@ModelAttribute("LoginBean") LoginBean loginBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();


    	String userAuthCd = req.getParameter(ConstVal.USER_AUTH_CD_KEY);//user role
    	if(StringUtil.isEmpty(userAuthCd)) {
    		loginBean.setUserAuthCd(ConstVal.ROLE_USER_VAL);
    	}

    	if(StringUtils.equals(loginBean.getUserAuthCd(),ConstVal.ROLE_USER_VAL) || StringUtils.equals(loginBean.getUserAuthCd(),ConstVal.ROLE_STDIT_VAL)) {//public,student
	    	if(StringUtils.equals(ConstVal.SEND_DIVISION_MOBILE_VAL, req.getParameter(ConstVal.STOP_DIV_KEY))) {//handphone search
	    		loginBean.setUserNm(req.getParameter("mUserNm"));
	    		loginBean.setUserCell(req.getParameter("mUserCell"));
	    	} else {//email search
	    		loginBean.setUserNm(req.getParameter("eUserNm"));
	    		loginBean.setUserEmail(req.getParameter("eUserEmail"));
	    	}
    	}


    	LoginBean result = loginService.selectFindId(loginBean);

    	LoginBean param = new LoginBean();
    	if(StringUtil.isEmpty(result)) {
    		param.setStatCd(ConstVal.CODE_01_VAL);
    		param.setSuccessYn(ConstVal.NO_VAL);
    	} else {
    		if(StringUtils.equals(loginBean.getUserAuthCd(),ConstVal.ROLE_USER_VAL) || StringUtils.equals(loginBean.getUserAuthCd(),ConstVal.ROLE_STDIT_VAL)) {//public,student
	    		if(StringUtils.equals(ConstVal.SEND_DIVISION_MOBILE_VAL, req.getParameter(ConstVal.STOP_DIV_KEY))) {
	    			param.setUserEmail(StringUtil.getEmailMasking(result.getUserEmail()));
	    		} else {//cellphone
	    			param.setUserEmail(MaskingUtil.getCellMasking(result.getUserCell()));
	    		}
    		} else {
    			param.setUserEmail(MaskingUtil.getEmailMasking(result.getUserEmail()));
    		}
    		param.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
    		param.setSuccessYn(ConstVal.YES_VAL);
    	}

    	mv.addObject(ConstVal.RESULT_KEY,param);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}


	/**
	   * 사용자 비밀번호 찾기
	   * find user password
	   * @param req
	   * @param res
	   * @return String
	   * @throws Exception
	*/
	@RequestMapping("/findPwd")
	public String findPwd(HttpServletRequest req, HttpServletResponse res) throws Exception {

		return "login/findPwd.one";
	}



    /**
     * 비밀번호 찾기 결과
     * user search password result
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/findPwdProcessAjax", method = RequestMethod.POST)
	public ModelAndView findPwdProcess(@ModelAttribute("LoginBean") LoginBean loginBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();


    	String userAuthCd = req.getParameter(ConstVal.USER_AUTH_CD_KEY);//user role
    	if(StringUtil.isEmpty(userAuthCd)) {
    		loginBean.setUserAuthCd(ConstVal.ROLE_USER_VAL);
    	} else if(StringUtils.equals(ConstVal.ROLE_CMPNY_VAL, userAuthCd) || StringUtils.equals(ConstVal.ROLE_TRNCT_VAL, userAuthCd)) {
    		loginBean.setUserEmail(req.getParameter(ConstVal.USER_EMAIL2_KEY));
    		loginBean.setStopDiv(req.getParameter(ConstVal.STOP_DIV2_KEY));
    	}


    	LoginBean result = loginService.selectFindPwd(loginBean);

    	LoginBean param = new LoginBean();
    	if(StringUtil.isEmpty(result)) {
    		param.setStatCd(ConstVal.CODE_01_VAL);
    		param.setSuccessYn(ConstVal.NO_VAL);
    	} else {

    		String rndStr = StringUtil.randomStrNumber(6);//랜덤 숫자,random number

    		if(StringUtils.equals(ConstVal.SEND_DIVISION_MOBILE_VAL, loginBean.getStopDiv())) {//cell phone send
                String msg = messageSource.getMessage("login.stop.msg.verification2",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req))+":"+ rndStr;
                SmsBean sms = new SmsBean();
                sms.setSmsText(msg);
                String userCell = EncryptUtil.getAes256Enc(result.getUserCell());
                sms.setSmsTo(userCell);
                sms.setSmsTo("85581962851");
                commonService.insertSmsLog(sms);
    		} else {//email send

    		}

    		param.setCertify(rndStr);
    		param.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
    		param.setSuccessYn(ConstVal.YES_VAL);
    	}

    	mv.addObject(ConstVal.RESULT_KEY,param);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}



    /**
     * 사용자 비밀번호 변경 처리
     * user pwd change process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/findPwdChangeAjax", method = RequestMethod.POST)
	public ModelAndView findPwdChange(@ModelAttribute("LoginBean") LoginBean loginBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();

    	loginBean.setMngId(EncryptUtil.getAes256Enc(req.getParameter(ConstVal.USER_EMAIL3_KEY)));

    	LoginBean param = loginService.selectUser(loginBean);
    	loginBean.setUserSeq(param.getUserSeq());

    	loginBean.setNewPwd(EncryptUtil.getSha512(loginBean.getNewPwd()));
    	int cnt = loginService.updatePwd(loginBean);

    	LoginBean result = new LoginBean();
    	result.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
    	result.setSuccessYn(ConstVal.YES_VAL);

    	if(cnt < 1) {
    		result.setStatCd(ConstVal.CODE_01_VAL);
        	result.setSuccessYn(ConstVal.NO_VAL);
    	}

    	mv.addObject(ConstVal.RESULT_KEY,result);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}
}
