package ony.cpes.external.mypage.privt.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.bean.LocCdBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.tag.CpesPaginationTag;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.mypage.privt.bean.MatchingBean;
import ony.cpes.external.mypage.privt.bean.MatchingSrchBean;
import ony.cpes.external.mypage.privt.service.PrivtMatchingService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/private/matching")
@Controller
public class PrivtMatchingController extends BaseController{
	private static Log log = LogFactory.getLog(PrivtMatchingController.class);

	@Autowired
	private PrivtMatchingService privtMatchingService;

	@Autowired
	private CommonService commonService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Autowired MessageSource messageSource;

	@RequestMapping("/init")
	public ModelAndView init(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("MatchingBean") MatchingBean matchingBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		matchingBean.setLangCd(locale.getLanguage().toUpperCase());
		matchingBean.setUserSeq(SessionUtil.getUserSeq(req));

//		int result = privtMatchingService.selectMatchingCnt(matchingBean);

		MatchingBean bean = privtMatchingService.selectMatchingMst(matchingBean);


		// matching content not exist is go init page

		if(bean == null) {
			mv.setViewName("mypage/matching/init.left");
			return mv;
		}
		MatchingSrchBean srchBean = new MatchingSrchBean();

//		srchBean.setUserSeq(SessionUtil.getUserSeq(req));
		srchBean.setEmployCtrctDecidCd(bean.getEmployCtrctDecidCd());
		srchBean.setEmployCtrctUndecidCd(bean.getEmployCtrctUndecidCd());
		srchBean.setWorkTimeFullCd(bean.getWorkTimeFullCd());
		srchBean.setWorkTimePartCd(bean.getWorkTimePartCd());
		srchBean.setHopeSalary(bean.getHopeSalary());

		changeMinWorkExp(bean, srchBean);

		srchBean.setIscoCdStr(bean.getIscoCdStr());
		srchBean.setLangCdStr(bean.getLangCdStr());
		srchBean.setPrivilegeCdStr(bean.getPrivilegeCdStr());
		srchBean.setEduDegreeCdStr(bean.getEduDegreeCdStr());
		srchBean.setLocCdStr(bean.getLocCdStr());

		mv.addObject("srchBean", srchBean);
		mv.setViewName("mypage/matching/list.left");
		return mv;
	}

	private void changeMinWorkExp(MatchingBean arg1, MatchingSrchBean arg2) {
		if(StringUtil.isEmpty(arg1.getMinWorkExp())) {
			return;
		}
		String min = arg1.getMinWorkExp();
		switch (min) {
		case "+5":
			arg2.setMinWorkExp("61");
			arg2.setMaxWorkExp(""+Integer.MAX_VALUE);
			break;
		case "-5":
			arg2.setMinWorkExp("25");
			arg2.setMaxWorkExp("60");
			break;
		case "-2":
			arg2.setMinWorkExp("13");
			arg2.setMaxWorkExp("24");
			break;
		case "-1":
			arg2.setMinWorkExp("1");
			arg2.setMaxWorkExp("12");
			break;
		default:
			arg2.setMinWorkExp("0");
			arg2.setMaxWorkExp("0");
			break;
		}
	}

	@RequestMapping("/regist")
	public ModelAndView regist(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("MatchingBean") MatchingBean matchingBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		matchingBean.setUserSeq(SessionUtil.getUserSeq(req));

		/*
1. Occupation
 - CPES_RESUME_ISCO

2. Location
 - CPES_RESUME_HOPE_WORK_LOC

3. Wage
 - EXPCT_MIN_SALARY_AMT ~ EXPCT_MAX_SALARY_AMT

4. Working Time
 - PREFER_EMPLOY_TYPE_CD

5. Contract Type
 - PREFER_CRTCT_TYPE

6. Education
 - CPES_RESUME_GENRL_EDU

7. Experience
 - WORK_YEAR_CNT ~ WORK_MONTH_CNT

8. Privilege
 - Disability - DISABL_YN
 - Migrant Worker - RET_MIGRAT_YN

9. Foreign Language
 - CPES_RESUME_LANG
		 */
		MatchingBean mBean = privtMatchingService.selectMatchingMst(matchingBean);

		if(mBean == null) {
			matchingBean.setJcAgreeStsCd("JAS0000000001");
			mBean = privtMatchingService.selectMatchingResumeByUser(matchingBean);

			if(mBean == null) {
//				throw new Exception("The approved resume does not exist.");

				mv.addObject("errorMsg", "The approved resume does not exist.");
				mv.setViewName("mypage/matching/init.left");
				return mv;
			}

			String locCd = "";
			if(mBean.getLocCdStr() != null) {
				if(mBean.getLocCdStr().indexOf(",") > -1) {
					String[] temp = mBean.getLocCdStr().split(",");
					locCd = temp[0];
				}
				else {
					locCd = mBean.getLocCdStr();
				}
			}
			if(locCd.length() > 5) {
				mBean.setLocCdStr(locCd.substring(0, 3)+","+locCd.substring(0, 5));
			}
//			String iscoCd = "";
//			if(mBean.getIscoCdStr() != null) {
//				if(mBean.getIscoCdStr().indexOf(",") > -1) {
//					String[] temp = mBean.getIscoCdStr().split(",");
//					iscoCd = temp[0];
//				}
//				else {
//					iscoCd = mBean.getIscoCdStr();
//				}
//			}
//			mBean.setIscoCdStr(parseIscoCd(iscoCd));
		}

		// location
		List<LocCdBean> locCdList = commonService.selectLocCdList(conditionBean);
		mv.addObject("locCdList", locCdList);

		mv.addObject("iscoList", commonService.selectIscoCdList(conditionBean));

		// full time, part time
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
		mv.addObject("workTimeList", commonService.selectCommCdList(conditionBean));

		// contract type
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
		mv.addObject("contractList", commonService.selectCommCdList(conditionBean));

		// edu degree
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EDU_DEGREE_CD_VAL);
		List<CommDtlCdBean> educationDegreeCodeList = commonService.selectCommCdList(conditionBean);
		mv.addObject("eduDegreeList", educationDegreeCodeList);

		// privilege
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFERNT_COND_CD_VAL);
		mv.addObject("privilegeList", commonService.selectCommCdList(conditionBean));

		// language
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
		mv.addObject("languageList", commonService.selectCommCdList(conditionBean));

		mv.addObject("matchingBean", mBean);

		mv.setViewName("mypage/matching/regist.left");
		return mv;
	}

	@RequestMapping("/updateAjax")
	public ModelAndView updateAjax(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("MatchingBean") MatchingBean matchingBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		String userSeq = SessionUtil.getUserSeq(req);
		matchingBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		matchingBean.setUserSeq(userSeq);
		matchingBean.setRegUserSeq(userSeq);
		matchingBean.setModUserSeq(userSeq);

		int result = privtMatchingService.updateMatching(matchingBean);
		if(result > 0) {
			mv.addObject(ConstVal.RESULT_KEY, ConstVal.YES_VAL);
		}else {
			mv.addObject(ConstVal.RESULT_KEY, ConstVal.NO_VAL);
		}

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	@RequestMapping("/listAjax")
	public ModelAndView listAjax(Locale locale,
			@ModelAttribute("MatchingSrchBean") MatchingSrchBean conditionBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());

		if (principal != null) {
			conditionBean.setUserSeq(SessionUtil.getUserSeq(req));
		}

		conditionBean.setLangCds(getStringByList(conditionBean.getLangCdStr()));
		conditionBean.setPreferntCondCds(getStringByList(conditionBean.getPrivilegeCdStr()));
		conditionBean.setEduDegreeCds(getStringByList(conditionBean.getEduDegreeCdStr()));

		PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
				conditionBean.getPageSize());
		conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
		conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
		conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

//		if(conditionBean.getLocCdStr().indexOf(",") > -1) {
//			String[] temp = conditionBean.getLocCdStr().split(",");
//			conditionBean.setCondAddrCd(temp[temp.length-1]);
//		}
//		else {
//			conditionBean.setCondAddrCd(conditionBean.getLocCdStr());
//		}

		int totCnt = privtMatchingService.selectMatchingByVacancysCnt(conditionBean);
		paginationInfo.setTotalRecordCount(totCnt);
		conditionBean.setRecordsTotal(totCnt);

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_KEY, privtMatchingService.selectMatchingByVacancys(conditionBean));
		}

		CpesPaginationTag pTag = new CpesPaginationTag();

		mv.addObject("totalPageCount", paginationInfo.getTotalRecordCount());
		mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	/**
	 * auto matching vacancy
	 * @param locale
	 * @param conditionBean
	 * @param matchingBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/autoMatchList")
	public ModelAndView autoMatchList(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("MatchingBean") MatchingBean matchingBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/matching/autoMatchList.left");

		String userSeq = SessionUtil.getUserSeq(req);
		String langCd = locale.getLanguage().toUpperCase();

		matchingBean.setLangCd(locale.getLanguage().toUpperCase());
		matchingBean.setUserSeq(SessionUtil.getUserSeq(req));

		MatchingBean match = null;
		match = privtMatchingService.selectMatchingResume(userSeq, langCd);

		mv.addObject("match", match);
		return mv;
	}

	/**
	 * auto matching vacancy List
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param param
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/autoMatchListAjax")
	public ModelAndView autoMatchListAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("MatchingBean") MatchingBean param,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String langCd = locale.getLanguage().toUpperCase();

		PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	param.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	param.setLastIndex(paginationInfo.getLastRecordIndex());
      	param.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	  	int totCnt = 0;

	  	param.setLangCd(langCd);
      	param.setUserSeq(userSeq);
		totCnt = privtMatchingService.selectMatchingAutoCnt(param);

		paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, privtMatchingService.selectMatchingAutoList(param));
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	private List<String> getStringByList(String strs) {
		List<String> cds = new ArrayList<String>();
		if(!StringUtil.isEmpty(strs) ) {
			String[] temp;
			if(strs.indexOf(",") > -1) {
				temp = strs.split(",");
			}
			else {
				temp = new String[1];
				temp[0] = strs;
			}
			for (String s : temp) {
				cds.add(s);
			}
		}
		return cds;
	}
}
