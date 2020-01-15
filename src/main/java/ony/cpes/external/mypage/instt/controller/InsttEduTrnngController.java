package ony.cpes.external.mypage.instt.controller;

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
import ony.cmm.common.bean.LocCdBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.service.CompnyFairService;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.service.InsttEduTrnngService;
import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/instt/eduTrnng")
@Controller
public class InsttEduTrnngController extends BaseController{
	private static Log log = LogFactory.getLog(InsttEduTrnngController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private InsttEduTrnngService insttEduTrnngService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 교육프로그램 목록
	 * education tranning list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/list")
	  public ModelAndView list(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/instt/eduTrnng/list.left");


		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);

      	condEduTrnngBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condEduTrnngBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condEduTrnngBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	mv.addObject(ConstVal.RESULT_KEY, insttEduTrnngService.selectEduTrnngStatCnt(condEduTrnngBean));

      	if(StringUtil.isEmpty(condEduTrnngBean.getCondStatCd())) {
      		condEduTrnngBean.setCondStatCd(ConstVal.VACANCY_SEARCH_COND_DEFAULT_VAL);//진행중
      	}
      	int totCnt = insttEduTrnngService.selectEduTrnngListCnt(condEduTrnngBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, insttEduTrnngService.selectEduTrnngList(condEduTrnngBean));
    	}

		return mv;

	}


	/**
	 * 교육프로그램 등록 화면
	 * education tranning write form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/write")
	  public ModelAndView write(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/instt/eduTrnng/write.left");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_TRNNG_NATNEXP_DIV_CD_VAL);

	  	mv.addObject("trnngNatnexpDivCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_SKILL_JOB_PROGRAM_CORS_CD_VAL);
	  	mv.addObject("skillJobProgramCorsCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드


	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_HGEP_DIV_CD_VAL);
	  	mv.addObject("hgepDivCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_PC_TYPE_CD_VAL);
	  	mv.addObject("pcTypeCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

		// 다음 depth 코드 조회
	  	conditionBean.setCondCntryId(ConstVal.CONTRY_CD_CAMBODIA_VAL);
		mv.addObject(ConstVal.RESULT_LIST_KEY, commonService.selectLocCdList(conditionBean));

		return mv;

	}

	/**
	 * 교육프로그램 등록
	 * education tranning insert
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/writeProcessAjax", method = RequestMethod.POST)
	public ModelAndView writeProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("EduTrnngBean") EduTrnngBean eduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		eduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		eduTrnngBean.setUserSeq(userSeq);
  		eduTrnngBean.setRegUserSeq(userSeq);
  		eduTrnngBean.setModUserSeq(userSeq);
  		eduTrnngBean.setJcCd(SessionUtil.getJcCd(req));

  		if(insttEduTrnngService.insertEduTrnng(eduTrnngBean) > 0) {
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
	 * 교육프로그램 수정 화면
	 * education tranning modify form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/modify")
	  public ModelAndView modify(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/instt/eduTrnng/modify.left");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone

      	condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	EduTrnngBean eduTrnngBean = insttEduTrnngService.selectEduTrnng(condEduTrnngBean);
      	if(StringUtil.isEmpty(eduTrnngBean)) {
      		mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
    		return mv;
      	}

      	mv.addObject(ConstVal.RESULT_KEY, eduTrnngBean);
      	mv.addObject(ConstVal.RESULT_LIST2_KEY, insttEduTrnngService.selectEduTrnngAddrList(condEduTrnngBean));//주소목록

	  	conditionBean.setLangCd(locale.getLanguage().toUpperCase());
	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_TRNNG_NATNEXP_DIV_CD_VAL);
	  	mv.addObject("trnngNatnexpDivCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_SKILL_JOB_PROGRAM_CORS_CD_VAL);
	  	mv.addObject("skillJobProgramCorsCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드


	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_HGEP_DIV_CD_VAL);
	  	mv.addObject("hgepDivCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_PC_TYPE_CD_VAL);
	  	mv.addObject("pcTypeCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

		// 다음 depth 코드 조회
	  	conditionBean.setCondCntryId(ConstVal.CONTRY_CD_CAMBODIA_VAL);
		mv.addObject(ConstVal.RESULT_LIST_KEY, commonService.selectLocCdList(conditionBean));



		return mv;

	}


	/**
	 * 교육프로그램 수정
	 * education tranning modify
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/modifyProcessAjax", method = RequestMethod.POST)
	public ModelAndView modifyProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("EduTrnngBean") EduTrnngBean eduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();


		String userSeq = SessionUtil.getUserSeq(req);
		eduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		eduTrnngBean.setUserSeq(userSeq);
  		eduTrnngBean.setRegUserSeq(userSeq);
  		eduTrnngBean.setModUserSeq(userSeq);
  		eduTrnngBean.setJcCd(SessionUtil.getJcCd(req));

  		if(insttEduTrnngService.updateEduTrnng(eduTrnngBean) > 0) {
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
	 * 교육프로그램 삭제
	 * education tranning delete
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/deleteProcessAjax", method = RequestMethod.POST)
	public ModelAndView deleteProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		condEduTrnngBean.setCondUserSeq(userSeq);
  		condEduTrnngBean.setRegUserSeq(userSeq);
  		condEduTrnngBean.setModUserSeq(userSeq);

  		if(insttEduTrnngService.deleteEduTrnng(condEduTrnngBean) > 0) {
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
	 * 교육프로그램 마감
	 * education tranning close
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/closeProcessAjax", method = RequestMethod.POST)
	public ModelAndView closeProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		condEduTrnngBean.setCondUserSeq(userSeq);
  		condEduTrnngBean.setRegUserSeq(userSeq);
  		condEduTrnngBean.setModUserSeq(userSeq);

  		if(insttEduTrnngService.updateEduTrnngClose(condEduTrnngBean) > 0) {
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

}
