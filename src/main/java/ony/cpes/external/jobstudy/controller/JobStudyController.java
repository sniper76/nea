package ony.cpes.external.jobstudy.controller;

import java.security.Principal;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.bulletin.bean.BulletinBean;
import ony.cpes.external.bulletin.bean.BulletinConfigBean;
import ony.cpes.external.bulletin.bean.CondBulletinBean;
import ony.cpes.external.counsel.bean.CounselBean;
import ony.cpes.external.jobstudy.bean.CondJobStudyBean;
import ony.cpes.external.jobstudy.service.JobStudyService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/jobStudy")
@Controller
public class JobStudyController extends BaseController{
	private static Log log = LogFactory.getLog(JobStudyController.class);


	@Autowired
	private JobStudyService jobStudyService;


	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	/**
	 * 직업탐구 목록
	 * job study list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/list")
	public ModelAndView list(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondJobStudyBean") CondJobStudyBean condJobStudyBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {


	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobStudy/list.one");//게시판 기본유형,BASIC TYPE

	  	condJobStudyBean.setCondDiv(ConstVal.ISCD_DIV_VAL);
	  	condJobStudyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	  	mv.addObject(ConstVal.RESULT_LIST_KEY, jobStudyService.selectJobStudyOneLvlList(condJobStudyBean));


	  	return mv;

	}

    /**
     * 직업탐구 레벨별 조회
     * job study level search
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/lvlListAjax", method = RequestMethod.POST)
  	public ModelAndView lvlListAjax(Locale locale,
  			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
  			@ModelAttribute("CondJobStudyBean") CondJobStudyBean condJobStudyBean,
  			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();

      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

      	condJobStudyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
      	condJobStudyBean.setCondDiv(ConstVal.ISCD_DIV_VAL);

      	ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_LIST_KEY, jobStudyService.selectJobStudyLvlList(condJobStudyBean));
		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);

	  	return mv;
  	}


	/**
	 * 직업탐구 상세
	 * job study view
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/view")
	public ModelAndView view(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondJobStudyBean") CondJobStudyBean condJobStudyBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {


	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobStudy/view.one");//게시판 기본유형,BASIC TYPE

	  	condJobStudyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	  	mv.addObject(ConstVal.RESULT_KEY, jobStudyService.selectJobStudy(condJobStudyBean));


	  	return mv;

	}
}
