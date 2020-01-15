package ony.cpes.external.eduTrnng.controller;

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
import ony.cmm.common.tag.CpesPaginationTag;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.eduTrnng.service.EduTrnngService;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngFreeBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngSoftSkillBean;
import ony.cpes.external.mypage.instt.service.InsttEduTrnngService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/eduTrnng")
@Controller
public class EduTrnngController extends BaseController{
	private static Log log = LogFactory.getLog(EduTrnngController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private InsttEduTrnngService insttEduTrnngService;

	@Autowired
	private EduTrnngService eduTrnngService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 교육프로그램 수정 화면
	 * education tranning modify form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/view")
	  public ModelAndView view(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("eduTrnng/view.one");

		if(StringUtil.isEmpty(condEduTrnngBean.getCondSeq())) {//정상적인 접근이 아님
			mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
			return mv;
		}

		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condEduTrnngBean.setCondCateCd(ConstVal.BKMK_CATE_CD_TRNNG_VAL);
		if(principal != null) {
			condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		}


      	EduTrnngBean eduTrnngBean = eduTrnngService.selectEduTrnng(condEduTrnngBean);
      	if(StringUtil.isEmpty(eduTrnngBean)) {
      		mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
    		return mv;
      	}

      	mv.addObject(ConstVal.RESULT_KEY, eduTrnngBean);
      	mv.addObject(ConstVal.RESULT_LIST_KEY, insttEduTrnngService.selectEduTrnngAddrList(condEduTrnngBean));//주소목록


		return mv;

	}

	  /**
	   * soft skill tranning view form
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	   */
	  @RequestMapping("/softSkillView")
	  public ModelAndView softSkillView(Locale locale,
			  @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			  @ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
			  Principal principal,
			  HttpServletRequest req,
			  HttpServletResponse res) throws Exception {

		  ModelAndView mv = new ModelAndView();
		  mv.setViewName("eduTrnng/softSkillView.one");

		  if(StringUtil.isEmpty(condEduTrnngBean.getCondSeq())) {
			  mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
			  return mv;
		  }

		  condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());
		  condEduTrnngBean.setCondCateCd(ConstVal.BKMK_CATE_CD_NEA_TRNNG_VAL);
		  if(principal != null) {
			  condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		  }
		  int count = eduTrnngService.selectEduTrnngByTrnngUserCnt(condEduTrnngBean);

		  EduTrnngSoftSkillBean eduTrnngBean = eduTrnngService.selectEduTrnngSoftSkill(condEduTrnngBean);
		  if(StringUtil.isEmpty(eduTrnngBean)) {
			  mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
			  return mv;
		  }

		  mv.addObject("applyClass", (count <= 0 ? ("RSC0000000003".equals(eduTrnngBean.getRecrumtStsCd()) ? "" : "on") : ""));
		  mv.addObject(ConstVal.RESULT_KEY, eduTrnngBean);
		  mv.addObject(ConstVal.RESULT_LIST_KEY, insttEduTrnngService.selectEduTrnngAddrList(condEduTrnngBean));//주소목록

		  return mv;

	  }

	  /**
	   * nea tranning view form
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	   */
	  @RequestMapping("/neaView")
	  public ModelAndView neaView(Locale locale,
			  @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			  @ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
			  Principal principal,
			  HttpServletRequest req,
			  HttpServletResponse res) throws Exception {

		  ModelAndView mv = new ModelAndView();
		  mv.setViewName("eduTrnng/neaView.one");

		  if(StringUtil.isEmpty(condEduTrnngBean.getCondSeq())) {
			  mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
			  return mv;
		  }

		  condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());
		  condEduTrnngBean.setCondCateCd(ConstVal.BKMK_CATE_CD_NEA_TRNNG_VAL);
		  if(principal != null) {
			  condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		  }
		  int count = eduTrnngService.selectEduTrnngByTrnngUserCnt(condEduTrnngBean);

		  EduTrnngSoftSkillBean eduTrnngBean = eduTrnngService.selectEduTrnngSoftSkill(condEduTrnngBean);
		  if(StringUtil.isEmpty(eduTrnngBean)) {
			  mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
			  return mv;
		  }

		  mv.addObject("applyClass", (count <= 0 ? ("RSC0000000003".equals(eduTrnngBean.getRecrumtStsCd()) ? "" : "on") : ""));
		  mv.addObject(ConstVal.RESULT_KEY, eduTrnngBean);
		  mv.addObject(ConstVal.RESULT_LIST_KEY, insttEduTrnngService.selectEduTrnngAddrList(condEduTrnngBean));//주소목록

		  return mv;

	  }

	  /**
	   * edu training soft skill user apply
	   * @param locale
	   * @param conditionBean
	   * @param condEduTrnngBean
	   * @param principal
	   * @param req
	   * @param res
	   * @return
	   */
	  @RequestMapping("/apply")
	  public ModelAndView apply(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		  EduTrnngBean bean = new EduTrnngBean();
		  bean.setEduTrnngSeq(condEduTrnngBean.getCondSeq());
		  bean.setJcAgreeStsCd(condEduTrnngBean.getCondCateCd());

			if(principal != null) {
				bean.setUserSeq(SessionUtil.getUserSeq(req));
				bean.setRegUserSeq(SessionUtil.getUserSeq(req));
				bean.setModUserSeq(SessionUtil.getUserSeq(req));
			}

			eduTrnngService.insertEduTrnngByTrnngUser(bean);

		return softSkillView(locale, conditionBean, condEduTrnngBean, principal, req, res);

	}

	  /**
	   * edu training nea user apply
	   * @param locale
	   * @param conditionBean
	   * @param condEduTrnngBean
	   * @param principal
	   * @param req
	   * @param res
	   * @return
	   */
	  @RequestMapping("/neaApply")
	  public ModelAndView neaApply(Locale locale,
			  @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			  @ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
			  Principal principal,
			  HttpServletRequest req,
			  HttpServletResponse res) throws Exception {

		  EduTrnngBean bean = new EduTrnngBean();
		  bean.setEduTrnngSeq(condEduTrnngBean.getCondSeq());
		  bean.setJcAgreeStsCd(condEduTrnngBean.getCondCateCd());

		  if(principal != null) {
			  bean.setUserSeq(SessionUtil.getUserSeq(req));
			  bean.setRegUserSeq(SessionUtil.getUserSeq(req));
			  bean.setModUserSeq(SessionUtil.getUserSeq(req));
		  }

		  eduTrnngService.insertEduTrnngByTrnngUser(bean);

		  return neaView(locale, conditionBean, condEduTrnngBean, principal, req, res);

	  }

	/**
	 * 교육프로그램 목록
	 *  education program list
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
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("eduTrnng/eduTrnngList.one");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondCntryId(ConstVal.ONE_VAL);
		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condEduTrnngBean.setCondCateCd(ConstVal.BKMK_CATE_CD_TRNNG_VAL);
		condEduTrnngBean.setCondDivCd(ConstVal.EDU_DIV_CD_INSTT_VAL);

		if(principal != null) {
			condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		}

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condEduTrnngBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condEduTrnngBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condEduTrnngBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = eduTrnngService.selectEduTrnngListCnt(condEduTrnngBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, eduTrnngService.selectEduTrnngList(condEduTrnngBean));
    	}


    	mv.addObject(ConstVal.RESULT_LIST2_KEY, commonService.selectLocCdList(conditionBean));

		return mv;

	}

	/**
	 * education program free list
	 *
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/eduTrnngFreeList")
	public ModelAndView eduTrnngFreeList(Locale locale,
			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
			@RequestParam(required = false, defaultValue = "10") int pageUnit,
			@RequestParam(required = false, defaultValue = "10") int pageSize,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean, Principal principal,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("eduTrnng/eduTrnngFreeList.one");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		// conditionBean.setCondCntryId(ConstVal.ONE_VAL);
		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());
		condEduTrnngBean.setCondDivCd(ConstVal.EDU_DIV_CD_INSTT_VAL);

		// Institution type
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_INSTT_TYPE_CD_VAL);
		mv.addObject("hgepDivCd", commonService.selectCommCdList(conditionBean));

		// Program type
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PC_TYPE_CD_VAL);
		mv.addObject("pcTypeCd", commonService.selectCommCdList(conditionBean));

		// Location
		conditionBean.setCondCntryId(ConstVal.CONTRY_CD_CAMBODIA_VAL);
		mv.addObject("locCd", commonService.selectLocCdList(conditionBean));

		// Radio : Training Scholarship
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_TRNNG_NATNEXP_DIV_CD_VAL);
		mv.addObject("trnngNatnexpDivCd", commonService.selectCommCdList(conditionBean));

		// Radio : Recruit status
		conditionBean.setCondGrpCd("RECRUMT_STS_CD");
		conditionBean.setFlag("RSC0000000001");
		mv.addObject("recruitStsCd", commonService.selectCommCdList(conditionBean));

		return mv;

	}

	@RequestMapping("/eduTrnngFreeListAjax")
	public ModelAndView eduTrnngFreeListAjax(Locale locale,
			@ModelAttribute("CondEduTrnngFreeBean") CondEduTrnngFreeBean conditionBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		conditionBean.setCondDivCd(ConstVal.EDU_DIV_CD_INSTT_VAL);
		conditionBean.setCondCateCd(ConstVal.BKMK_CATE_CD_TRNNG_VAL);

		if (principal != null) {
			conditionBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		}

		PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
				conditionBean.getPageSize());
		conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
		conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
		conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		int totCnt = eduTrnngService.selectEduTrnngFreeListCnt(conditionBean);
		paginationInfo.setTotalRecordCount(totCnt);
		conditionBean.setRecordsTotal(totCnt);

//		String detailUrl = "";

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_KEY, eduTrnngService.selectEduTrnngFreeList(conditionBean));
		}

		CpesPaginationTag pTag = new CpesPaginationTag();

		mv.addObject("totalPageCount", paginationInfo.getTotalPageCount());
		mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	/**
	 * education program free list
	 *
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/eduTrnngLocList")
	public ModelAndView eduTrnngLocList(Locale locale,
			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
			@RequestParam(required = false, defaultValue = "10") int pageUnit,
			@RequestParam(required = false, defaultValue = "10") int pageSize,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean, Principal principal,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("eduTrnng/eduTrnngLocList.one");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		conditionBean.setCondCntryId(ConstVal.CONTRY_CD_CAMBODIA_VAL);

		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());

		// Location
		mv.addObject("locCd", commonService.selectLocCdList(conditionBean));

		return mv;

	}

	@RequestMapping("/eduTrnngLocListAjax")
	public ModelAndView eduTrnngLocListAjax(Locale locale,
			@ModelAttribute("CondEduTrnngFreeBean") CondEduTrnngFreeBean conditionBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		conditionBean.setCondDivCd(ConstVal.EDU_DIV_CD_INSTT_VAL);
		conditionBean.setCondCateCd(ConstVal.BKMK_CATE_CD_TRNNG_VAL);

		if (principal != null) {
			conditionBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		}

		PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
				conditionBean.getPageSize());
		conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
		conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
		conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		int totCnt = eduTrnngService.selectEduTrnngLocListCnt(conditionBean);
		paginationInfo.setTotalRecordCount(totCnt);
		conditionBean.setRecordsTotal(totCnt);

//		String detailUrl = "/eduTrnng/view.do";

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_KEY, eduTrnngService.selectEduTrnngLocList(conditionBean));
		}

		CpesPaginationTag pTag = new CpesPaginationTag();

		mv.addObject("totalPageCount", paginationInfo.getTotalPageCount());
		mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	/**
	 * 교육프로그램 목록
	 *  education program list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/eduTrnngAreaList")
	  public ModelAndView eduTrnngAreaList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("eduTrnng/eduTrnngAreaList.one");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondCntryId(ConstVal.ONE_VAL);
		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condEduTrnngBean.setCondCateCd(ConstVal.BKMK_CATE_CD_TRNNG_VAL);
		condEduTrnngBean.setCondDivCd(ConstVal.EDU_DIV_CD_INSTT_VAL);

		if(principal != null) {
			condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		}

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condEduTrnngBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condEduTrnngBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condEduTrnngBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = eduTrnngService.selectEduTrnngListCnt(condEduTrnngBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, eduTrnngService.selectEduTrnngList(condEduTrnngBean));
    	}


    	mv.addObject(ConstVal.RESULT_LIST2_KEY, commonService.selectLocCdList(conditionBean));

		return mv;

	}

	/**
	 * nea job supports training list
	 *
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
			@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean, Principal principal,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("eduTrnng/eduTrnngNeaList.one");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondCntryId(ConstVal.ONE_VAL);
		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condEduTrnngBean.setCondCateCd(ConstVal.BKMK_CATE_CD_NEA_TRNNG_VAL);
		condEduTrnngBean.setCondDivCd(ConstVal.EDU_DIV_CD_INSTT_VAL);

		if(principal != null) {
			condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		}

		// Location
		conditionBean.setCondCntryId(ConstVal.CONTRY_CD_CAMBODIA_VAL);
		mv.addObject("locCd", commonService.selectLocCdList(conditionBean));

		return mv;

	}

	@RequestMapping("/eduTrnngNeaListAjax")
	public ModelAndView eduTrnngNeaListAjax(Locale locale,
			@ModelAttribute("CondEduTrnngFreeBean") CondEduTrnngFreeBean conditionBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
//		conditionBean.setCondCntryId(ConstVal.ONE_VAL);
		conditionBean.setCondCateCd(ConstVal.BKMK_CATE_CD_NEA_TRNNG_VAL);
		conditionBean.setCondDivCd(ConstVal.EDU_DIV_CD_NEA_JOB_VAL);

		if (principal != null) {
			conditionBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		}

		PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
				conditionBean.getPageSize());
		conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
		conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
		conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		int totCnt = eduTrnngService.selectEduTrnngNeaListCnt(conditionBean);
		paginationInfo.setTotalRecordCount(totCnt);
		conditionBean.setRecordsTotal(totCnt);

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_KEY, eduTrnngService.selectEduTrnngNeaList(conditionBean));
		}

		CpesPaginationTag pTag = new CpesPaginationTag();

		mv.addObject("totalPageCount", paginationInfo.getTotalPageCount());
		mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	/**
	 * soft skill training list
	 *
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/eduTrnngSoftSkillList")
	public ModelAndView eduTrnngSoftSkillList(Locale locale,
			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
			@RequestParam(required = false, defaultValue = "10") int pageUnit,
			@RequestParam(required = false, defaultValue = "10") int pageSize,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean, Principal principal,
			HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("eduTrnng/eduTrnngSoftSkillList.one");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondCntryId(ConstVal.ONE_VAL);
		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condEduTrnngBean.setCondCateCd(ConstVal.BKMK_CATE_CD_NEA_TRNNG_VAL);
		condEduTrnngBean.setCondDivCd(ConstVal.EDU_DIV_CD_INSTT_VAL);

		if(principal != null) {
			condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		}

		// Location
		conditionBean.setCondCntryId(ConstVal.CONTRY_CD_CAMBODIA_VAL);
		mv.addObject("locCd", commonService.selectLocCdList(conditionBean));

		return mv;

	}

	@RequestMapping("/eduTrnngSoftSkillListAjax")
	public ModelAndView eduTrnngSoftSkillListAjax(Locale locale,
			@ModelAttribute("CondEduTrnngFreeBean") CondEduTrnngFreeBean conditionBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
//		conditionBean.setCondCntryId(ConstVal.ONE_VAL);
		conditionBean.setCondCateCd(ConstVal.BKMK_CATE_CD_TRNNG_VAL);
		conditionBean.setCondDivCd(ConstVal.EDU_DIV_CD_SOFT_SKILL_VAL);

		if (principal != null) {
			conditionBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		}

		PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
				conditionBean.getPageSize());
		conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
		conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
		conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		int totCnt = eduTrnngService.selectEduTrnngSoftSkillListCnt(conditionBean);
		paginationInfo.setTotalRecordCount(totCnt);
		conditionBean.setRecordsTotal(totCnt);

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_KEY, eduTrnngService.selectEduTrnngSoftSkillList(conditionBean));
		}

		CpesPaginationTag pTag = new CpesPaginationTag();

		mv.addObject("totalPageCount", paginationInfo.getTotalPageCount());
		mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}
}
