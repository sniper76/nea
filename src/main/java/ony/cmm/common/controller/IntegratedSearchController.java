package ony.cmm.common.controller;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

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

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.CondIntegratedSearchBean;
import ony.cmm.common.bean.SynonymBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.service.IntegratedSearchService;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.privt.bean.EduTrnngBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.vacancy.bean.VacancyBean;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@Controller
public class IntegratedSearchController extends BaseController {

	private static Log log = LogFactory.getLog(IntegratedSearchController.class);

	@Autowired
	CommonService commonService;

	@Autowired
	IntegratedSearchService integratedSearchService;

	@RequestMapping("/searchResult")
	public String searchResult(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "common/searchResult.one";
	}

	/**
	 * 통합검색::Vacancy 조회
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/searchResultVacancyAjax")
	public ModelAndView searchResultVacancyAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("CondIntegratedSearchBean") CondIntegratedSearchBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
		String langCd = locale.getLanguage().toUpperCase();

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	conditionBean.setLangCd(langCd);
  		conditionBean.setRegUserSeq(userSeq);
  		conditionBean.setCd(userAuthCd);

	  	int totCnt = 0;
	    List<VacancyBean> dataList = null;
	    List<SynonymBean> synonymList = null;

	    if(conditionBean == null || conditionBean.getCondText() == null || "".equals(conditionBean.getCondText().trim())) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
    		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    	return mv;
	    }

	    synonymList = integratedSearchService.selectIntegratedSearchSynonymList(conditionBean);
	    conditionBean.setSynonymList(synonymList);

	    totCnt= integratedSearchService.selectIntegratedSearchVacancyListCnt(conditionBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			dataList = integratedSearchService.selectIntegratedSearchVacancyList(conditionBean);
			mv.addObject(ConstVal.RESULT_LIST_KEY, dataList);
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 통합검색::Resume 조회
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/searchResultResumeAjax")
	public ModelAndView searchResultResumeAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("CondIntegratedSearchBean") CondIntegratedSearchBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
		String langCd = locale.getLanguage().toUpperCase();

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	conditionBean.setLangCd(langCd);
  		conditionBean.setRegUserSeq(userSeq);
  		conditionBean.setCd(userAuthCd);

	  	int totCnt = 0;
	    List<ResumeBean> dataList = null;
	    List<SynonymBean> synonymList = null;

	    if(conditionBean == null || conditionBean.getCondText() == null || "".equals(conditionBean.getCondText().trim())) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
    		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    	return mv;
	    }

	    synonymList = integratedSearchService.selectIntegratedSearchSynonymList(conditionBean);
	    conditionBean.setSynonymList(synonymList);

	    totCnt= integratedSearchService.selectIntegratedSearchResumeListCnt(conditionBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			dataList = integratedSearchService.selectIntegratedSearchResumeList(conditionBean);
			mv.addObject(ConstVal.RESULT_LIST_KEY, dataList);
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 통합검색::Job Fair 조회
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/searchResultJobFairAjax")
	public ModelAndView searchResultJobFairAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("CondIntegratedSearchBean") CondIntegratedSearchBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
		String langCd = locale.getLanguage().toUpperCase();

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	conditionBean.setLangCd(langCd);
  		conditionBean.setRegUserSeq(userSeq);
  		conditionBean.setCd(userAuthCd);

	  	int totCnt = 0;
	    List<JobFairCenterBean> dataList = null;
	    List<SynonymBean> synonymList = null;

	    if(conditionBean == null || conditionBean.getCondText() == null || "".equals(conditionBean.getCondText().trim())) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
    		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    	return mv;
	    }

	    synonymList = integratedSearchService.selectIntegratedSearchSynonymList(conditionBean);
	    conditionBean.setSynonymList(synonymList);

	    totCnt= integratedSearchService.selectIntegratedSearchJobFairListCnt(conditionBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			dataList = integratedSearchService.selectIntegratedSearchJobFairList(conditionBean);
			mv.addObject(ConstVal.RESULT_LIST_KEY, dataList);
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 통합검색::Training Program 조회
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/searchResultTrainingProgramAjax")
	public ModelAndView searchResultTrainingProgramAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("CondIntegratedSearchBean") CondIntegratedSearchBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
		String langCd = locale.getLanguage().toUpperCase();

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	conditionBean.setLangCd(langCd);
  		conditionBean.setRegUserSeq(userSeq);
  		conditionBean.setCd(userAuthCd);

	  	int totCnt = 0;
	    List<EduTrnngBean> dataList = null;
	    List<SynonymBean> synonymList = null;

	    if(conditionBean == null || conditionBean.getCondText() == null || "".equals(conditionBean.getCondText().trim())) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
    		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    	return mv;
	    }

	    synonymList = integratedSearchService.selectIntegratedSearchSynonymList(conditionBean);
	    conditionBean.setSynonymList(synonymList);

	    totCnt= integratedSearchService.selectIntegratedSearchTrainingProgramListCnt(conditionBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			dataList = integratedSearchService.selectIntegratedSearchTrainingProgramList(conditionBean);
			mv.addObject(ConstVal.RESULT_LIST_KEY, dataList);
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 통합검색::NEA Training 조회
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/searchResultNEATrainingAjax")
	public ModelAndView searchResultNEATrainingAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("CondIntegratedSearchBean") CondIntegratedSearchBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
		String langCd = locale.getLanguage().toUpperCase();

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	conditionBean.setLangCd(langCd);
  		conditionBean.setRegUserSeq(userSeq);
  		conditionBean.setCd(userAuthCd);

	  	int totCnt = 0;
	    List<EduTrnngBean> dataList = null;
	    List<SynonymBean> synonymList = null;

	    if(conditionBean == null || conditionBean.getCondText() == null || "".equals(conditionBean.getCondText().trim())) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
    		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    	return mv;
	    }

	    synonymList = integratedSearchService.selectIntegratedSearchSynonymList(conditionBean);
	    conditionBean.setSynonymList(synonymList);

	    totCnt= integratedSearchService.selectIntegratedSearchNEATrainingListCnt(conditionBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			dataList = integratedSearchService.selectIntegratedSearchNEATrainingList(conditionBean);
			mv.addObject(ConstVal.RESULT_LIST_KEY, dataList);
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 통합검색::Related Institution 조회
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/searchResultRelatedInstitutionAjax")
	public ModelAndView searchResultRelatedInstitutionAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("CondIntegratedSearchBean") CondIntegratedSearchBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
		String langCd = locale.getLanguage().toUpperCase();

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	conditionBean.setLangCd(langCd);
  		conditionBean.setRegUserSeq(userSeq);
  		conditionBean.setCd(userAuthCd);

	  	int totCnt = 0;
	    List<InsttMemBean> dataList = null;
	    List<SynonymBean> synonymList = null;

	    if(conditionBean == null || conditionBean.getCondText() == null || "".equals(conditionBean.getCondText().trim())) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
    		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    	return mv;
	    }

	    synonymList = integratedSearchService.selectIntegratedSearchSynonymList(conditionBean);
	    conditionBean.setSynonymList(synonymList);

	    totCnt= integratedSearchService.selectIntegratedSearchRelatedInstitutionListCnt(conditionBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			dataList = integratedSearchService.selectIntegratedSearchRelatedInstitutionList(conditionBean);
			mv.addObject(ConstVal.RESULT_LIST_KEY, dataList);
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

}
