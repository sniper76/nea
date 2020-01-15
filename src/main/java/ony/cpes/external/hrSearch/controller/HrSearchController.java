package ony.cpes.external.hrSearch.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cmm.common.bean.CommonBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.hrSearch.bean.HrSearchBean;
import ony.cpes.external.hrSearch.service.HrSearchService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/compny/hrSearch")
//@RequestMapping("/hrSearch")
@Controller
public class HrSearchController extends BaseController {

	@Autowired
	private CommonService commonService;

	@Autowired
	private HrSearchService hrSearchService;

	@RequestMapping("/hrSearchForm")
	public ModelAndView hrSearchForm() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("hrSearch/hrSearch.one");
		return mv;
	}

	@RequestMapping("/searchForm")
	public ModelAndView searchForm(@ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("HrSearchBean") HrSearchBean hrSearchBean,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("paramInfo", hrSearchBean);

		List<CommonBean> locCdList = commonService.selectCommonLocCdList(conditionBean);
		mv.addObject("locCdList", locCdList);

		List<CommonBean> iscoCdList = commonService.selectIscoCdList(conditionBean);
		mv.addObject("iscoCdList", iscoCdList);

		if(!StringUtil.isEmpty(hrSearchBean.getLocCd_1depth())) {
			conditionBean.setDepth("1");
			conditionBean.setCd(hrSearchBean.getLocCd_1depth());
			conditionBean.setCondGrpCd(hrSearchBean.getLocCd_1depth());
			conditionBean.setCdLength(String.valueOf(hrSearchBean.getLocCd_1depth().length()));
			mv.addObject("locCd2DepthList", commonService.selectCommonLocCdList(conditionBean));
		}

		if(!StringUtil.isEmpty(hrSearchBean.getIscoCd_1depth())) {
			conditionBean.setDepth("1");
			conditionBean.setCd(hrSearchBean.getIscoCd_1depth());
			conditionBean.setCondGrpCd(hrSearchBean.getIscoCd_1depth());
			conditionBean.setCdLength(String.valueOf(hrSearchBean.getIscoCd_1depth().length()));
			mv.addObject("iscoCd2DepthList", commonService.selectIscoCdList(conditionBean));
		}

		if(!StringUtil.isEmpty(hrSearchBean.getIscoCd_2depth())) {
			conditionBean.setDepth("2");
			conditionBean.setCd(hrSearchBean.getIscoCd_2depth());
			conditionBean.setCondGrpCd(hrSearchBean.getIscoCd_2depth());
			conditionBean.setCdLength(String.valueOf(hrSearchBean.getIscoCd_2depth().length()));
			mv.addObject("iscoCd3DepthList", commonService.selectIscoCdList(conditionBean));
		}

		if(!StringUtil.isEmpty(hrSearchBean.getIscoCd_3depth())) {
			conditionBean.setDepth("3");
			conditionBean.setCd(hrSearchBean.getIscoCd_3depth());
			conditionBean.setCondGrpCd(hrSearchBean.getIscoCd_3depth());
			conditionBean.setCdLength(String.valueOf(hrSearchBean.getIscoCd_3depth().length()));
			mv.addObject("iscoCd4DepthList", commonService.selectIscoCdList(conditionBean));
		}

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_FORM_CD_VAL);
		List<CommDtlCdBean> employmentFormList = commonService.selectCommCdList(conditionBean);
		mv.addObject("employmentFormList", employmentFormList);

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
		List<CommDtlCdBean> preferEmploymtTypeCdList = commonService.selectCommCdList(conditionBean);
		mv.addObject("preferEmploymtTypeCdList", preferEmploymtTypeCdList);

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
		List<CommDtlCdBean> termOfEmploymentContractList = commonService.selectCommCdList(conditionBean);
		mv.addObject("termOfEmploymentContractList", termOfEmploymentContractList);

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EDU_DEGREE_CD_VAL);
		List<CommDtlCdBean> educationDegreeCodeList = commonService.selectCommCdList(conditionBean);
		mv.addObject("educationDegreeCodeList", educationDegreeCodeList);

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_GENDER_CD_VAL);
		List<CommDtlCdBean> genderCdList = commonService.selectCommCdList(conditionBean);
		mv.addObject("genderCdList", genderCdList);

		/*HrSearchBean totCntBean = new HrSearchBean();
		mv.addObject("totResumeCnt", hrSearchService.selectHrSearchResultTotCnt(totCntBean));*/

		mv.setViewName("hrSearch/searchForm.empty");
		return mv;
	}

	@RequestMapping("/hrSearchResult")
	public ModelAndView hrSearchResult(@ModelAttribute("HrSearchBean") HrSearchBean hrSearchBean, Locale locale,
			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
  			@RequestParam(required = false, defaultValue = "10") int pageSize,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("param", hrSearchBean);

		PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		hrSearchBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		hrSearchBean.setUserSeq(SessionUtil.getUserSeq(req));
		hrSearchBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
	  	hrSearchBean.setLastIndex(paginationInfo.getLastRecordIndex());
	  	hrSearchBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	  	hrSearchBean.setSearchType("user");

	  	int totCnt = hrSearchService.selectHrSearchResultTotCnt(hrSearchBean);
	  	paginationInfo.setTotalRecordCount(totCnt);
	  	mv.addObject(ConstVal.TOT_CNT_KEY, totCnt);
	  	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

	  	if(totCnt > 0) {
	  		mv.addObject(ConstVal.RESULT_LIST_KEY, hrSearchService.selectHrSearchResultList(hrSearchBean));
	  	}

		mv.setViewName("hrSearch/hrSearchResult.one");
		return mv;
	}

	@RequestMapping("/selectboxTest")
	public ModelAndView selectboxTest(@ModelAttribute("ConditionBean") ConditionBean conditionBean) throws Exception {
		ModelAndView mv = new ModelAndView();

		List<CommonBean> locCdList = commonService.select2CommonLocCdList(conditionBean);
		mv.addObject("locCdList", locCdList);

		mv.setViewName("hrSearch/selectboxTest.one");
		return mv;
	}

}
