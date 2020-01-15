package ony.cpes.external.mypage.compny.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.service.CompnyApplicService;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.ReferralBean;
import ony.framework.BaseController;
import ony.framework.bean.ExcelDownloadHelperBean;
import ony.framework.util.ExcelDownloadHelper;
import ony.framework.util.KeyGenerateUtil;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/compny/applic")
@Controller
public class CompnyApplicController extends BaseController {
	private static Log log = LogFactory.getLog(CompnyApplicController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private CompnyApplicService compnyApplicService;


	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	@Autowired MessageSource messageSource;


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
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/applic/list.left");


		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));

		mv.addObject(ConstVal.RESULT_LIST2_KEY, compnyApplicService.selectVacancySimpleList(condApplicBean));

		return mv;

	}



	/**
	 * 입사지원 목록
	 * private applic list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/listAjax")
	  public ModelAndView listAjax(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/applic/listForm.empty");

	  	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));
	  	condApplicBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
	  	condApplicBean.setLastIndex(paginationInfo.getLastRecordIndex());
	  	condApplicBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	  	mv.addObject(ConstVal.RESULT_KEY, compnyApplicService.selectApplicStatCnt(condApplicBean));


	  	int totCnt = compnyApplicService.selectApplicListCnt(condApplicBean);
	  	paginationInfo.setTotalRecordCount(totCnt);
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, compnyApplicService.selectApplicList(condApplicBean));

		  	conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_APPLIC_PROC_CD_VAL);
		  	mv.addObject("applicProcCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드
		}

		mv.addObject(ConstVal.RESULT2_KEY, condApplicBean.getCondSeq());

		return mv;

	}


	/**
	 * 입사지원 목록
	 * private applic list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/listDtlAjax")
	  public ModelAndView listDtlAjax(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/applic/listDtlForm.empty");

	  	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));
	  	condApplicBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
	  	condApplicBean.setLastIndex(paginationInfo.getLastRecordIndex());
	  	condApplicBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	  	int totCnt = compnyApplicService.selectApplicListCnt(condApplicBean);
	  	paginationInfo.setTotalRecordCount(totCnt);
		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, compnyApplicService.selectApplicList(condApplicBean));

		  	conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_APPLIC_PROC_CD_VAL);
		  	mv.addObject("applicProcCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드
		}

		mv.addObject(ConstVal.RESULT2_KEY, condApplicBean.getCondSeq());

		return mv;

	}

	@RequestMapping("/listExcel")
	public void listExcel(Locale locale, Principal principal, HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		CondApplicBean condBean = (CondApplicBean) getObjectFromJSON(req, CondApplicBean.class);

		condBean.setLangCd(locale.getLanguage().toUpperCase());// 언어코드,lanuage code
		condBean.setCondUserSeq(SessionUtil.getUserSeq(req));

//		TreeMap<Integer, String> header = new TreeMap<Integer, String>();
//		header.put(1, "COMPNY_NM");
//		header.put(2, "VACANCY_STS_NM");
//		header.put(3, "VACANCY_TITLE");
//		header.put(4, "USER_NM");
//		header.put(5, "AGE");
//		header.put(6, "RESUME_TITLE");
//		header.put(7, "EDU_DEGREE_NM");
//		header.put(8, "ISCO_NM");

		List<Map<String, Object>> dataList = compnyApplicService.selectApplicExcelList(condBean);

//		Map<String, Object> excelMap = new HashMap<String, Object>();
//		excelMap.put("data", dataList);
//		excelMap.put("header", header);
//		excelMap.put("fileName", "입사지원관리목록");

		// return new ModelAndView("excelDownloadView", "excelMap", excelMap);

		String userEmail = SessionUtil.getUserBean(req).getUserEmail();

		String defaultPath = "C:\\cpesSource\\egov\\workspace\\cpesEx\\src\\main\\webapp\\upload\\mypage";
		defaultPath += "\\" + userEmail.substring(0, userEmail.indexOf("@"));
		String serverfileName = KeyGenerateUtil.getUUID();
		String originalFileName = messageSource.getMessage("mypage.compny.applic.title3", null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)) + ".xlsx";
		int columnCnt = 8;

		ExcelDownloadHelperBean excelBean = new ExcelDownloadHelperBean();
		List<ExcelDownloadHelperBean> lst = new ArrayList<ExcelDownloadHelperBean>(dataList.size() + 1);// header 더하기

		ExcelDownloadHelperBean beanHeader = new ExcelDownloadHelperBean();
		beanHeader.setCell1(messageSource.getMessage("search.name", null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));//이름
		beanHeader.setCell2(messageSource.getMessage("mypage.compny.applic.title4", null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));//나이
		beanHeader.setCell3(messageSource.getMessage("mypage.compny.applic.title5", null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));//이력서제목
		beanHeader.setCell4(messageSource.getMessage("mypage.compny.profile.title19", null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));//학력
		beanHeader.setCell5(messageSource.getMessage("mypage.compny.applic.title6", null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));//직종
		beanHeader.setCell6(messageSource.getMessage("resume.text.career", null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));//경력
		beanHeader.setCell7(messageSource.getMessage("mypage.compny.applic.title7", null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));//상태

		lst.add(beanHeader);

		for (Map<String, Object> map : dataList) {
			ExcelDownloadHelperBean bean = new ExcelDownloadHelperBean();

			bean.setCell1(map.get("USER_NM").toString());
			bean.setCell2(map.get("AGE").toString());
			bean.setCell3(map.get("RESUME_TITLE").toString());
			bean.setCell4(map.get("EDU_DEGREE_NM").toString());
			bean.setCell5(map.get("ISCO_NM").toString());
			bean.setCell6(map.get("CAREER_YN").toString());
			bean.setCell7(map.get("APPLIC_PROC_NM").toString());

			lst.add(bean);
		}

		excelBean.setList(lst);

		ExcelDownloadHelper.ExcelDown(req, res, defaultPath, serverfileName, originalFileName, columnCnt, excelBean);
	}

	/**
	 * 입사지원 상태 변경
	 * applic cancel
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/updateProcStatAjax", method = RequestMethod.POST)
	public ModelAndView updateProcStatAjax(Locale locale,
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

  		if(compnyApplicService.updateProcStat(condApplicBean) > 0) {
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
	 * 입사지원 이력서 열람 처리
	 * applic cv open
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/updateResumeOpenAjax", method = RequestMethod.POST)
	public ModelAndView updateResumeOpenAjax(Locale locale,
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

  		if(compnyApplicService.updateResumeOpen(condApplicBean) > 0) {
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
	 * 입사지원 이력서 열람 처리 다수
	 * applic cv open multi
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/updateResumeOpenMultiAjax", method = RequestMethod.POST)
	public ModelAndView updateResumeOpenMultiAjax(Locale locale,
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

  		if(compnyApplicService.updateResumeOpenMulti(condApplicBean) > 0) {
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
	 * 입사제의 목록
	 * compny offer list
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
		mv.setViewName("mypage/compny/applic/offerList.left");

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq( SessionUtil.getUserSeq(req));
      	condApplicBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condApplicBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condApplicBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = compnyApplicService.selectOfferListCnt(condApplicBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyApplicService.selectOfferList(condApplicBean));
    	}

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
		mv.setViewName("mypage/compny/applic/referralList.left");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone
		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condApplicBean.setCondUserSeq( SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	condApplicBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condApplicBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condApplicBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = compnyApplicService.selectReferralListCnt(condApplicBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyApplicService.selectReferralList(condApplicBean));
    	}

	  	conditionBean.setLangCd(locale.getLanguage().toUpperCase());
	  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_REFERRAL_REJECT_CD_VAL);
	  	mv.addObject("referralRejectCd", commonService.selectCommCdList(conditionBean));//거절사유

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

  		if(compnyApplicService.deleteReferral(condApplicBean) > 0) {
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


		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code


		String userSeq = SessionUtil.getUserSeq(req);
	    ReferralBean referralBean = new ReferralBean();

  		referralBean.setRegUserSeq(userSeq);
  		referralBean.setModUserSeq(userSeq);
  		referralBean.setVacancySeq(condApplicBean.getCondSeq());
  		referralBean.setResumeSeq(condApplicBean.getCondSeq2());
  		referralBean.setReferralRejectCd(condApplicBean.getCondText());

  		if(compnyApplicService.updateReferralNo(referralBean) > 0) {
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


		condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

		String userSeq = SessionUtil.getUserSeq(req);
  		ReferralBean referralBean = new ReferralBean();

  		referralBean.setRegUserSeq(userSeq);
  		referralBean.setModUserSeq(userSeq);
  		referralBean.setVacancySeq(condApplicBean.getCondSeq());
  		referralBean.setResumeSeq(condApplicBean.getCondSeq2());


  		if(compnyApplicService.updateReferralOk(referralBean) > 0) {
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

  		if(compnyApplicService.deleteOffer(condApplicBean) > 0) {
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
	 * 채용정보 목록
	 * community list
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
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/applic/vacancyList.left");

		condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());
      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		condVacancyBean.setCondUserSeq( SessionUtil.getUserSeq(req));
      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = compnyApplicService.selectVacancyListCnt(condVacancyBean);
    	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyApplicService.selectVacancyList(condVacancyBean));
    	}


    	return mv;
	}

	/**
	 * 알선 신청
	 * referral request
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/referralReqProcessAjax", method = RequestMethod.POST)
	public ModelAndView referralReqProcessAjax(Locale locale,
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

  		if(compnyApplicService.updateReferralReq(condApplicBean) > 0) {
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
	 * 불합격 처리
	 * applic fail process
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/applicFailProcessAjax", method = RequestMethod.POST)
	public ModelAndView applicFailProcessAjax(Locale locale,
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

  		if(compnyApplicService.updateFailReason(condApplicBean) > 0) {
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
	 * 인터뷰 요청 처리
	 * applic interview process
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/intvwReqProcessAjax", method = RequestMethod.POST)
	public ModelAndView intvwReqProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				@ModelAttribute("IntvwBean") IntvwBean intvwBean,
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

  		intvwBean.setLangCd(locale.getLanguage().toUpperCase());
  		intvwBean.setRegUserSeq(userSeq);
  		intvwBean.setModUserSeq(userSeq);
  		if(StringUtil.isEmpty(intvwBean.getReferralYn())) {
  			intvwBean.setReferralYn(ConstVal.NO_VAL);
  		}

  		if(StringUtil.isEmpty(intvwBean.getIntvwTypeCd())) {
  			intvwBean.setIntvwTypeCd(ConstVal.INTVW_GRP_CD_OFFLINE_VAL);
  		}
  		intvwBean.setApplicSeq(condApplicBean.getCondSeq());


  		int result = compnyApplicService.updateIntvwReq(condApplicBean, intvwBean);

  		if(result > 0) {
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else if(result < 0){
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);

		return mv;
	}


}
