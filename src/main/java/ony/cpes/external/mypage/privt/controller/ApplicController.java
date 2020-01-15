package ony.cpes.external.mypage.privt.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.CondJobskBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ReferralBean;
import ony.cpes.external.mypage.privt.service.ApplicService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/private/applic")
@Controller
public class ApplicController extends BaseController{
	private static Log log = LogFactory.getLog(ApplicController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private ApplicService applicService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 입사지원 목록
	 * private applic list
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
		@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/applic/list.left");

		String userSeq = SessionUtil.getUserSeq(req);

		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq(userSeq);

		PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condApplicBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condApplicBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condApplicBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	if(conditionBean.getCd() == null || "".equals(conditionBean.getCd().trim())) {
	      	String condBgnDt = condApplicBean.getCondBgnDt();
	      	String condEndDt = condApplicBean.getCondEndDt();
	      	if(condEndDt == null || "".equals(condEndDt.trim()) || condBgnDt == null || "".equals(condBgnDt.trim())) {
	      		Calendar todayCal = Calendar.getInstance();
	      		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	      		condEndDt = sdf.format(todayCal.getTime());
	      		todayCal.add(Calendar.MONTH, -1);
	      		condBgnDt = sdf.format(todayCal.getTime());
	      		condApplicBean.setCondEndDt(condEndDt);
	      		condApplicBean.setCondBgnDt(condBgnDt);
	      	}
      	} else {
      		condApplicBean.setCondBgnDt(null);
      		condApplicBean.setCondEndDt(null);
      		condApplicBean.setCondOpenTypeCd(null);
      		condApplicBean.setCondStatTypeCd(null);
      		condApplicBean.setCondStatTypeCd2(null);
      	}

//      mv.addObject(ConstVal.RESULT_KEY, applicService.selectApplicStatCnt(condApplicBean));
      	mv.addObject(ConstVal.RESULT_KEY, applicService.selectApplicSmry(userSeq));

      	int totCnt = applicService.selectApplicListCnt(condApplicBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, applicService.selectApplicList(condApplicBean));
    	}

		return mv;
	}

	/**
	 * 입사지원 취소
	 * applic cancel
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/writeProcessAjax", method = RequestMethod.POST)
	public ModelAndView writeProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code


  		ApplicBean applicBean = new ApplicBean();

  		applicBean.setRegUserSeq(userSeq);
  		applicBean.setModUserSeq(userSeq);
  		applicBean.setVacancySeq(condApplicBean.getCondSeq());
  		applicBean.setResumeSeq(condApplicBean.getCondSeq2());

  		if(applicService.insertApplic(applicBean) > 0) {
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
	 * 입사지원 취소
	 * applic cancel
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/cancelProcessAjax", method = RequestMethod.POST)
	public ModelAndView cancelProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		condApplicBean.setCondUserSeq(userSeq);
  		condApplicBean.setRegUserSeq(userSeq);
  		condApplicBean.setModUserSeq(userSeq);

  		if(applicService.updateCancelApplic(condApplicBean) > 0) {
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
	 * Delete Application
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteApplicationAjax", method = RequestMethod.POST)
	public ModelAndView deleteApplicationAjax(Locale locale,
		String applicSeq,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		String[] applicSeqArr = applicSeq.split("\\,");

		applicService.deleteApplic(applicSeqArr, userSeq);

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);

		return mv;
	}

	/**
	 * 입사제의 목록
	 * private offer list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/offerList")
	  public ModelAndView offerList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/applic/offerList.left");


		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));

     	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);
      	condApplicBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condApplicBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condApplicBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = applicService.selectOfferListCnt(condApplicBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, applicService.selectOfferList(condApplicBean));
    	}

		return mv;

	}


	/**
	 * 면접제의 목록
	 * private applic list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/intvwList")
	  public ModelAndView intvwList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/applic/intvwList.left");


		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);
      	condApplicBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condApplicBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condApplicBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_INTVW_REJECT_CD_VAL);
	  	mv.addObject("intvwRejectCd", commonService.selectCommCdList(conditionBean));//인터뷰 거절사유

      	int totCnt = applicService.selectIntvwListCnt(condApplicBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, applicService.selectIntvwList(condApplicBean));
    	}

		return mv;

	}

	/**
	 * 면접제의 상세
	 * private applic list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/intvwViewAjax")
	  public ModelAndView intvwView(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/applic/intvwView.empty");


		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	mv.addObject(ConstVal.RESULT_KEY, applicService.selectIntvw(condApplicBean));

		return mv;

	}



	/**
	 * 입사제의 삭제
	 * offer delete
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/offerDelProcessAjax", method = RequestMethod.POST)
	public ModelAndView offerDelProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		condApplicBean.setCondUserSeq(userSeq);
  		condApplicBean.setRegUserSeq(userSeq);
  		condApplicBean.setModUserSeq(userSeq);

  		if(applicService.deleteOffer(condApplicBean) > 0) {
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
	 * 이력서 열람 기업
	 * cv open resume compny
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/resumeOpenList")
	  public ModelAndView resumeOpenList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/applic/resumeOpenList.left");


		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);
      	condApplicBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condApplicBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condApplicBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = applicService.selectOpenResumeCompnyListCnt(condApplicBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, applicService.selectOpenResumeCompnyList(condApplicBean));
    	}

		return mv;

	}

	/**
	 * 이력서 열람 기업 삭제
	 * cv open resume compny delete
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/resumeOpenDelProcessAjax", method = RequestMethod.POST)
	public ModelAndView resumeOpenDelProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		condApplicBean.setCondUserSeq(userSeq);
  		condApplicBean.setRegUserSeq(userSeq);
  		condApplicBean.setModUserSeq(userSeq);

  		if(applicService.deleteResumeOpenCompny(condApplicBean) > 0) {
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
	 * 알선 목록
	 * Referral list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/referralList")
	  public ModelAndView referralList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/applic/referralList.left");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condApplicBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condApplicBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condApplicBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = applicService.selectReferralListCnt(condApplicBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, applicService.selectReferralList(condApplicBean));
    	}

	  	conditionBean.setLangCd(locale.getLanguage().toUpperCase());
	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_REFERRAL_REJECT_CD_VAL);
	  	mv.addObject("referralRejectCd", commonService.selectCommCdList(conditionBean));//거절사유

		return mv;

	}

	/**
	 * 알선 수락
	 * referral ok
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/referralProcessAjax", method = RequestMethod.POST)
	public ModelAndView referralProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		ReferralBean referralBean = new ReferralBean();
  		ApplicBean applicBean = new ApplicBean();

  		referralBean.setRegUserSeq(userSeq);
  		referralBean.setModUserSeq(userSeq);
  		referralBean.setVacancySeq(condApplicBean.getCondSeq());
  		referralBean.setResumeSeq(condApplicBean.getCondSeq2());

  		applicBean.setRegUserSeq(userSeq);
  		applicBean.setModUserSeq(userSeq);
  		applicBean.setVacancySeq(condApplicBean.getCondSeq());
  		applicBean.setResumeSeq(condApplicBean.getCondSeq2());

  		if(applicService.updateReferralOk(referralBean, applicBean) > 0) {
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
	 * 알선 삭제
	 * referral delete
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/referralDeleteProcessAjax", method = RequestMethod.POST)
	public ModelAndView referralDeleteProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		condApplicBean.setCondUserSeq(userSeq);
  		condApplicBean.setRegUserSeq(userSeq);
  		condApplicBean.setModUserSeq(userSeq);


  		if(applicService.deleteReferral(condApplicBean) > 0) {
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
	 * 알선 거절
	 * referral delete
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/referralRejectProcessAjax", method = RequestMethod.POST)
	public ModelAndView referralRejectProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		ReferralBean referralBean = new ReferralBean();

  		referralBean.setRegUserSeq(userSeq);
  		referralBean.setModUserSeq(userSeq);
  		referralBean.setVacancySeq(condApplicBean.getCondSeq());
  		referralBean.setResumeSeq(condApplicBean.getCondSeq2());
  		referralBean.setReferralRejectCd(condApplicBean.getCondText());

  		if(applicService.updateReferralNo(referralBean) > 0) {
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
	 * 입사제의 수락
	 * offer ok
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/offerOkAjax", method = RequestMethod.POST)
	public ModelAndView offerOkAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("OfferBean") OfferBean offerBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		offerBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		offerBean.setRegUserSeq(userSeq);//언어코드,lanuage code
		offerBean.setModUserSeq(userSeq);//언어코드,lanuage code
		offerBean.setOfferAcptYn(ConstVal.YES_VAL);


  		if(applicService.updateOfferUser(offerBean) > 0) {
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
	 * 입사제의 거부
	 * offer reject
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/offerRejectAjax", method = RequestMethod.POST)
	public ModelAndView offerRejectAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("OfferBean") OfferBean offerBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		offerBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		offerBean.setRegUserSeq(userSeq);//언어코드,lanuage code
		offerBean.setModUserSeq(userSeq);//언어코드,lanuage code
		offerBean.setOfferAcptYn(ConstVal.NO_VAL);


  		if(applicService.updateOfferUser(offerBean) > 0) {
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
	 * 인터뷰 수락
	 * interview ok
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/intvwOkAjax", method = RequestMethod.POST)
	public ModelAndView intvwOkAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("IntvwBean") IntvwBean intvwBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		intvwBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		intvwBean.setRegUserSeq(userSeq);//언어코드,lanuage code
		intvwBean.setModUserSeq(userSeq);//언어코드,lanuage code
		intvwBean.setIntvwOpenYn(ConstVal.YES_VAL);


  		if(applicService.updateIntvwOk(intvwBean) > 0) {
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
	 * 인터뷰 거절
	 * interview reject
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/intvwRejectAjax", method = RequestMethod.POST)
	public ModelAndView intvwRejectAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("IntvwBean") IntvwBean intvwBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		intvwBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		intvwBean.setRegUserSeq(userSeq);//언어코드,lanuage code
		intvwBean.setModUserSeq(userSeq);//언어코드,lanuage code
		intvwBean.setIntvwOpenYn(ConstVal.YES_VAL);


  		if(applicService.updateIntvwReject(intvwBean) > 0) {
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
