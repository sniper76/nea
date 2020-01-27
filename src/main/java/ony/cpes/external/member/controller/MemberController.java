package ony.cpes.external.member.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.CertifyBean;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cpes.external.member.bean.CompanyBean;
import ony.cpes.external.member.bean.InstitutionBean;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.member.service.MemberService;
import ony.framework.BaseController;
import ony.framework.util.Encryption;
import ony.framework.util.StringUtil;




@RequestMapping("/member")
@Controller
public class MemberController extends BaseController{

  private static Log log = LogFactory.getLog(MemberController.class);

  @Autowired
  private CommonService commonService;

  @Autowired
  private MemberService memberService;

  @Autowired SessionLocaleResolver localeResolver;

  /**
   * 회원가입
   * member join
   * @param req
   * @param res
   * @return String
   * @throws Exception
   */
    @RequestMapping("/join")
	public String join(Locale locale, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	String lang = locale.getLanguage().toUpperCase();
    	log.info("====================lang="+lang);
		return "member/join.one";
	}

    /**
     * 회원가입 상단 공통 정보
     * member join info1
     * @param req
     * @param res
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/joinInfoAjax", method = RequestMethod.POST)
  	public ModelAndView joinInfo(Locale locale, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	if(StringUtil.getCurLangCode(locale)) {
    		return new ModelAndView( "member/joinInfo.empty" );
    	} else {
    		return new ModelAndView( "member/joinInfoKhmer.empty" );
    	}
  	}

    /**
     * 회원가입 1단계 약관동의
     * member join 1 step
     * @param req
     * @param res
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/joinStepOne", method = RequestMethod.POST)
	public ModelAndView joinStepOne(Locale locale, HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/joinStepOneKhmer.one");

    	if(StringUtil.getCurLangCode(locale)) {//ko or en
    		mv.setViewName("member/joinStepOneEn.one");

    	}

    	return mv;
  	}



    /**
     * 회원가입 1단계 약관동의
     * member join 1 step
     * @param req
     * @param res
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/joinStepOneAjax", method = RequestMethod.POST)
	public ModelAndView joinGenStepOne(Locale locale, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	String userAuthCd = req.getParameter(ConstVal.USER_AUTH_CD_KEY);

    	if(StringUtil.getCurLangCode(locale)) {//ko or en
    		if(StringUtils.equals(ConstVal.ROLE_USER_VAL,userAuthCd)) {
    			return new ModelAndView( "member/joinStepOneUser.empty" );
    		} else if(StringUtils.equals(ConstVal.ROLE_STDIT_VAL,userAuthCd)) {
    			return new ModelAndView( "member/joinStepOneStudent.empty" );
    		} else if(StringUtils.equals(ConstVal.ROLE_CMPNY_VAL,userAuthCd)) {
    			return new ModelAndView( "member/joinStepOneCompany.empty" );
    		} else {
    			return new ModelAndView( "member/joinStepOneTrnct.empty" );
    		}

    	} else {
       		if(StringUtils.equals(ConstVal.ROLE_USER_VAL,userAuthCd)) {
    			return new ModelAndView( "member/joinStepOneUserKhmer.empty" );
    		} else if(StringUtils.equals(ConstVal.ROLE_STDIT_VAL,userAuthCd)) {
    			return new ModelAndView( "member/joinStepOneStudentKhmer.empty" );
    		} else if(StringUtils.equals(ConstVal.ROLE_CMPNY_VAL,userAuthCd)) {
    			return new ModelAndView( "member/joinStepOneCompanyKhmer.empty" );
    		} else {
    			return new ModelAndView( "member/joinStepOneTrnctKhmer.empty" );
    		}
    	}
  	}



    /**
       * 회원가입 2단계 정보 입력
       * member join 2 step
       * @param req
       * @param res
       * @return String
       * @throws Exception
    */
	@RequestMapping(value = "/joinStepTwo", method = RequestMethod.POST)
    public ModelAndView joinStepTwo(Locale locale, HttpServletRequest req, HttpServletResponse res) throws Exception {
		String userAuthCd = req.getParameter(ConstVal.USER_AUTH_CD_KEY);
		ModelAndView mv = new ModelAndView();
		String langCd = locale.getLanguage().toUpperCase();
		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setLangCd(langCd);



	  	if(StringUtils.equals(ConstVal.ROLE_USER_VAL,userAuthCd)) {//pblic user
	  		mv.setViewName("member/joinStepTwoUser.one" );
	  	} else if(StringUtils.equals(ConstVal.ROLE_STDIT_VAL,userAuthCd)) {//student
	  		mv.setViewName("member/joinStepTwoStudent.one" );
	  	} else if(StringUtils.equals(ConstVal.ROLE_CMPNY_VAL,userAuthCd)) {//company
	  		conditionBean.setCondGrpCd(ConstVal.GRP_CD_COMPNY_TYPE_CD_VAL);
	  		mv.addObject(ConstVal.RESULT_LIST_KEY,commonService.selectCommCdList(conditionBean));

	  		conditionBean.setCondGrpCd(ConstVal.GRP_CD_NATION_CD_VAL);
	  		mv.addObject(ConstVal.RESULT_LIST2_KEY,commonService.selectCommCdList(conditionBean));

	  		mv.setViewName("member/joinStepTwoCompany.one" );

	  	} else {
	  		conditionBean.setCondGrpCd(ConstVal.GRP_CD_INSTT_TYPE_CD_VAL);//Institution
	  		mv.addObject(ConstVal.RESULT_LIST_KEY,commonService.selectCommCdList(conditionBean));

	  		mv.setViewName("member/joinStepTwoTrnct.one" );
	  	}

	  	return mv;
    }


	/**
	   * 일반 회원가입 처리
	   * user join process
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	*/
	@RequestMapping(value = "/joinProcessAjax", method = RequestMethod.POST)
	public ModelAndView joinProcess(Locale locale, @ModelAttribute("MemberBean") MemberBean memberBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		CertifyBean certifyBean = new CertifyBean();
		certifyBean.setUserCell(EncryptUtil.getAes256Enc(memberBean.getUserCell()));
		certifyBean.setUserEmail(EncryptUtil.getAes256Enc(memberBean.getUserEmail()));

		if(memberService.selectEmailDupChk(certifyBean) > 0) {//email duplication check
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
		}
		if(memberService.selectCellPhoneDupChk(certifyBean) > 0) {//cell phone duplication check
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
		} else {
			memberBean.setUserPwd(EncryptUtil.getSha512(memberBean.getUserPwd()));
			memberBean.setUserCell(EncryptUtil.getAes256Enc(memberBean.getUserCell()));
			memberBean.setUserEmail(EncryptUtil.getAes256Enc(memberBean.getUserEmail()));

			if(memberService.insertMember(memberBean) > 0) {
				ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
				ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
			} else {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
			}
		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}


	/**
	   * 회사 회원가입 처리
	   * company user join process
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	*/
	@RequestMapping(value = "/joinCompanyProcessAjax", method = RequestMethod.POST)
	public ModelAndView joinCompanyProcess(Locale locale, @ModelAttribute("MemberBean") MemberBean memberBean, @ModelAttribute("CompanyBean") CompanyBean companyBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		CertifyBean certifyBean = new CertifyBean();

		certifyBean.setUserCell(EncryptUtil.getAes256Enc(companyBean.getMngerCell()));
		certifyBean.setUserEmail(EncryptUtil.getAes256Enc(companyBean.getMngerEmail()));

		if(memberService.selectEmailDupChk(certifyBean) > 0) {//email duplication check
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
		}
		if(memberService.selectCellPhoneDupChk(certifyBean) > 0) {//cell phone duplication check
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
		} else {
			if(!StringUtils.equals(ConstVal.NATION_CD_COMBOIDA_VAL, companyBean.getOwnerNationCd())) {
				companyBean.setOwnerNationCd(req.getParameter("otherNationCd"));
			}

			memberBean.setUserNmKh(companyBean.getMngerNm());
			memberBean.setUserEmail(EncryptUtil.getAes256Enc(companyBean.getMngerEmail()));
			memberBean.setUserCell(EncryptUtil.getAes256Enc(companyBean.getMngerCell()));
			memberBean.setUserPwd(EncryptUtil.getSha512(memberBean.getUserPwd()));

			if(memberService.insertCompany(memberBean,companyBean) > 0) {
				ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
				ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
			} else {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
			}
		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}

	/**
	   * 교육기관 회원가입 처리
	   * company user join process
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	*/
	@RequestMapping(value = "/joinInstitutionProcessAjax", method = RequestMethod.POST)
	public ModelAndView joinInstitutionProcess(Locale locale, @ModelAttribute("MemberBean") MemberBean memberBean, @ModelAttribute("InstitutionBean") InstitutionBean institutionBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		CertifyBean certifyBean = new CertifyBean();

		certifyBean.setUserCell(EncryptUtil.getAes256Enc(institutionBean.getInsttCell()));
		certifyBean.setUserEmail(EncryptUtil.getAes256Enc(institutionBean.getInsttEmail()));

		if(memberService.selectEmailDupChk(certifyBean) > 0) {//email duplication check
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
		} else if(memberService.selectCellPhoneDupChk(certifyBean) > 0) {//cell phone duplication check
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
		} else {

			memberBean.setUserNmKh(institutionBean.getInsttMngerNm());
			memberBean.setUserEmail(EncryptUtil.getAes256Enc(institutionBean.getInsttEmail()));
			memberBean.setUserCell(EncryptUtil.getAes256Enc(institutionBean.getInsttCell()));
			memberBean.setAddrCd(institutionBean.getInsttAddrCd());
			memberBean.setAddrDtl(institutionBean.getInsttAddrDtl());
			memberBean.setUserPwd(EncryptUtil.getSha512(memberBean.getUserPwd()));


			if(memberService.insertInstitution(memberBean,institutionBean) > 0) {
				ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
				ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
			} else {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
			}
		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}

    /**
     * 회원가입 3단계 정보 입력
     * member join 3 step
     * @param req
     * @param res
     * @return String
     * @throws Exception
  */
	@RequestMapping(value = "/joinStepThree", method = RequestMethod.POST)
	public ModelAndView joinStepThree(Locale locale, HttpServletRequest req, HttpServletResponse res) throws Exception {
		return new ModelAndView( "member/joinStepThree.one" );
	}
}
