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
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.privt.bean.CondInterestBean;
import ony.cpes.external.mypage.privt.service.InterestService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/private/interest")
@Controller
public class InterestController extends BaseController{
	private static Log log = LogFactory.getLog(InterestController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private InterestService interestService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 관심채용공고 목록
	 * interest vacancy list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/vacancyList")
	  public ModelAndView vacancyList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInterestBean") CondInterestBean condInterestBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/interest/vacancyList.left");


		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = interestService.selectVacancyListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, interestService.selectVacancyList(condInterestBean));
    	}

		return mv;

	}

	/**
	 * 관심기업 목록
	 * interest company list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/compnyList")
	  public ModelAndView compnyList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInterestBean") CondInterestBean condInterestBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/interest/compnyList.left");

		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = interestService.selectCompnyListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, interestService.selectCompnyList(condInterestBean));
    	}

		return mv;

	}

	/**
	 * 관심채용행사 목록
	 * interest fair list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/fairList")
	  public ModelAndView fairList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInterestBean") CondInterestBean condInterestBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/interest/fairList.left");

		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
 		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = interestService.selectFairListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, interestService.selectFairList(condInterestBean));
    	}

		return mv;

	}

	/**
	 * 관심교육기관 목록
	 * interest education instt list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/eduInsttList")
	  public ModelAndView eduInsttList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInterestBean") CondInterestBean condInterestBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/interest/eduInsttList.left");

		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = interestService.selectEduInsttListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, interestService.selectEduInsttList(condInterestBean));
    	}

		return mv;

	}

	/**
	 * 관심교육프로그램 목록
	 * interest education program list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/eduTrnngList")
	  public ModelAndView eduTrnngList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInterestBean") CondInterestBean condInterestBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/interest/eduTrnngList.left");

		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = interestService.selectEduTrnngListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, interestService.selectEduTrnngList(condInterestBean));
    	}

		return mv;

	}

	/**
	 * 관심직업훈련 목록
	 * interest education program nea list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/eduTrnngNeaList")
	  public ModelAndView eduTrnngNeaList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInterestBean") CondInterestBean condInterestBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/interest/eduTrnngNeaList.left");

		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = interestService.selectEduTrnngNeaListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, interestService.selectEduTrnngNeaList(condInterestBean));
    	}

		return mv;

	}

}
