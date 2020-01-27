package ony.cpes.external.mypage.compny.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetEduDegreeBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetIscoBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetLangBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetLocBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetPreferntCondBean;
import ony.cpes.external.mypage.compny.service.CompnyMatchService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/compny/match")
@Controller
public class CompnyMatchingController extends BaseController {

	private static Log log = LogFactory.getLog(CompnyInterestController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private CompnyMatchService compnyMatchService;

	/**
	 * 오토매칭
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/autoMatchList")
	public ModelAndView autoMatchList(Locale locale,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/match/autoMatchList.left");

		String userSeq = SessionUtil.getUserSeq(req);
		String langCd = locale.getLanguage().toUpperCase();

		// 해당기업의 채용공고 목록
		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyMatchService.selectCompnyVacancyList(userSeq, langCd));
		return mv;
	}

	/**
	 * 오토매칭::채용공고 정보 조회
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/autoMatchVacancyAjax")
	public ModelAndView autoMatchVacancyAjax(Locale locale,
		String vacancySeq,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		if(principal == null) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd("NO_LOGIN");
			mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		  	return mv;
		}

		String langCd = locale.getLanguage().toUpperCase();
		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
		int ret = 0;
		VacancyBean vacancy = null;

		vacancy = compnyMatchService.selectCompnyVacancy(vacancySeq, langCd);
		mv.addObject("data", vacancy);

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 오토매칭::매칭된 이력서 목록 조회
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/autoMatchResumeListyAjax")
	public ModelAndView autoMatchResumeListyAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		if(principal == null) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd("NO_LOGIN");
			mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		  	return mv;
		}

		String langCd = locale.getLanguage().toUpperCase();
		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	condVacancyBean.setLangCd(langCd);
      	condVacancyBean.setCondUserSeq(userSeq);

      	int totCnt = compnyMatchService.selectAutoMatchingResumeListCnt(condVacancyBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyMatchService.selectAutoMatchingResumeList(condVacancyBean));
    	}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 맞춤 인재정보 목록
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/matchResumeList")
	public ModelAndView matchResumeList(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/match/matchResumeList.left");

		String userSeq = SessionUtil.getUserSeq(req);
		String langCd = locale.getLanguage().toUpperCase();
		VacancyMatchSetBean vacanchMatchSet = null;
		String vacancyMatchSetSeq = "";
	  	int totCnt = 0;

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);

		vacanchMatchSet = compnyMatchService.selectVacancyMatchSet(userSeq);
		mv.addObject("vacanchMatchSet", vacanchMatchSet);

		if(vacanchMatchSet != null) {
			vacanchMatchSet.setFirstIndex(paginationInfo.getFirstRecordIndex());
			vacanchMatchSet.setLastIndex(paginationInfo.getLastRecordIndex());
			vacanchMatchSet.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			vacanchMatchSet.setLangCd(langCd);
			vacanchMatchSet.setRegUserSeq(userSeq);

			vacancyMatchSetSeq = vacanchMatchSet.getVacancyMatchSetSeq();

			List<VacancyMatchSetIscoBean> vacancyMatchSetIscoList = compnyMatchService.selectVacancyMatchSetIscoList(vacancyMatchSetSeq);
			List<VacancyMatchSetLocBean> vacancyMatchSetLocList = compnyMatchService.selectVacancyMatchSetLocList(vacancyMatchSetSeq);
			List<VacancyMatchSetEduDegreeBean> vacancyMatchSetEduDegreeList = compnyMatchService.selectVacancyMatchSetEduDegreeList(vacancyMatchSetSeq);
			List<VacancyMatchSetLangBean> vacancyMatchSetLangList = compnyMatchService.selectVacancyMatchSetLangList(vacancyMatchSetSeq);
			List<VacancyMatchSetPreferntCondBean> vacancyMatchSetPreferntCondList = compnyMatchService.selectVacancyMatchSetPreferntCondList(vacancyMatchSetSeq);

			vacanchMatchSet.setVacancyMatchSetIscoList(vacancyMatchSetIscoList);
			vacanchMatchSet.setVacancyMatchSetLocList(vacancyMatchSetLocList);
			vacanchMatchSet.setVacancyMatchSetEduDegreeList(vacancyMatchSetEduDegreeList);
			vacanchMatchSet.setVacancyMatchSetLangList(vacancyMatchSetLangList);
			vacanchMatchSet.setVacancyMatchSetPreferntCondList(vacancyMatchSetPreferntCondList);

			totCnt = compnyMatchService.selectVacancyMatchListCnt(vacanchMatchSet);
		    paginationInfo.setTotalRecordCount(totCnt);
	      	if(totCnt > 0) {
	      		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyMatchService.selectVacancyMatchList(vacanchMatchSet));
	      	}
		}

	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);
		return mv;
	}

	/**
	 * 맞춤 인재정보 설정::화면
	 * @param locale
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/matchResumeSetup")
	public ModelAndView matchResumeSetup(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/match/matchResumeSetup.left");

		String userSeq = SessionUtil.getUserSeq(req);
		String langCd = locale.getLanguage().toUpperCase();

		conditionBean.setLangCd(langCd);
		// 직종 조회(콤보박스)
		mv.addObject("isco1List", commonService.selectIscoCdList(conditionBean));
		// 지역 조회(콤보박스)
		conditionBean.setCondCntryId("1"); //Country: Cambodia
		mv.addObject("loc1List", commonService.selectLocCdList(conditionBean));
		// 고용 형태
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
	  	mv.addObject("preferEmploymtTypeCd", commonService.selectCommCdList(conditionBean));
	  	// 고용 계약조건
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
	  	mv.addObject("employCtrctCd", commonService.selectCommCdList(conditionBean));
	  	// 학력
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EDU_DEGREE_CD_VAL);
	  	mv.addObject("minEduDegreeCd", commonService.selectCommCdList(conditionBean));
	  	// 우대조건
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFERNT_COND_CD_VAL);
	  	mv.addObject("preferntCondCd", commonService.selectCommCdList(conditionBean));
	  	// 외국어
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
	  	mv.addObject("langCd", commonService.selectCommCdList(conditionBean));

	  	// 맞춤 인재정보 설정::정보
	  	VacancyMatchSetBean vacanchMatchSet = compnyMatchService.selectVacancyMatchSet(userSeq);
	  	mv.addObject("vacanchMatchSet", vacanchMatchSet);

	  	if(vacanchMatchSet != null) {
	  		String vacancyMatchSetSeq = vacanchMatchSet.getVacancyMatchSetSeq();
		  	// 맞춤 인재정보 설정::직종
	  		List<VacancyMatchSetIscoBean> vacanchMatchSetIscoList = compnyMatchService.selectVacancyMatchSetIscoList(vacancyMatchSetSeq);
		  	mv.addObject("vacanchMatchSetIscoList", vacanchMatchSetIscoList);
		  	if(vacanchMatchSetIscoList != null && vacanchMatchSetIscoList.size() > 0) {
		  		for(VacancyMatchSetIscoBean v : vacanchMatchSetIscoList) {
	  				conditionBean.setCd(v.getIscoCd());
		  			if(v.getIscoCd().length() == 1) {
		  				conditionBean.setDepth("1");
			  			mv.addObject("isco2List", commonService.selectIscoCdList(conditionBean)); // 2 Depth
		  			} else if(v.getIscoCd().length() == 2) {
		  				conditionBean.setDepth("2");
			  			mv.addObject("isco3List", commonService.selectIscoCdList(conditionBean)); // 3 Depth
		  			} else if(v.getIscoCd().length() == 3) {
		  				conditionBean.setDepth("3");
			  			mv.addObject("isco4List", commonService.selectIscoCdList(conditionBean)); // 4 Depth
		  			}
		  		}
		  	}
		  	// 맞춤 인재정보 설정::지역
		  	List<VacancyMatchSetLocBean> vacanchMatchSetLocList = compnyMatchService.selectVacancyMatchSetLocList(vacancyMatchSetSeq);
		  	mv.addObject("vacanchMatchSetLocList", vacanchMatchSetLocList);
		  	if(vacanchMatchSetLocList != null && vacanchMatchSetLocList.size() > 0) {
		  		for(VacancyMatchSetLocBean v : vacanchMatchSetLocList) {
	  				conditionBean.setCondGrpCd(v.getVacancyMatchSetLocCd());
	  				conditionBean.setCdLength(String.valueOf(v.getVacancyMatchSetLocCd().length()));
		  			if(v.getVacancyMatchSetLocCd().length() == 3) {
		  				conditionBean.setDepth("1");
		  				mv.addObject("loc2List", commonService.selectLocCdList(conditionBean)); // 3 Depth
		  			}
		  		}
		  	}
		  	// 맞춤 인재정보 설정::학력
		  	mv.addObject("vacanchMatchSetEduDegreeList", compnyMatchService.selectVacancyMatchSetEduDegreeList(vacancyMatchSetSeq));
		  	// 맞춤 인재정보 설정::우대조건
		  	mv.addObject("vacanchMatchSetPreferntCondList", compnyMatchService.selectVacancyMatchSetPreferntCondList(vacancyMatchSetSeq));
		  	// 맞춤 인재정보 설정::외국어
		  	mv.addObject("vacanchMatchSetLangList", compnyMatchService.selectVacancyMatchSetLangList(vacancyMatchSetSeq));
	  	}
		return mv;
	}

	/**
	 * 맞춤 인재정보 설정::저장
	 * @param locale
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/matchResumeSetupAjax", method = RequestMethod.POST)
	public ModelAndView matchResumeSetupAjax(Locale locale,
		@ModelAttribute("VacancyMatchSetBean") VacancyMatchSetBean vacanchMatchSet,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		if(principal == null) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd("NO_LOGIN");
			mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		  	return mv;
		}

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
		int ret = 0;

		// 맞춤 인재정보 설::정보
		VacancyMatchSetBean vacanchMatchSet2 = compnyMatchService.selectVacancyMatchSet(userSeq);
		if(vacanchMatchSet2 != null) {
			vacanchMatchSet.setVacancyMatchSetSeq(vacanchMatchSet2.getVacancyMatchSetSeq());
			vacanchMatchSet.setCompnySeq(vacanchMatchSet2.getCompnySeq());
		}

		// 맞춤 인재정보 설정 저장
		if(vacanchMatchSet2 == null) {
			vacanchMatchSet.setRegUserSeq(userSeq);
			ret = compnyMatchService.insertCompnyMatchVacancy(vacanchMatchSet);
		} else {
			vacanchMatchSet.setModUserSeq(userSeq);
			ret = compnyMatchService.updateCompnyMatchVacancy(vacanchMatchSet);
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

}

