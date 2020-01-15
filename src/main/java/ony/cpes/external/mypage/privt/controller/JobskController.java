package ony.cpes.external.mypage.privt.controller;

import java.security.Principal;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.privt.bean.CondJobskBean;
import ony.cpes.external.mypage.privt.bean.CondPrivtMemBean;
import ony.cpes.external.mypage.privt.bean.JobskBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemBean;
import ony.cpes.external.mypage.privt.service.JobskService;
import ony.framework.BaseController;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/private/jobsk")
@Controller
public class JobskController extends BaseController{
	private static Log log = LogFactory.getLog(JobskController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private JobskService jobskService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 구직신청 index
	 * private main
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondJobskBean") CondJobskBean condJobskBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/jobsk/index.left");

		condJobskBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condJobskBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	mv.addObject(ConstVal.RESULT_KEY, jobskService.selectJobskYn(condJobskBean));
    	mv.addObject(ConstVal.RESULT2_KEY, SessionUtil.getJcNm(req));
      	mv.addObject(ConstVal.RESULT3_KEY, SessionUtil.getJcTel(req));

		return mv;

	}

	/**
	 * 비구직으로 수정
	 * private info update
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/closeProcessAjax", method = RequestMethod.POST)
	public ModelAndView closeProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondJobskBean") CondJobskBean condJobskBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condJobskBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		condJobskBean.setCondUserSeq(userSeq);
  		condJobskBean.setRegUserSeq(userSeq);
  		condJobskBean.setModUserSeq(userSeq);

  		if(jobskService.updateCloseJobsk(condJobskBean) > 0) {
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);

		return mv;
	}


	/**
	 * 구직신청 화면
	 * jobseeker form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/write")
	public ModelAndView write(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondJobskBean") CondJobskBean condJobskBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/jobsk/write.left");

		condJobskBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condJobskBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	mv.addObject(ConstVal.RESULT_KEY, jobskService.selectJobskYn(condJobskBean));
      	mv.addObject(ConstVal.RESULT2_KEY, jobskService.selectPriResume(condJobskBean));
		return mv;

	}

	/**
	 * 비구직으로 수정
	 * private info update
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/writeProcessAjax", method = RequestMethod.POST)
	public ModelAndView writeProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("JobskBean") JobskBean jobskBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		jobskBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		jobskBean.setUserSeq(userSeq);
  		jobskBean.setRegUserSeq(userSeq);
  		jobskBean.setModUserSeq(userSeq);

  		if(jobskService.insertJobsk(jobskBean) > 0) {
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);

		return mv;
	}

	/**
	 * 구직신청 목록
	 * jobseeker list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondJobskBean") CondJobskBean condJobskBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/jobsk/list.left");

		condJobskBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condJobskBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	mv.addObject(ConstVal.RESULT_LIST_KEY, jobskService.selectJobskList(condJobskBean));
      	mv.addObject(ConstVal.RESULT_KEY, jobskService.selectJobskYn(condJobskBean));

		return mv;

	}

	/**
	 * 구직신청 삭제
	 * private info update
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/deleteProcessAjax", method = RequestMethod.POST)
	public ModelAndView deleteProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondJobskBean") CondJobskBean condJobskBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condJobskBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		condJobskBean.setCondUserSeq(userSeq);
  		condJobskBean.setRegUserSeq(userSeq);
  		condJobskBean.setModUserSeq(userSeq);

  		if(jobskService.deleteJobsk(condJobskBean) > 0) {
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);

		return mv;
	}


	/**
	 * 알선신청
	 * private info update
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/urgencyProcessAjax", method = RequestMethod.POST)
	public ModelAndView urgencyProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondJobskBean") CondJobskBean condJobskBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condJobskBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		condJobskBean.setCondUserSeq(userSeq);
  		condJobskBean.setRegUserSeq(userSeq);
  		condJobskBean.setModUserSeq(userSeq);

  		if(jobskService.updateUrgencyResume(condJobskBean) > 0) {
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);

		return mv;
	}


	/**
	 * 구직신청 index
	 * private main
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/view")
	public ModelAndView view(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondJobskBean") CondJobskBean condJobskBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/jobsk/view.left");


		condJobskBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condJobskBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	JobskBean jobskBean = jobskService.selectJobsk(condJobskBean);
      	if(StringUtil.isEmpty(jobskBean)) {
      		mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
    		return mv;
      	}

      	mv.addObject(ConstVal.RESULT_KEY, jobskBean);
    	mv.addObject(ConstVal.RESULT2_KEY, SessionUtil.getJcNm(req));
      	mv.addObject(ConstVal.RESULT3_KEY, SessionUtil.getJcTel(req));

		return mv;

	}

}
