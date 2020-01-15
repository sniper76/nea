package ony.cpes.external.vacancy.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.CommonBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.vacancy.bean.CondVacancyBean;
import ony.cpes.external.vacancy.bean.VacancyBean;
import ony.cpes.external.vacancy.service.VacancyService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;


@RequestMapping("/vacancy")
@Controller
public class VacancyController  extends BaseController {
	  private static Log log = LogFactory.getLog(VacancyController.class);

	  @Autowired
	  private CommonService commonService;

	  @Autowired
	  private VacancyService vacancyService;


	  @Autowired SessionLocaleResolver localeResolver;

	  @Resource(name = "propertiesService")
	  protected EgovPropertyService propertiesService;


	  @Autowired MessageSource messageSource;




	/**
	 * 채용정보 상세
	 * vacancy detail view
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/view")
	public ModelAndView view(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/view.one");

	  	if(StringUtil.isEmpty(condVacancyBean.getCondSeq())) {//잘못된 접근
	  		mv.addObject(ConstVal.CONN_YN_KEY, ConstVal.NO_VAL);
	  		return mv;
	  	}


      	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

      	if(principal != null) {
      		condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	}


  		VacancyBean vacancyBean = vacancyService.selectVacancy(condVacancyBean);

  		if(StringUtil.isEmpty(vacancyBean)) {//데이터 없음
  			mv.addObject(ConstVal.DATA_EXIST_YN_KEY, ConstVal.NO_VAL);
  			return mv;
  		}
  		mv.addObject(ConstVal.RESULT_KEY, vacancyBean);

  		if(principal != null) {
  			mv.addObject("applicResult", vacancyService.selectVacancyApplic(condVacancyBean));
  			mv.addObject("offerResult", vacancyService.selectVacancyOffer(condVacancyBean));
  			mv.addObject("intvwResult", vacancyService.selectApplicIntvw(condVacancyBean));
  		}



  		return mv;
	}


	/**
	 * 채용공고 index
	 * vacancy search index
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/index")
	public ModelAndView index(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/index.one");

      	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondCntryId(ConstVal.ONE_VAL);

      	if(principal != null) {
      		condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	}

      	mv.addObject(ConstVal.RESULT_LIST2_KEY, commonService.selectLocCdList(conditionBean));
      	mv.addObject(ConstVal.ISCO_LIST_KEY, commonService.selectIscoCdList(conditionBean));

	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_FORM_CD_VAL);
	  	mv.addObject("employFormCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
	  	mv.addObject("preferEmploymtTypeCd", commonService.selectCommCdList(conditionBean));//	//고용 형태

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
	  	mv.addObject("employCtrctCd", commonService.selectCommCdList(conditionBean));//	//고용 계약조건

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_MIN_EDU_DEGREE_CD_VAL);
	  	mv.addObject("minEduDegreeCd", commonService.selectCommCdList(conditionBean));//최소교육

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFERNT_COND_CD_VAL);
	  	mv.addObject("preferntCondCd", commonService.selectCommCdList(conditionBean));//우대조건

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
	  	mv.addObject("langCd", commonService.selectCommCdList(conditionBean));//	//외국어

  		return mv;
	}


	/**
	 * 채용공고 상세검색
	 * vacancy detail search
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/dtlSearch")
	public ModelAndView dtlSearch(Locale locale,
				@RequestParam(required = false, defaultValue = "1") int currentPageNo,
				@RequestParam(required = false, defaultValue = "10") int pageUnit,
				@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/searchList.one");

      	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondCntryId(ConstVal.ONE_VAL);

      	if(principal != null) {
      		condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	}


      	if(StringUtils.isEmpty(condVacancyBean.getCondDiv()) || !StringUtils.pathEquals(ConstVal.DIV_SEARCH_DTL_VAL, condVacancyBean.getCondDiv())) {
      		condVacancyBean.setCondDiv(ConstVal.DIV_SEARCH_VAL);//일반검색
      	}

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

	  	int totCnt = vacancyService.selectSearchListCnt(condVacancyBean);
	  	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, vacancyService.selectSearchList(condVacancyBean));
    	}

    	mv.addObject(ConstVal.RESULT_KEY, vacancyService.selectVacancyTodayCnt(condVacancyBean));



      	mv.addObject(ConstVal.RESULT_LIST2_KEY, commonService.selectLocCdList(conditionBean));
      	mv.addObject(ConstVal.ISCO_LIST_KEY, commonService.selectIscoCdList(conditionBean));

	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_FORM_CD_VAL);
	  	mv.addObject("employFormCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
	  	mv.addObject("preferEmploymtTypeCd", commonService.selectCommCdList(conditionBean));//	//고용 형태

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
	  	mv.addObject("employCtrctCd", commonService.selectCommCdList(conditionBean));//	//고용 계약조건

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_MIN_EDU_DEGREE_CD_VAL);
	  	mv.addObject("minEduDegreeCd", commonService.selectCommCdList(conditionBean));//최소교육

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFERNT_COND_CD_VAL);
	  	mv.addObject("preferntCondCd", commonService.selectCommCdList(conditionBean));//우대조건

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
	  	mv.addObject("langCd", commonService.selectCommCdList(conditionBean));//	//외국어

  		return mv;
	}


	/**
	 * 인턴 채용공고 상세검색
	 * vacancy intern detail search
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/internDtlSearch")
	public ModelAndView internDtlSearch(Locale locale,
				@RequestParam(required = false, defaultValue = "1") int currentPageNo,
				@RequestParam(required = false, defaultValue = "10") int pageUnit,
				@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/internSearchList.one");

      	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondCntryId(ConstVal.ONE_VAL);

		List<String> condVacancyTypeCd = new ArrayList<String>();//인턴만 조회
		condVacancyTypeCd.add("EFR0000000005");
		condVacancyBean.setCondVacancyTypeCd(condVacancyTypeCd);

      	if(principal != null) {
      		condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	}


      	if(StringUtils.isEmpty(condVacancyBean.getCondDiv()) || !StringUtils.pathEquals(ConstVal.DIV_SEARCH_DTL_VAL, condVacancyBean.getCondDiv())) {
      		condVacancyBean.setCondDiv(ConstVal.DIV_SEARCH_VAL);//일반검색
      	}

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

	  	int totCnt = vacancyService.selectSearchListCnt(condVacancyBean);
	  	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, vacancyService.selectSearchList(condVacancyBean));
    	}

    	mv.addObject(ConstVal.RESULT_KEY, vacancyService.selectVacancyTodayCnt(condVacancyBean));



      	mv.addObject(ConstVal.RESULT_LIST2_KEY, commonService.selectLocCdList(conditionBean));
      	mv.addObject(ConstVal.ISCO_LIST_KEY, commonService.selectIscoCdList(conditionBean));


		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
	  	mv.addObject("preferEmploymtTypeCd", commonService.selectCommCdList(conditionBean));//	//고용 형태

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
	  	mv.addObject("employCtrctCd", commonService.selectCommCdList(conditionBean));//	//고용 계약조건

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_MIN_EDU_DEGREE_CD_VAL);
	  	mv.addObject("minEduDegreeCd", commonService.selectCommCdList(conditionBean));//최소교육

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFERNT_COND_CD_VAL);
	  	mv.addObject("preferntCondCd", commonService.selectCommCdList(conditionBean));//우대조건

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
	  	mv.addObject("langCd", commonService.selectCommCdList(conditionBean));//	//외국어

  		return mv;
	}


	/**
	 * 아르바이트 채용공고 상세검색
	 * vacancy part time detail search
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/partTimeDtlSearch")
	public ModelAndView partTimeDtlSearch(Locale locale,
				@RequestParam(required = false, defaultValue = "1") int currentPageNo,
				@RequestParam(required = false, defaultValue = "10") int pageUnit,
				@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/partTimeSearchList.one");

      	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondCntryId(ConstVal.ONE_VAL);

		List<String> condPreferEmploymtTypeCd = new ArrayList<String>();//인턴만 조회
		condPreferEmploymtTypeCd.add("PET0000000002");
		condVacancyBean.setCondPreferEmploymtTypeCd(condPreferEmploymtTypeCd);

      	if(principal != null) {
      		condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	}


      	if(StringUtils.isEmpty(condVacancyBean.getCondDiv()) || !StringUtils.pathEquals(ConstVal.DIV_SEARCH_DTL_VAL, condVacancyBean.getCondDiv())) {
      		condVacancyBean.setCondDiv(ConstVal.DIV_SEARCH_VAL);//일반검색
      	}

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

	  	int totCnt = vacancyService.selectSearchListCnt(condVacancyBean);
	  	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, vacancyService.selectSearchList(condVacancyBean));
    	}

    	mv.addObject(ConstVal.RESULT_KEY, vacancyService.selectVacancyTodayCnt(condVacancyBean));



      	mv.addObject(ConstVal.RESULT_LIST2_KEY, commonService.selectLocCdList(conditionBean));
      	mv.addObject(ConstVal.ISCO_LIST_KEY, commonService.selectIscoCdList(conditionBean));


		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
	  	mv.addObject("preferEmploymtTypeCd", commonService.selectCommCdList(conditionBean));//	//고용 형태

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
	  	mv.addObject("employCtrctCd", commonService.selectCommCdList(conditionBean));//	//고용 계약조건

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_MIN_EDU_DEGREE_CD_VAL);
	  	mv.addObject("minEduDegreeCd", commonService.selectCommCdList(conditionBean));//최소교육

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFERNT_COND_CD_VAL);
	  	mv.addObject("preferntCondCd", commonService.selectCommCdList(conditionBean));//우대조건

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
	  	mv.addObject("langCd", commonService.selectCommCdList(conditionBean));//	//외국어

  		return mv;
	}



	/**
	 * 오늘의 인기기업
	 * pouplar company
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/popularCompny")
	public ModelAndView popularCompny(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "12") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/popularCompny.one");

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
	  	String langCd = locale.getLanguage().toUpperCase();

      	// Select ISIC Code List (1 Depth)
      	conditionBean.setCondLvl("1");
		mv.addObject("isicList", commonService.selectIsicCdList(conditionBean));

		// 지역 코드 조회
      	conditionBean.setDepth(null);
		mv.addObject("locList", commonService.selectLocCdList(conditionBean));

		// 오늘의 인기기업 조회
      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
      	condVacancyBean.setLangCd(langCd);
      	condVacancyBean.setCondUserSeq(userSeq);

	  	int totCnt = 0;
	    totCnt= vacancyService.selectVacancyPopulateCompnyTodayListCnt(condVacancyBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, vacancyService.selectVacancyPopulateCompnyTodayList(condVacancyBean));
		}

		return mv;
	}

	/**
	 * 이주의 인기기업
	 * @param locale
	 * @param conditionBean
	 * @param condVacancyBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/popularCompnyWeek")
	public ModelAndView popularCompnyWeek(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "12") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/popularCompnyWeek.one");

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
	  	String langCd = locale.getLanguage().toUpperCase();

      	// 업종 콤보박스 조회 (1 Depth)
      	conditionBean.setCondLvl("1");
		mv.addObject("isicList", commonService.selectIsicCdList(conditionBean));

		// 지역 콤보박스 조회
      	conditionBean.setDepth("0");
		mv.addObject("locList", commonService.selectLocCdList(conditionBean));

		// 이주의 인기기업 조회
      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
      	condVacancyBean.setLangCd(langCd);
      	condVacancyBean.setCondUserSeq(userSeq);

	  	int totCnt = 0;
	    totCnt= vacancyService.selectVacancyPopulateCompnyByWeekListCnt(condVacancyBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, vacancyService.selectVacancyPopulateCompnyByWeekList(condVacancyBean));
		}

		return mv;
	}

	/**
	 * 이달의 인기기업
	 * @param locale
	 * @param conditionBean
	 * @param condVacancyBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/popularCompnyMonth")
	public ModelAndView popularCompnyMonth(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "12") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/popularCompnyMonth.one");

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
	  	String langCd = locale.getLanguage().toUpperCase();

      	// Select ISIC Code List (1 Depth)
      	conditionBean.setCondLvl("1");
		mv.addObject("isicList", commonService.selectIsicCdList(conditionBean));

		// 지역 코드 조회
      	conditionBean.setDepth("0");
		mv.addObject("locList", commonService.selectLocCdList(conditionBean));

		// 이달의 인기기업 조회
      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
      	condVacancyBean.setLangCd(langCd);
      	condVacancyBean.setCondUserSeq(userSeq);

	  	int totCnt = 0;
	    totCnt= vacancyService.selectVacancyPopulateCompnyByMonthListCnt(condVacancyBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, vacancyService.selectVacancyPopulateCompnyByMonthList(condVacancyBean));
		}

		return mv;
	}

	/**
	 * 누적 인기기업
	 * @param locale
	 * @param conditionBean
	 * @param condVacancyBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/popularCompnyAccumulate")
	public ModelAndView popularCompnyAccumulate(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "12") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/popularCompnyAccumulate.one");

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
	  	String langCd = locale.getLanguage().toUpperCase();

      	// Select ISIC Code List (1 Depth)
      	conditionBean.setCondLvl("1");
		mv.addObject("isicList", commonService.selectIsicCdList(conditionBean));

		// 지역 코드 조회
      	conditionBean.setDepth(null);
		mv.addObject("locList", commonService.selectLocCdList(conditionBean));

		// 누적 인기기업 조회
      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
      	condVacancyBean.setLangCd(langCd);
      	condVacancyBean.setCondUserSeq(userSeq);

	  	int totCnt = 0;
	    totCnt= vacancyService.selectVacancyPopulateCompnyByAccumulateListCnt(condVacancyBean);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, vacancyService.selectVacancyPopulateCompnyByAccumulateList(condVacancyBean));
		}

		return mv;
	}

	/**
	 * 인기 채용고공
	 * pouplar vacancy
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/popularVacancy")
	public ModelAndView popularVacancy(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("vacancy/popularVacancy.one");

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
	  	String langCd = locale.getLanguage().toUpperCase();

	  	// 직종 콤보박스 (1 Depth)
	  	conditionBean.setLangCd(langCd);
	  	conditionBean.setDepth(null);
		mv.addObject("iscoList", commonService.selectIscoCdList(conditionBean));

	  	// 직종 콤보박스 (2 Depth)
		if(condVacancyBean.getCondIsco() != null && !"".equals(condVacancyBean.getCondIsco().trim())) {
			conditionBean.setDepth("1");
			conditionBean.setCd(condVacancyBean.getCondIsco());
			mv.addObject("isco2List", commonService.selectIscoCdList(conditionBean));
		}

		// 지역 콤보박스
      	conditionBean.setDepth(null);
		mv.addObject("locList", commonService.selectLocCdList(conditionBean));

		// 인기채용공고 조회
		condVacancyBean.setLangCd(langCd);
		condVacancyBean.setCondUserSeq(userSeq);
		mv.addObject(ConstVal.RESULT_LIST_KEY, vacancyService.selectVacancyPopulateList(condVacancyBean));

  		return mv;
	}

}
