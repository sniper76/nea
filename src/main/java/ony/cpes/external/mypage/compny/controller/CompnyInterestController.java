package ony.cpes.external.mypage.compny.controller;

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
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.bean.CondInterestBean;
import ony.cpes.external.mypage.compny.service.CompnyInterestService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/compny/interest")
@Controller
public class CompnyInterestController extends BaseController{
	private static Log log = LogFactory.getLog(CompnyInterestController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private CompnyInterestService compnyInterestService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 채용공고를 관심 등록한 인재
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
		mv.setViewName("mypage/compny/interest/vacancyList.left");


		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
       	condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = compnyInterestService.selectVacancyListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyInterestService.selectVacancyList(condInterestBean));
    	}

		return mv;

	}

	/**
	 * 관심회사로 등록한 인재
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
		mv.setViewName("mypage/compny/interest/compnyList.left");

		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = compnyInterestService.selectCompnyListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyInterestService.selectCompnyList(condInterestBean));
    	}

		return mv;

	}

	/**
	 * 관심인재 목록
	 * interest resume list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/resumeList")
	  public ModelAndView resumeList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInterestBean") CondInterestBean condInterestBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/interest/resumeList.left");

		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = compnyInterestService.selectResumeListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyInterestService.selectResumeList(condInterestBean));
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
		mv.setViewName("mypage/compny/interest/fairList.left");


		condInterestBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condInterestBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		condInterestBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condInterestBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condInterestBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = compnyInterestService.selectFairListCnt(condInterestBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyInterestService.selectFairList(condInterestBean));
    	}

		return mv;

	}
}
