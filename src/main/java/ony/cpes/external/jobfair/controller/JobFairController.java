package ony.cpes.external.jobfair.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.bean.FileBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.tag.CpesPaginationTag;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.compny.service.CompnyService;
import ony.cpes.external.instt.service.InsttService;
import ony.cpes.external.jobfair.bean.CondJobFairCenterBean;
import ony.cpes.external.jobfair.bean.CondWorkShopBean;
import ony.cpes.external.jobfair.bean.JobFairBoothBean;
import ony.cpes.external.jobfair.bean.JobFairBoothHistBean;
import ony.cpes.external.jobfair.bean.JobFairBoothResvWaitBean;
import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnCompnyBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnInsttBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnOnlineBean;
import ony.cpes.external.jobfair.bean.WorkShopBean;
import ony.cpes.external.jobfair.service.JobFairService;
import ony.cpes.external.mypage.compny.bean.CompnyMemBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngSoftSkillBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;


@RequestMapping("/jobFair")
@Controller
public class JobFairController  extends BaseController {
	  private static Log log = LogFactory.getLog(JobFairController.class);

	  @Autowired
	  private CommonService commonService;

	  @Autowired
	  private JobFairService jobFairService;

	  @Autowired
	  private CompnyService compnyService;

	  @Autowired
	  private InsttService insttService;

	  @Autowired SessionLocaleResolver localeResolver;

	  @Resource(name = "propertiesService")
	  protected EgovPropertyService propertiesService;


	  @Autowired MessageSource messageSource;

	/**
	 * JobFair :: Apply event list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/applyList")
	public ModelAndView applyList(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/applyList.one");//BOARD BASIC TYPE

		if(principal != null) {
      		mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.YES_VAL);
      	}

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

		// Location (1 Depth)
		conditionBean.setCondGrpCd(null);
        mv.addObject("locCdList", commonService.selectLocCdList(conditionBean));

        // Fair Category
  		conditionBean.setCondGrpCd(ConstVal.GRP_CD_FAIR_DIV_CD_VAL);
  		mv.addObject("fairDivCdList", commonService.selectCommCdList(conditionBean));

	  	return mv;
	}

	/**
	 * Job Fair apply list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/applyListAjax")
	public ModelAndView applyListAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFair,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = "";
		String userAuthCd = "";

		if(principal != null) {
			userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
			userAuthCd = SessionUtil.getUserAuthCd(req);
		}

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	condFair.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condFair.setLastIndex(paginationInfo.getLastRecordIndex());
      	condFair.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
  		condFair.setLangCd(locale.getLanguage().toUpperCase());//language code
  		condFair.setRegUserSeq(userSeq);
  		condFair.setCd(userAuthCd);

	  	int totCnt = 0;
	    List<JobFairCenterBean> jobFairList = null;

	    totCnt= jobFairService.selectJobFairApplyListCnt(condFair);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(totCnt > 0) {
			jobFairList = jobFairService.selectJobFairApplyList(condFair);
			mv.addObject(ConstVal.RESULT_LIST_KEY, jobFairList);
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * Job Fair::Participate
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/applyPatcptnAjax", method = RequestMethod.POST)
	public ModelAndView applyPatcptnAjax(Locale locale,
		@ModelAttribute("JobFairPatcptnBean") JobFairPatcptnBean jobFairPatcptn,
		@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFair,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		JobFairCenterBean jobFairInfo = null;
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

  		condFair.setLangCd(locale.getLanguage().toUpperCase());
  		condFair.setRegUserSeq(userSeq);
  		condFair.setCd(userAuthCd);
  		condFair.setCondSeq(jobFairPatcptn.getFairSeq());

		jobFairInfo = jobFairService.selectJobFairApplyInfo(condFair);
		if(jobFairInfo == null || !"FAS0000000002".equals(jobFairInfo.getFairStsCd())) { //모집중인 아닌 경우
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd("ERR_FAIR_STS"); //참가신청 가능한 상태가 아닙니다!
			mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		    return mv;
		}

		jobFairPatcptn.setUserSeq(userSeq);
		if(ConstVal.ROLE_USER_VAL.equals(userAuthCd) || ConstVal.ROLE_STDIT_VAL.equals(userAuthCd)) {
			JobFairPatcptnOnlineBean jobFairPatcptnOnline = jobFairService.selectJobFairApplyPatcptnOnline(jobFairPatcptn.getFairSeq(), userSeq);
			if(jobFairPatcptnOnline != null) {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd("ERR_EXIST"); //이미 참가신청 된 상태입니다!
				mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
			  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
			    return mv;
			}
			jobFairService.insertJobFairApplyPatcptnOnline(jobFairPatcptn);

		} else if(ConstVal.ROLE_CMPNY_VAL.equals(userAuthCd)) { //Company
			JobFairPatcptnCompnyBean jobFairPatcptnCompny = jobFairService.selectJobFairApplyPatcptnCompny(jobFairPatcptn.getFairSeq(), userSeq);
			if(jobFairPatcptnCompny != null) {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd("ERR_EXIST"); //이미 참가신청 된 상태입니다!
				mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
			  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
			    return mv;
			}
			jobFairService.insertJobFairApplyPatcptnCompny(jobFairPatcptn);

		} else if(ConstVal.ROLE_TRNCT_VAL.equals(userAuthCd)) { //Institute
			JobFairPatcptnInsttBean jobFairPatcptnInstt  = jobFairService.selectJobFairApplyPatcptnInstt(jobFairPatcptn.getFairSeq(), userSeq);
			if(jobFairPatcptnInstt != null) {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd("ERR_EXIST"); //이미 참가신청 된 상태입니다!
				mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
			  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
			    return mv;
			}
			jobFairService.insertJobFairApplyPatcptnInstt(jobFairPatcptn);

		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * JobFair :: Apply event view
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/applyView")
	public ModelAndView applyView(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFair,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		JobFairCenterBean jobFairInfo = null;
		String fairImgPath = "";
		String userSeq = "";
		String userAuthCd = "";


	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/applyView.one");

		if(principal != null) {
      		mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.YES_VAL);
    		userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
    	  	userAuthCd = SessionUtil.getUserAuthCd(req);
      	}

  		condFair.setLangCd(locale.getLanguage().toUpperCase());
  		condFair.setRegUserSeq(userSeq);
  		condFair.setCd(userAuthCd);
		jobFairInfo = jobFairService.selectJobFairApplyInfo(condFair);
		String jcAgreeStsCd = "";

		if(jobFairInfo != null) {
	      	FileBean fileBean = new FileBean();

	      	fileBean.setFileGrpSeq(jobFairInfo.getFairFileGrpSeq());
	      	List<FileBean> fairImgList = commonService.selectAttachFilesList(fileBean);
	      	if(fairImgList != null && fairImgList.size() > 0) {
	      		fairImgPath = fairImgList.get(0).getSaveFilePath();
	      	}

	      	fileBean.setFileGrpSeq(jobFairInfo.getSponsorFileGrpSeq());
	      	mv.addObject("sponsorImg", commonService.selectAttachFilesList(fileBean));

	      	fileBean.setFileGrpSeq(jobFairInfo.getSupporterFileGrpSeq());
	      	mv.addObject("supporterImg", commonService.selectAttachFilesList(fileBean));

	      	fileBean.setFileGrpSeq(jobFairInfo.getBoothFileGrpSeq());
	      	mv.addObject("boothImg", commonService.selectAttachFilesList(fileBean));

	      	if(ConstVal.ROLE_USER_VAL.equals(userAuthCd) || ConstVal.ROLE_STDIT_VAL.equals(userAuthCd)) {

			} else if(ConstVal.ROLE_CMPNY_VAL.equals(userAuthCd)) { //Company
				JobFairPatcptnCompnyBean jobFairPatcptnCompnyBean = jobFairService.selectJobFairApplyPatcptnCompny(conditionBean.getCondSeq(), userSeq);
				if(jobFairPatcptnCompnyBean != null) {
					jcAgreeStsCd = jobFairPatcptnCompnyBean.getJcAgreeStsCd();
				}

			} else if(ConstVal.ROLE_TRNCT_VAL.equals(userAuthCd)) { //Institute
				JobFairPatcptnInsttBean  jobFairPatcptnInsttBean  = jobFairService.selectJobFairApplyPatcptnInstt(conditionBean.getCondSeq(), userSeq);
				if(jobFairPatcptnInsttBean != null) {
					jcAgreeStsCd = jobFairPatcptnInsttBean.getJcAgreeStsCd();
				}
			}
		}

		mv.addObject("jobFairInfo", jobFairInfo);
		mv.addObject("userAuthCd", userAuthCd);
		mv.addObject("jcAgreeStsCd", jcAgreeStsCd);
      	mv.addObject("fairImgPath", fairImgPath);

	  	return mv;
	}

	/**
	 * JobFair :: Apply event :: booth apply
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/boothApply")
	public ModelAndView boothApply(Locale locale,
		@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFair,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		JobFairCenterBean jobFairInfo = null;
		List<FileBean> boothImgList = null;
		List<JobFairBoothBean> jobFairBoothList = null;
		String compnyInsttDivCd = "", alreadyResvWait = "N";

		String userSeq = "";
		String userAuthCd = "";

		if(principal != null) {
			userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		  	userAuthCd = SessionUtil.getUserAuthCd(req);
		}

	  	String langCd = locale.getLanguage().toUpperCase();

		if(ConstVal.ROLE_USER_VAL.equals(userAuthCd) || ConstVal.ROLE_STDIT_VAL.equals(userAuthCd)) {

		} else if(ConstVal.ROLE_CMPNY_VAL.equals(userAuthCd)) { //Company
			compnyInsttDivCd = ConstVal.COMPNY_INSTT_DIV_CD_COMPNY_VAL;
		} else if(ConstVal.ROLE_TRNCT_VAL.equals(userAuthCd)) { //Institute
			compnyInsttDivCd = ConstVal.COMPNY_INSTT_DIV_CD_INSTT_VAL;
		}

  		condFair.setLangCd(langCd);
  		condFair.setRegUserSeq(userSeq);
  		condFair.setCd(userAuthCd);

  		// select job fair information
		jobFairInfo = jobFairService.selectJobFairApplyInfo(condFair);

		if(jobFairInfo != null) {
			// select job fair booth image
	      	FileBean fileBean = new FileBean();
	      	fileBean.setFileGrpSeq(jobFairInfo.getBoothFileGrpSeq());
	      	boothImgList = commonService.selectAttachFilesList(fileBean);
		}

		// select job fair booth list
		jobFairBoothList = jobFairService.selectJobFairBoothList(condFair.getCondSeq(), langCd);

		// select booth reservation wait
	  	JobFairBoothResvWaitBean JobFairBoothResvWaitInfo = null;
	  	JobFairBoothResvWaitInfo = jobFairService.selectJobFairBoothResvWait(condFair.getCondSeq(), userSeq, compnyInsttDivCd);
	  	if(JobFairBoothResvWaitInfo != null) { // 이미 예약대기자 신청이 되어 있습니다!
	  		alreadyResvWait = "Y";
	  	}

  		// return
	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/boothApply.one");//BOARD BASIC TYPE
  		mv.addObject("jobFairInfo", jobFairInfo);
      	mv.addObject("boothImg", boothImgList);
		mv.addObject("userAuthCd", userAuthCd);
		mv.addObject("jobFairBoothList", jobFairBoothList);
		mv.addObject("alreadyResvWait", alreadyResvWait);
	  	return mv;
	}

	/**
	 * Job Fair Booth Apply Popup
	 * @param locale
	 * @param condFair
	 * @param boothSeq
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/boothReqPopup")
	public ModelAndView boothReqPopup(Locale locale,
	  	@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFair,
	  	String boothSeq,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		JobFairCenterBean jobFairInfo = null;
		JobFairBoothBean jobFairBooth = null;
		String compnyNm = "", mngerNm = "", mngerCell = "", mngerEmail = "";

		String userSeq = "";
		String userAuthCd = "";
		if(principal != null) {
			userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		  	userAuthCd = SessionUtil.getUserAuthCd(req);
		}

	  	String langCd = locale.getLanguage().toUpperCase();

  		condFair.setLangCd(langCd);
  		condFair.setRegUserSeq(userSeq);
  		condFair.setCd(userAuthCd);

  		// select job fair information
		jobFairInfo = jobFairService.selectJobFairApplyInfo(condFair);

		// select job fair booth information
		jobFairBooth = jobFairService.selectJobFairBooth(boothSeq, condFair.getCondSeq());

		if(ConstVal.ROLE_USER_VAL.equals(userAuthCd) || ConstVal.ROLE_STDIT_VAL.equals(userAuthCd)) {

		} else if(ConstVal.ROLE_CMPNY_VAL.equals(userAuthCd)) { //Company
			CompnyMemBean compnyMemBean = compnyService.selectCompnyByUserSeq(userSeq, langCd);
			if(compnyMemBean != null) {
				compnyNm = compnyMemBean.getCompnyNm();
				mngerNm = compnyMemBean.getMngerNm();
				mngerCell = compnyMemBean.getMngerTel();
				mngerEmail= compnyMemBean.getMngerEmail();
			}
		} else if(ConstVal.ROLE_TRNCT_VAL.equals(userAuthCd)) { //Institute
			InsttMemBean insttMemBean = insttService.selectInsttByUser(userSeq, langCd);
			if(insttMemBean != null) {
				compnyNm = insttMemBean.getInsttNm();
				mngerNm = insttMemBean.getInsttMngerNm();
				mngerCell = insttMemBean.getInsttCell();
				mngerEmail = insttMemBean.getInsttEmail();
			}
		}

  		// return
	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/boothReqPopup.one");//BOARD BASIC TYPE
	  	mv.addObject("userAuthCd", userAuthCd);
  		mv.addObject("jobFairInfo", jobFairInfo);
  		mv.addObject("jobFairBooth", jobFairBooth);
		mv.addObject("compnyNm", compnyNm);
		mv.addObject("mngerNm", mngerNm);
		mv.addObject("mngerCell", mngerCell);
		mv.addObject("mngerEmail", mngerEmail);
	  	return mv;
	}

	/**
	 * Job Fair Booth Apply
	 * @param locale
	 * @param jobFairBoothBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boothReqAjax", method = RequestMethod.POST)
	public ModelAndView boothReqAjax(Locale locale,
		@ModelAttribute("JobFairBoothHistBean") JobFairBoothHistBean jobFairBoothHist,
		@ModelAttribute("JobFairBoothBean") JobFairBoothBean jobFairBooth,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();
    	JobFairBoothBean jobFairBooth2 = null;

		String userSeq = "";
		String userAuthCd = "";

		if(principal != null) {
			userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
			userAuthCd = SessionUtil.getUserAuthCd(req);
		}

	  	String langCd = locale.getLanguage().toUpperCase();

		// select job fair booth information
	  	jobFairBooth2 = jobFairService.selectJobFairBooth(jobFairBooth.getBoothSeq(), jobFairBooth.getFairSeq());
		if(jobFairBooth2 != null && !"BSC0000000001".equals(jobFairBooth2.getBoothStsCd())) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL); //해당 부스가 이미 예약신청되어 있어서 처리할 수 없습니다!
			ajaxResultBean.setStatCd("ERR_NOT_ALLOW_STS");
			mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		    return mv;
		}

		jobFairBooth.setRegUserSeq(userSeq);
		jobFairBoothHist.setRegUserSeq(userSeq);
		jobFairService.insertJobFairBoothApply(jobFairBoothHist, jobFairBooth, userAuthCd, langCd);

      	// set ajax information
		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
		// return
		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * Job Fair Booth booking Popup
	 * @param locale
	 * @param condFair
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/boothBookingPopup")
	public ModelAndView boothBookingPopup(Locale locale,
	  	@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFair,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		JobFairCenterBean jobFairInfo = null;
		String compnyNm = "", mngerNm = "", mngerCell = "", mngerEmail = "";

		String userSeq = "";
		String userAuthCd = "";

		if(principal != null) {
			userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
			userAuthCd = SessionUtil.getUserAuthCd(req);
		}

	  	String langCd = locale.getLanguage().toUpperCase();

  		condFair.setLangCd(langCd);
  		condFair.setRegUserSeq(userSeq);
  		condFair.setCd(userAuthCd);

  		// select job fair information
		jobFairInfo = jobFairService.selectJobFairApplyInfo(condFair);

		if(ConstVal.ROLE_USER_VAL.equals(userAuthCd) || ConstVal.ROLE_STDIT_VAL.equals(userAuthCd)) {

		} else if(ConstVal.ROLE_CMPNY_VAL.equals(userAuthCd)) { //Company
			CompnyMemBean compnyMemBean = compnyService.selectCompnyByUserSeq(userSeq, langCd);
			if(compnyMemBean != null) {
				compnyNm = compnyMemBean.getCompnyNm();
				mngerNm = compnyMemBean.getMngerNm();
				mngerCell = compnyMemBean.getMngerCell();
				mngerEmail= compnyMemBean.getMngerEmail();
			}
		} else if(ConstVal.ROLE_TRNCT_VAL.equals(userAuthCd)) { //Institute
			InsttMemBean insttMemBean = insttService.selectInsttByUser(userSeq, langCd);
			if(insttMemBean != null) {
				compnyNm = insttMemBean.getInsttNm();
				mngerNm = insttMemBean.getInsttMngerNm();
				mngerCell = insttMemBean.getInsttCell();
				mngerEmail = insttMemBean.getInsttEmail();
			}
		}

  		// return
	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/boothBookingPopup.one");//BOARD BASIC TYPE
	  	mv.addObject("userAuthCd", userAuthCd);
  		mv.addObject("jobFairInfo", jobFairInfo);
		mv.addObject("compnyNm", compnyNm);
		mv.addObject("mngerNm", mngerNm);
		mv.addObject("mngerCell", mngerCell);
		mv.addObject("mngerEmail", mngerEmail);
	  	return mv;
	}

	/**
	 * Job Fair Booth Reservation Waiting :: save
	 * @param locale
	 * @param jobFairBoothResvWaitBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boothBookingAjax", method = RequestMethod.POST)
	public ModelAndView boothBookingAjax(Locale locale,
		@ModelAttribute("JobFairBoothResvWaitBean") JobFairBoothResvWaitBean jobFairBoothResvWaitBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);
	  	String langCd = locale.getLanguage().toUpperCase();

	  	if(ConstVal.ROLE_USER_VAL.equals(userAuthCd) || ConstVal.ROLE_STDIT_VAL.equals(userAuthCd)) {
		} else if(ConstVal.ROLE_CMPNY_VAL.equals(userAuthCd)) { //Company
			jobFairBoothResvWaitBean.setCompnyInsttDivCd(ConstVal.COMPNY_INSTT_DIV_CD_COMPNY_VAL);
			CompnyMemBean compnyMemBean = compnyService.selectCompnyByUserSeq(userSeq, langCd);
			if(compnyMemBean != null) {
				jobFairBoothResvWaitBean.setCompnyInsttSeq(compnyMemBean.getCompnySeq());
			}
		} else if(ConstVal.ROLE_TRNCT_VAL.equals(userAuthCd)) { //Institute
			jobFairBoothResvWaitBean.setCompnyInsttDivCd(ConstVal.COMPNY_INSTT_DIV_CD_INSTT_VAL);
			InsttMemBean insttMemBean = insttService.selectInsttByUser(userSeq, langCd);
			if(insttMemBean != null) {
				jobFairBoothResvWaitBean.setCompnyInsttSeq(insttMemBean.getInsttSeq());
			}
		}

	  	JobFairBoothResvWaitBean JobFairBoothResvWaitInfo = null;
	  	JobFairBoothResvWaitInfo = jobFairService.selectJobFairBoothResvWait(jobFairBoothResvWaitBean.getFairSeq(), userSeq, jobFairBoothResvWaitBean.getCompnyInsttDivCd());
	  	if(JobFairBoothResvWaitInfo != null) { // 이미 예약대기자 신청이 되어 있습니다!
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd("ERR_EXIST");
			mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		    return mv;
	  	}

	  	jobFairBoothResvWaitBean.setRegUserSeq(userSeq);
		jobFairService.insertJobFairBoothResvWait(jobFairBoothResvWaitBean);

      	// set ajax information
		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
		// return
		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * Job Fair List
	 * @param locale
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobFairList")
	public ModelAndView jobFairList(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/jobFairList.one");//BOARD BASIC TYPE

		if(principal != null) {
      		mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.YES_VAL);
      	}

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

		// Location (1 Depth)
		conditionBean.setCondGrpCd(null);
        mv.addObject("locCdList", commonService.selectLocCdList(conditionBean));

        // Fair Category
  		conditionBean.setCondGrpCd(ConstVal.GRP_CD_FAIR_DIV_CD_VAL);
  		mv.addObject("fairDivCdList", commonService.selectCommCdList(conditionBean));

	  	return mv;
	}

	/**
	 * JobFair :: View
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/jobFairView")
	public ModelAndView jobFairView(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFair,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		JobFairCenterBean jobFairInfo = null;
		String fairImgPath = "";
		String userSeq = "";
		String userAuthCd = "";

		if(principal != null) {
			userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
			userAuthCd = SessionUtil.getUserAuthCd(req);
		}

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/jobFairView.one");

		if(principal != null) {
      		mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.YES_VAL);
      	}

  		condFair.setLangCd(locale.getLanguage().toUpperCase());
  		condFair.setRegUserSeq(userSeq);
  		condFair.setCd(userAuthCd);
		jobFairInfo = jobFairService.selectJobFairApplyInfo(condFair);
		String jcAgreeStsCd = "";

		if(jobFairInfo != null) {
	      	FileBean fileBean = new FileBean();

	      	fileBean.setFileGrpSeq(jobFairInfo.getFairFileGrpSeq());
	      	List<FileBean> fairImgList = commonService.selectAttachFilesList(fileBean);
	      	if(fairImgList != null && fairImgList.size() > 0) {
	      		fairImgPath = fairImgList.get(0).getSaveFilePath();
	      	}

	      	fileBean.setFileGrpSeq(jobFairInfo.getSponsorFileGrpSeq());
	      	mv.addObject("sponsorImg", commonService.selectAttachFilesList(fileBean));

	      	fileBean.setFileGrpSeq(jobFairInfo.getSupporterFileGrpSeq());
	      	mv.addObject("supporterImg", commonService.selectAttachFilesList(fileBean));

	      	fileBean.setFileGrpSeq(jobFairInfo.getBoothFileGrpSeq());
	      	mv.addObject("boothImg", commonService.selectAttachFilesList(fileBean));

	      	if(ConstVal.ROLE_USER_VAL.equals(userAuthCd) || ConstVal.ROLE_STDIT_VAL.equals(userAuthCd)) {

			} else if(ConstVal.ROLE_CMPNY_VAL.equals(userAuthCd)) { //Company
				JobFairPatcptnCompnyBean jobFairPatcptnCompnyBean = jobFairService.selectJobFairApplyPatcptnCompny(conditionBean.getCondSeq(), userSeq);
				if(jobFairPatcptnCompnyBean != null) {
					jcAgreeStsCd = jobFairPatcptnCompnyBean.getJcAgreeStsCd();
				}

			} else if(ConstVal.ROLE_TRNCT_VAL.equals(userAuthCd)) { //Institute
				JobFairPatcptnInsttBean  jobFairPatcptnInsttBean  = jobFairService.selectJobFairApplyPatcptnInstt(conditionBean.getCondSeq(), userSeq);
				if(jobFairPatcptnInsttBean != null) {
					jcAgreeStsCd = jobFairPatcptnInsttBean.getJcAgreeStsCd();
				}
			}
		}

		mv.addObject("jobFairInfo", jobFairInfo);
		mv.addObject("userAuthCd", userAuthCd);
		mv.addObject("jcAgreeStsCd", jcAgreeStsCd);
      	mv.addObject("fairImgPath", fairImgPath);

	  	return mv;
	}

	/**
	 * Job Fair Calendar
	 * @param locale
	 * @param conditionBean
	 * @param condFair
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobFairCalendar")
	public ModelAndView jobFairCalendar(Locale locale,
		String year,
		String month,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		String userSeq = "";
		String userAuthCd = "";

		if(principal != null) {
			userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
			userAuthCd = SessionUtil.getUserAuthCd(req);
		}
	  	String langCd = locale.getLanguage().toUpperCase();

		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH);
		int d = cal.get(Calendar.DATE);
	  	if(year != null && !"".equals(year.trim())) {
			y = Integer.parseInt(year);
	  	}
	  	if(month != null && !"".equals(month.trim())) {
			m = Integer.parseInt(month);
			m--;
	  	}

		cal.set(y, m, 1);
		int offset = cal.get(Calendar.DAY_OF_WEEK);
		int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

		cal.set(y, m, endDay);
		int offset2 = cal.get(Calendar.DAY_OF_WEEK);
		cal.add(Calendar.DATE, 7-offset2);

		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		Calendar prevCal = Calendar.getInstance();
		prevCal.set(y, m, 1);
		prevCal.add(Calendar.DATE, (offset-1)*-1);

		String startDt = sdf.format(prevCal.getTime());
		String endDt = sdf.format(cal.getTime());

		int jobFairCnt = jobFairService.selectJobFairTermCnt(startDt, endDt, langCd);
		List<JobFairCenterBean> jobFairList= jobFairService.selectJobFairTermList(startDt, endDt, langCd);

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/jobFairCalendar.one");
		mv.addObject("jobFairCnt", jobFairCnt);
		mv.addObject("jobFairList", jobFairList);
	  	return mv;
	}

	/**
	 * type of jobfair list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/typeList")
	public ModelAndView typeList(Locale locale,
			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
			@RequestParam(required = false, defaultValue = "15") int pageUnit,
			@RequestParam(required = false, defaultValue = "10") int pageSize,
			@RequestParam(required = false, defaultValue = "0") int tabNo,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFairBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {

			String userSeq = "";

			if(principal != null) {
				userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
			}

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/typeList.one");//BOARD BASIC TYPE
	  	mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.NO_VAL);

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
      	condFairBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condFairBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condFairBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

  		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//language code
  		condFairBean.setRegUserSeq(userSeq);

  		conditionBean.setCondGrpCd(ConstVal.GRP_CD_FAIR_DIV_CD_VAL);
        mv.addObject("fairDivCds", commonService.selectCommCdList(conditionBean));//   //고용 형태

//	  	mv.addObject(ConstVal.RESULT_KEY, jobFairService.selectJobFairCnt(condJobFairCenterBean));

        if(tabNo <= 0) {
        	condFairBean.setCondFairDivCd(null);
        }

	  	int totCnt = jobFairService.selectJobFairListCnt(condFairBean);
	  	paginationInfo.setTotalRecordCount(totCnt);
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, jobFairService.selectJobFairList(condFairBean));
		}

		mv.addObject("tabNo", tabNo);

	  	return mv;

	}

	/**
	 * jobfair detail
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/view")
	public ModelAndView view(Locale locale,
			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
			@RequestParam(required = false, defaultValue = "10") int pageUnit,
			@RequestParam(required = false, defaultValue = "10") int pageSize,
			@RequestParam(required = false, defaultValue = "0") int tabNo,
			@RequestParam(required = false, defaultValue = "0") int pTabNo,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFairBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {

			String userSeq = "";

			if(principal != null) {
				userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
			}

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobFair/view.one");
	  	mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.NO_VAL);

  		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//language code
  		condFairBean.setRegUserSeq(userSeq);

  		mv.addObject("tabNo", tabNo);
  		mv.addObject("pTabNo", pTabNo);
		mv.addObject("jobFairInfo", jobFairService.selectJobFairInfo(condFairBean));

	  	return mv;

	}

	  /**
	   * jobfair detail
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	   */
	  @RequestMapping("/viewAjax")
	  public ModelAndView viewAjax(Locale locale,
			  @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			  @ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFairBean,
			  Principal principal,
			  HttpServletRequest req,
			  HttpServletResponse res) throws Exception {

		  ModelAndView mv = new ModelAndView();
		  String userSeq = "";

		  if(principal != null) {
			  userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		  }

		  condFairBean.setRegUserSeq(userSeq);
		  condFairBean.setLangCd(locale.getLanguage().toUpperCase());

		  PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
				  conditionBean.getPageSize());
		  condFairBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
		  condFairBean.setLastIndex(paginationInfo.getLastRecordIndex());
		  condFairBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		  int totCnt = 0;

		  switch (conditionBean.getCondLvl()) {
		  case "1":
			  totCnt = jobFairService.selectJobFairByEmployersCnt(condFairBean);
			  if(totCnt > 0) {
				  mv.addObject(ConstVal.RESULT_KEY, jobFairService.selectJobFairByEmployers(condFairBean));
			  }

			  break;
		  case "2":
			  totCnt = jobFairService.selectJobFairByVacancysCnt(condFairBean);
			  if(totCnt > 0) {
				  mv.addObject(ConstVal.RESULT_KEY, jobFairService.selectJobFairByVacancys(condFairBean));
			  }

			  break;
		  case "3":
			  totCnt = jobFairService.selectJobFairByEduInsttsCnt(condFairBean);
			  if(totCnt > 0) {
				  mv.addObject(ConstVal.RESULT_KEY, jobFairService.selectJobFairByEduInstts(condFairBean));
			  }

			  break;
		  case "4":
			  totCnt = jobFairService.selectJobFairByWorkShopsCnt(condFairBean);
			  if(totCnt > 0) {
				  mv.addObject(ConstVal.RESULT_KEY, jobFairService.selectJobFairByWorkShops(condFairBean));
			  }

			  break;
		  }
		  paginationInfo.setTotalRecordCount(totCnt);
		  conditionBean.setRecordsTotal(totCnt);

		  CpesPaginationTag pTag = new CpesPaginationTag();

		  mv.addObject("totalPageCount", paginationInfo.getTotalRecordCount());
		  mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
		  mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

		  mv.setViewName(ConstVal.JSON_VIEW_KEY);
		  return mv;

	  }

	  /**
	   * jobfair detail
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	   */
	  @RequestMapping("/view_bak")
	  public ModelAndView view_bak(Locale locale,
			  @RequestParam(required = false, defaultValue = "1") int currentPageNo,
			  @RequestParam(required = false, defaultValue = "10") int pageUnit,
			  @RequestParam(required = false, defaultValue = "10") int pageSize,
			  @RequestParam(required = false, defaultValue = "0") int tabNo,
			  @RequestParam(required = false, defaultValue = "0") int pTabNo,
			  @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			  @ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFairBean,
			  Principal principal,
			  HttpServletRequest req,
			  HttpServletResponse res) throws Exception {

		  String userSeq = "";

		  if(principal != null) {
			  userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		  }

		  ModelAndView mv = new ModelAndView();
		  mv.setViewName("jobFair/view_bak.one");//게시판 기본유형,BASIC TYPE
		  mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.NO_VAL);

		  PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
		  condFairBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
		  condFairBean.setLastIndex(paginationInfo.getLastRecordIndex());
		  condFairBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());


		  condFairBean.setLangCd(locale.getLanguage().toUpperCase());//language code
		  condFairBean.setRegUserSeq(userSeq);

		  mv.addObject("tabNo", tabNo);
		  mv.addObject("pTabNo", pTabNo);
		  mv.addObject("jobFairInfo", jobFairService.selectJobFairInfo(condFairBean));

		  if ( tabNo > 0) {
			  int totCnt = 0;

			  switch (tabNo) {
			  case 1:
				  totCnt = jobFairService.selectJobFairByEmployersCnt(condFairBean);
				  if(totCnt > 0) {
					  mv.addObject("resultList", jobFairService.selectJobFairByEmployers(condFairBean));
				  }

				  break;
			  case 2:
				  totCnt = jobFairService.selectJobFairByVacancysCnt(condFairBean);
				  if(totCnt > 0) {
					  mv.addObject("resultList", jobFairService.selectJobFairByVacancys(condFairBean));
				  }

				  break;
			  case 3:
				  totCnt = jobFairService.selectJobFairByEduInsttsCnt(condFairBean);
				  if(totCnt > 0) {
					  mv.addObject("resultList", jobFairService.selectJobFairByEduInstts(condFairBean));
				  }

				  break;
			  case 4:
				  totCnt = jobFairService.selectJobFairByWorkShopsCnt(condFairBean);
				  if(totCnt > 0) {
					  mv.addObject("resultList", jobFairService.selectJobFairByWorkShops(condFairBean));
				  }

				  break;
			  }

			  paginationInfo.setTotalRecordCount(totCnt);
			  mv.addObject("paginationInfo", paginationInfo);

		  }

		  return mv;

	  }

	  @RequestMapping("/workshopApply")
	  public ModelAndView workshopApply(Locale locale,
			  @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			  @ModelAttribute("WorkShopBean") WorkShopBean workshopBean,
			  Principal principal,
			  HttpServletRequest req,
			  HttpServletResponse res) throws Exception {
			ModelAndView mv = new ModelAndView();

		  if(principal != null) {
			  workshopBean.setUserSeq(SessionUtil.getUserSeq(req));
			  workshopBean.setRegUserSeq(SessionUtil.getUserSeq(req));
		  }

		  int result = jobFairService.insertFairWorkshopPatcptn(workshopBean);
			if(result > 0) {
				mv.addObject("seq", workshopBean.getFairWorkshopPatcptnSeq());
				mv.addObject(ConstVal.RESULT_KEY, ConstVal.YES_VAL);
			}else {
				mv.addObject(ConstVal.RESULT_KEY, ConstVal.NO_VAL);
			}


			mv.setViewName(ConstVal.JSON_VIEW_KEY);
			return mv;
	  }

	  @RequestMapping("/workshopView")
	  public ModelAndView workshopView(Locale locale,
			  @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			  @ModelAttribute("CondWorkShopBean") CondWorkShopBean condWorkShopBean,
			  Principal principal,
			  HttpServletRequest req,
			  HttpServletResponse res) throws Exception {

		  ModelAndView mv = new ModelAndView();
		  mv.setViewName("jobFair/workshopView.one");

		  if(StringUtil.isEmpty(condWorkShopBean.getCondSeq())) {
			  mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
			  return mv;
		  }

		  condWorkShopBean.setLangCd(locale.getLanguage().toUpperCase());
		  if(principal != null) {
			  condWorkShopBean.setCondUserSeq(SessionUtil.getUserSeq(req));
		  }
		  int count = jobFairService.selectJobFairWorkShopCnt(condWorkShopBean);

		  WorkShopBean workshopBean = jobFairService.selectJobFairWorkShop(condWorkShopBean);
		  if(StringUtil.isEmpty(workshopBean)) {
			  mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
			  return mv;
		  }
		  workshopBean.setRecurmtManCnt(count);

		  mv.addObject("applyClass", count <= 0 ? "on" : "");
		  mv.addObject(ConstVal.RESULT_KEY, workshopBean);

		  return mv;

	  }

		/**
		 * job fair list by location
		 *
		 * @param req
		 * @param res
		 * @return ModelAndView
		 * @throws Exception
		 */
		@RequestMapping("/locList")
		public ModelAndView locList(Locale locale,
				@RequestParam(required = false, defaultValue = "1") int currentPageNo,
				@RequestParam(required = false, defaultValue = "10") int pageUnit,
				@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean condFairBean,
				Principal principal,
				HttpServletRequest req, HttpServletResponse res) throws Exception {

			ModelAndView mv = new ModelAndView();
			mv.setViewName("jobFair/locList.one");

			conditionBean.setLangCd(locale.getLanguage().toUpperCase());
			conditionBean.setCondCntryId(ConstVal.CONTRY_CD_CAMBODIA_VAL);

			// Location
			mv.addObject("locCd", commonService.selectLocCdList(conditionBean));

			return mv;

		}

		/**
		 * job fair list ajax by location
		 *
		 * @param req
		 * @param res
		 * @return ModelAndView
		 * @throws Exception
		 */
		@RequestMapping("/locListAjax")
		public ModelAndView locListAjax(Locale locale,
				@ModelAttribute("CondJobFairCenterBean") CondJobFairCenterBean conditionBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {
			ModelAndView mv = new ModelAndView();

//			conditionBean.setCondFairDivCd(ConstVal.EDU_DIV_CD_INSTT_VAL);

			if (principal != null) {
				conditionBean.setRegUserSeq(SessionUtil.getUserSeq(req));
			}

			PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
					conditionBean.getPageSize());
			conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
			conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
			conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			int totCnt = jobFairService.selectJobFairListCnt(conditionBean);
			paginationInfo.setTotalRecordCount(totCnt);
			conditionBean.setRecordsTotal(totCnt);

			if(totCnt > 0) {
				List<JobFairCenterBean> list = jobFairService.selectJobFairList(conditionBean);
				mv.addObject(ConstVal.RESULT_KEY, list);
			}

			CpesPaginationTag pTag = new CpesPaginationTag();

			mv.addObject("totalPageCount", paginationInfo.getTotalRecordCount());
			mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
			mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

			mv.setViewName(ConstVal.JSON_VIEW_KEY);
			return mv;
		}
}
