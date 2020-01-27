package ony.cpes.external.mypage.compny.controller;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
import ony.cpes.external.compny.service.CompnyService;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.bean.CompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyIntvwBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyIntvwBean;
import ony.cpes.external.mypage.compny.bean.VacancyLangBean;
import ony.cpes.external.mypage.compny.bean.VacancyLocBean;
import ony.cpes.external.mypage.compny.bean.VacancyPreferntBean;
import ony.cpes.external.mypage.compny.bean.VideoIntvwPatcptnBean;
import ony.cpes.external.mypage.compny.service.CompnyApplicService;
import ony.cpes.external.mypage.compny.service.CompnyIntvwService;
import ony.cpes.external.mypage.compny.service.CompnyMatchService;
import ony.cpes.external.mypage.compny.service.CompnyVacancyService;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/compny/vacancy")
@Controller
public class CompnyVacancyController extends BaseController {
	private static Log log = LogFactory.getLog(CompnyVacancyController.class);

	  @Autowired
	  private CommonService commonService;

	  @Autowired
	  private CompnyVacancyService compnyVacancyService;

	@Autowired
	private CompnyMatchService compnyMatchService;

	@Autowired
	private CompnyIntvwService compnyIntvwService;

	@Autowired
	private CompnyService compnyService;

	@Autowired
	private CompnyApplicService compnyApplicService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	@Autowired MessageSource messageSource;


	/**
	 * 채용정보 등록
	 * community wirte
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/write")
	  public ModelAndView write(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		  	ModelAndView mv = new ModelAndView();
		  	mv.setViewName("mypage/compny/vacancy/write.one");

		  	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	      	condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));

		  	mv.addObject(ConstVal.RESULT_LIST_KEY, compnyVacancyService.selectVacancySimpleList(condVacancyBean));//등록된 공고목록
		  	return mv;
	  }


	/**
	 * 채용정보 등록폼
	 * community wirte form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/writeFormAjax")
	  public ModelAndView writeFormAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		  	ModelAndView mv = new ModelAndView();
		  	mv.setViewName("mypage/compny/vacancy/writeForm.empty");

	      	conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	      	conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone
	      	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());
	      	condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));


		  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_FORM_CD_VAL);
		  	mv.addObject("employFormCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
		  	mv.addObject("employCtrctCd", commonService.selectCommCdList(conditionBean));//	//고용 계약조건

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_TYPE_CD_VAL);
		  	mv.addObject("employCtrctTypeCd", commonService.selectCommCdList(conditionBean));//	//고용 계약 유형

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
		  	mv.addObject("preferEmploymtTypeCd", commonService.selectCommCdList(conditionBean));//	//고용 형태

			//conditionBean.setCondGrpCd(ConstVal.GRP_CD_EXPCT_SALARY_CD_VAL);
		  	//mv.addObject("expctSalaryCd", commonService.selectCommCdList(conditionBean));//	//고용 형태

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_SALARY_UNIT_CD_VAL);
		  	mv.addObject("salaryUnitCd", commonService.selectCommCdList(conditionBean));//	//급여_단위_코드(SALARY_UNIT_CD)

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
		  	mv.addObject("langCd", commonService.selectCommCdList(conditionBean));//	//외국어

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_LVL_CD_VAL);
		  	mv.addObject("langLvlCd", commonService.selectCommCdList(conditionBean));//	//외국어 레벨

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFERNT_COND_CD_VAL);
		  	mv.addObject("preferntCondCd", commonService.selectCommCdList(conditionBean));//우대조건

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_MIN_EDU_DEGREE_CD_VAL);
		  	mv.addObject("minEduDegreeCd", commonService.selectCommCdList(conditionBean));//최소교육

		  	conditionBean.setCondLvl("1");//isced cd
		  	mv.addObject("iscedCdLvl1", commonService.selectIscedCdList(conditionBean));

		  	conditionBean.setCondLvl("1");//isic cd
		  	mv.addObject("isicCdLvl1", commonService.selectIsicCdList(conditionBean));

		  	if(StringUtil.isEmpty(condVacancyBean.getCondCopySeq())) {//copy 가 아닐경우
		  		return mv;
		  	} else {
		  		condVacancyBean.setCondTempYn(ConstVal.NO_VAL);

		  		VacancyBean vacancyBean = compnyVacancyService.selectVacancy(condVacancyBean);

		  		mv.addObject(ConstVal.RESULT_KEY, vacancyBean);

		  		if(!StringUtil.isEmpty(vacancyBean)) {//ISCED LEVLE 1
		  			conditionBean.setCondLvl("2");//LEVEL
		  			conditionBean.setCondUpperCd(vacancyBean.getIscedCdLvlOne());
		  			mv.addObject("iscedCdLvl2", commonService.selectIscedCdList(conditionBean));

		  			conditionBean.setCondUpperCd(vacancyBean.getIsicCdLvlOne());
		  			mv.addObject("isicCdLvl2", commonService.selectIsicCdList(conditionBean));
		  		}
		  	}

		  	return mv;
	  }


	/**
	 * 언어 등록폼
	 * lang wirte form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/langFormAjax")
	  public ModelAndView langFormAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		  	ModelAndView mv = new ModelAndView();
		  	mv.setViewName("mypage/compny/vacancy/langForm.empty");

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
		  	mv.addObject("langCd", commonService.selectCommCdList(conditionBean));//	//외국어

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_LVL_CD_VAL);
		  	mv.addObject("langLvlCd", commonService.selectCommCdList(conditionBean));//	//외국어 레벨
		  	mv.addObject("idNum",req.getParameter("idNum"));


		  	return mv;
	}

    /**
     * 채용등록 신규 저장
     * vacancy new insert
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/writeProcessAjax", method = RequestMethod.POST)
  	public ModelAndView writeProcessAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @RequestParam MultipartFile uploadImgFile,
  			@ModelAttribute("VacancyBean") VacancyBean vacancyBean,
  			@ModelAttribute("VacancyLangBean") VacancyLangBean vacancyLangBean,
  			@ModelAttribute("VacancyPreferntBean") VacancyPreferntBean vacancyPreferntBean,

  			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

      	String userSeq = SessionUtil.getUserSeq(req);
      	vacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
    	vacancyBean.setRegUserSeq(userSeq);
  		vacancyBean.setModUserSeq(userSeq);
  		vacancyLangBean.setRegUserSeq(userSeq);
  		vacancyLangBean.setModUserSeq(userSeq);
  		vacancyPreferntBean.setRegUserSeq(userSeq);
  		vacancyPreferntBean.setModUserSeq(userSeq);
      	vacancyBean.setVacancyLangBean(vacancyLangBean);
      	vacancyBean.setVacancyPreferntBean(vacancyPreferntBean);

      	if(uploadImgFile != null) {
      		String imgFileSeq = commonService.inserCommonFile(uploadImgFile, "", userSeq);
      		vacancyBean.setImgFileGrpSeq(imgFileSeq);
      	}

  		String uuid = compnyVacancyService.insertVacancy(vacancyBean);

  		if(!StringUtils.equals(ConstVal.SPACE_VAL,uuid)) {//입력성공, insert success
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}


    /**
     * 채용등록 신규 저장
     * vacancy new insert
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/writeProcessTempAjax", method = RequestMethod.POST)
  	public ModelAndView writeProcessTempAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
  			@ModelAttribute("VacancyBean") VacancyBean vacancyBean,
  			@ModelAttribute("VacancyLangBean") VacancyLangBean vacancyLangBean,
  			@ModelAttribute("VacancyPreferntBean") VacancyPreferntBean vacancyPreferntBean,

  			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

      	String userSeq = SessionUtil.getUserSeq(req);
      	vacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		vacancyBean.setRegUserSeq(userSeq);
  		vacancyBean.setModUserSeq(userSeq);
  		vacancyLangBean.setRegUserSeq(userSeq);
  		vacancyLangBean.setModUserSeq(userSeq);
  		vacancyPreferntBean.setRegUserSeq(userSeq);
  		vacancyPreferntBean.setModUserSeq(userSeq);
  		vacancyBean.setVacancyLangBean(vacancyLangBean);
  		vacancyBean.setVacancyPreferntBean(vacancyPreferntBean);

  		String uuid = compnyVacancyService.insertVacancyTemp(vacancyBean);

  		if(!StringUtils.equals(ConstVal.SPACE_VAL,uuid)) {//입력성공, insert success
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
      		ajaxResultBean.setMessage(uuid);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
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
	  @RequestMapping("/list")
	  public ModelAndView list(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		  	ModelAndView mv = new ModelAndView();
		  	mv.setViewName("mypage/compny/vacancy/list.left");

		  	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	      	condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));

	      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
	  	   	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
	      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
	      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	      	if(StringUtil.isEmpty(condVacancyBean.getCondStatCd())) {
	      		condVacancyBean.setCondStatCd(ConstVal.VACANCY_SEARCH_COND_DEFAULT_VAL);//채용중이 디퐅트
	      	}


	      	mv.addObject(ConstVal.RESULT_KEY, compnyVacancyService.selectVacancyCntInfo(condVacancyBean));//기업별 공고상태 count

	      	condVacancyBean.setCondBkmkCateCd(ConstVal.BKMK_CATE_CD_VACANCY_VAL);
	      	int totCnt = compnyVacancyService.selectVacancyListCnt(condVacancyBean);
	    	paginationInfo.setTotalRecordCount(totCnt);
	    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

	    	if(totCnt > 0) {
	    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyVacancyService.selectVacancyList(condVacancyBean));
	    	}


		  	return mv;
	  }


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
		  	mv.setViewName("mypage/compny/vacancy/view.left");

			condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      		condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
      		condVacancyBean.setCondCopySeq(condVacancyBean.getCondSeq());


		  	if(StringUtil.isEmpty(condVacancyBean.getCondSeq())) {//잘못된 접근
		  		mv.addObject(ConstVal.CONN_YN_KEY, ConstVal.NO_VAL);
		  		return mv;
		  	} else {
		  		VacancyBean vacancyBean = compnyVacancyService.selectVacancy(condVacancyBean);

		  		if(StringUtil.isEmpty(vacancyBean)) {//데이터 없음
		  			mv.addObject(ConstVal.NO_DATA_KEY, ConstVal.NO_VAL);
		  			return mv;
		  		}

		  		mv.addObject(ConstVal.RESULT_KEY, vacancyBean);

		  	}

		  	return mv;
	  }


	/**
	 * 채용정보 상세
	 * vacancy detail view
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/modify")
	  public ModelAndView modify(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		  	ModelAndView mv = new ModelAndView();
		  	mv.setViewName("mypage/compny/vacancy/modify.left");

		  	mv.addObject(ConstVal.TEMP_YN_KEY, condVacancyBean.getCondTempYn());

	      	conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	      	conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone

	      	condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      		condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
      		condVacancyBean.setCondCopySeq(condVacancyBean.getCondSeq());



		  	if(StringUtil.isEmpty(condVacancyBean.getCondSeq())) {//잘못된 접근
		  		mv.addObject(ConstVal.CONN_YN_KEY, ConstVal.NO_VAL);
		  		return mv;
		  	}

	  		VacancyBean vacancyBean = compnyVacancyService.selectVacancy(condVacancyBean);

	  		if(StringUtil.isEmpty(vacancyBean)) {//데이터 없음
	  			mv.addObject(ConstVal.NO_DATA_KEY, ConstVal.NO_VAL);
	  			return mv;
	  		}

	  		if(StringUtils.equals(ConstVal.NO_VAL, vacancyBean.getModifyYn())) {//수정권한이 없을경우 ,not modify permission
	  			mv.addObject(ConstVal.CONN_YN_KEY, ConstVal.NO_VAL);
		  		return mv;
	  		}

	  		mv.addObject(ConstVal.RESULT_KEY, vacancyBean);

		  	conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_FORM_CD_VAL);
		  	mv.addObject("employFormCd", commonService.selectCommCdList(conditionBean));//공고 구분 공통코드

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
		  	mv.addObject("employCtrctCd", commonService.selectCommCdList(conditionBean));//	//고용 계약조건

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_TYPE_CD_VAL);
		  	mv.addObject("employCtrctTypeCd", commonService.selectCommCdList(conditionBean));//	//고용 계약 유형

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
		  	mv.addObject("preferEmploymtTypeCd", commonService.selectCommCdList(conditionBean));//	//고용 형태


			conditionBean.setCondGrpCd(ConstVal.GRP_CD_SALARY_UNIT_CD_VAL);
		  	mv.addObject("salaryUnitCd", commonService.selectCommCdList(conditionBean));//	//급여_단위_코드(SALARY_UNIT_CD)

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
		  	mv.addObject("langCd", commonService.selectCommCdList(conditionBean));//	//외국어

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_LVL_CD_VAL);
		  	mv.addObject("langLvlCd", commonService.selectCommCdList(conditionBean));//	//외국어 레벨

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFERNT_COND_CD_VAL);
		  	mv.addObject("preferntCondCd", commonService.selectCommCdList(conditionBean));//우대조건

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_MIN_EDU_DEGREE_CD_VAL);
		  	mv.addObject("minEduDegreeCd", commonService.selectCommCdList(conditionBean));//최소교육

		  	conditionBean.setCondLvl("1");//isced cd
		  	mv.addObject("iscedCdLvl1", commonService.selectIscedCdList(conditionBean));

		  	conditionBean.setCondLvl("1");//isic cd
		  	mv.addObject("isicCdLvl1", commonService.selectIsicCdList(conditionBean));

  			conditionBean.setCondLvl("2");//LEVEL
  			conditionBean.setCondUpperCd(vacancyBean.getIscedCdLvlOne());
  			mv.addObject("iscedCdLvl2", commonService.selectIscedCdList(conditionBean));

  			conditionBean.setCondUpperCd(vacancyBean.getIsicCdLvlOne());
  			mv.addObject("isicCdLvl2", commonService.selectIsicCdList(conditionBean));

		  	return mv;

	}


    /**
     * 채용 수정
     * vacancy modify process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/modifyProcessAjax", method = RequestMethod.POST)
  	public ModelAndView modifyProcessAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
  			@ModelAttribute("VacancyBean") VacancyBean vacancyBean,
  			@ModelAttribute("VacancyLangBean") VacancyLangBean vacancyLangBean,
  			@ModelAttribute("VacancyPreferntBean") VacancyPreferntBean vacancyPreferntBean,
  			@ModelAttribute("VacancyLocBean") VacancyLocBean vacancyLocBean,
  			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

      	String userSeq = SessionUtil.getUserSeq(req);
      	vacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		vacancyBean.setRegUserSeq(userSeq);
  		vacancyBean.setModUserSeq(userSeq);
  		vacancyLangBean.setRegUserSeq(userSeq);
  		vacancyLangBean.setModUserSeq(userSeq);
  		vacancyPreferntBean.setRegUserSeq(userSeq);
  		vacancyPreferntBean.setModUserSeq(userSeq);
  		vacancyLocBean.setRegUserSeq(userSeq);
  		vacancyLocBean.setModUserSeq(userSeq);
  		vacancyBean.setVacancyLangBean(vacancyLangBean);
  		vacancyBean.setVacancyPreferntBean(vacancyPreferntBean);
  		vacancyBean.setVacancyLocBean(vacancyLocBean);


  		if(compnyVacancyService.updateVacancy(vacancyBean) > 0) {//입력성공, insert success
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
  		}


		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}


    /**
     * 채용 수정
     * vacancy modify process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/modifyProcessTempAjax", method = RequestMethod.POST)
  	public ModelAndView modifyProcessTempAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
  			@ModelAttribute("VacancyBean") VacancyBean vacancyBean,
  			@ModelAttribute("VacancyLangBean") VacancyLangBean vacancyLangBean,
  			@ModelAttribute("VacancyPreferntBean") VacancyPreferntBean vacancyPreferntBean,
  			@ModelAttribute("VacancyLocBean") VacancyLocBean vacancyLocBean,
  			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

      	String userSeq = SessionUtil.getUserSeq(req);
      	vacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		vacancyBean.setRegUserSeq(userSeq);
  		vacancyBean.setModUserSeq(userSeq);
  		vacancyLangBean.setRegUserSeq(userSeq);
  		vacancyLangBean.setModUserSeq(userSeq);
  		vacancyPreferntBean.setRegUserSeq(userSeq);
  		vacancyPreferntBean.setModUserSeq(userSeq);
  		vacancyLocBean.setRegUserSeq(userSeq);
  		vacancyLocBean.setModUserSeq(userSeq);

  		vacancyBean.setVacancyLangBean(vacancyLangBean);
  		vacancyBean.setVacancyPreferntBean(vacancyPreferntBean);
  		vacancyBean.setVacancyLocBean(vacancyLocBean);

  		if(compnyVacancyService.updateVacancyTemp(vacancyBean) > 0) {//입력성공, insert success
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}

    /**
     * 채용 삭제
     * vacancy modify process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/deleteProcessTempAjax", method = RequestMethod.POST)
  	public ModelAndView deleteProcessTempAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
  			@ModelAttribute("VacancyBean") VacancyBean vacancyBean,
  			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

      	String userSeq = SessionUtil.getUserSeq(req);
      	vacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
    	vacancyBean.setRegUserSeq(userSeq);
  		vacancyBean.setModUserSeq(userSeq);

  		if(compnyVacancyService.deleteVacancyTemp(vacancyBean) > 0) {//입력성공, insert success
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}


    /**
     * 채용 삭제
     * vacancy modify process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/deleteProcessAjax", method = RequestMethod.POST)
  	public ModelAndView deleteProcessAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
  			@ModelAttribute("VacancyBean") VacancyBean vacancyBean,
  			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

      	String userSeq = SessionUtil.getUserSeq(req);
      	vacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		vacancyBean.setRegUserSeq(userSeq);
  		vacancyBean.setModUserSeq(userSeq);

  		if(compnyVacancyService.deleteVacancy(vacancyBean) > 0) {//입력성공, insert success
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}

    /**
     * 채용 마감 처리
     * vacancy close process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/closeProcessAjax", method = RequestMethod.POST)
  	public ModelAndView closeProcessAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
  			@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
  			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

      	String userSeq = SessionUtil.getUserSeq(req);
      	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
    	condVacancyBean.setRegUserSeq(userSeq);
  		condVacancyBean.setModUserSeq(userSeq);
  		condVacancyBean.setCondUserSeq(userSeq);


  		if(compnyVacancyService.closeVacancy(condVacancyBean) > 0) {//입력성공, insert success
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
	 * 면접제의 목록
	 * private applic list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/intvwList")
	  public ModelAndView intvwList(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/vacancy/intvwList.left");

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_INTVW_STS_CD_VAL);
		condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));


	  	mv.addObject("intvwStsCd", commonService.selectCommCdList(conditionBean));//최소교육


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
	  @RequestMapping("/intvwListAjax")
	  public ModelAndView intvwListAjax(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				@ModelAttribute("CondApplicBean") CondApplicBean condApplicBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

			ModelAndView mv = new ModelAndView();
			mv.setViewName("mypage/compny/vacancy/intvwListForm.empty");

			conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
			condApplicBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
			condApplicBean.setCondUserSeq(SessionUtil.getUserSeq(req));
			condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
			condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));

	      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
	  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);
	  		condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
	  		condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
	  		condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());


	      	int totCnt = compnyVacancyService.selectIntvwListCnt(condVacancyBean);
	      	paginationInfo.setTotalRecordCount(totCnt);
	    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

	    	if(totCnt > 0) {
	    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyVacancyService.selectIntvwList(condVacancyBean));
	    	}

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_INTVW_STS_CD_VAL);
		  	mv.addObject("intvwStsCd", commonService.selectCommCdList(conditionBean));//최소교육



		return mv;

	}

	/**
	 * 화상면접신청관라::목록
	 * @param locale
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/intvwVideoList")
	public ModelAndView intvwVideoList(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/vacancy/intvwVideoList.left");

		String userSeq = SessionUtil.getUserSeq(req);
		String langCd = locale.getLanguage().toUpperCase();

		// 콤보박스 : 해당기업의 채용공고 목록
		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyMatchService.selectCompnyVacancyList(userSeq, langCd, "INCLUDE_CLOSED"));
		// 콤보박스 : 잡센터
		mv.addObject("jobCenterCdList", commonService.selectJobCenterCdList(conditionBean));

		return mv;
	}

	/**
	 * 화상면접신청관라::목록 조회
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param condBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/intvwVideoListAjax")
	public ModelAndView intvwVideoListAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("CondCompnyIntvwBean") CondCompnyIntvwBean condBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
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
      	condBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	condBean.setLangCd(langCd);
      	condBean.setRegUserSeq(userSeq);

      	int totCnt = compnyIntvwService.selectVacancyIntwvVideoListCnt(condBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		List<VacancyIntvwBean> VacancyIntvwList = compnyIntvwService.selectVacancyIntwvVideoList(condBean);
    		for(VacancyIntvwBean v : VacancyIntvwList) {
    			if(v.getUserCell() != null && !"".equals(v.getUserCell().trim())) {
    				v.setUserCell(EncryptUtil.getAes256Dec(v.getUserCell()));
    			}
    		}
    		mv.addObject(ConstVal.RESULT_LIST_KEY, VacancyIntvwList);
    	}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 화상면접신청관라::삭제
	 * @param locale
	 * @param param
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/intvwVideoDelAjax", method = RequestMethod.POST)
	public ModelAndView intvwVideoDelAjax(Locale locale,
		@ModelAttribute("VacancyIntvwBean") VacancyIntvwBean param,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
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

		param.setLangCd(langCd);
      	param.setRegUserSeq(userSeq);

		// 화상면접신청 정보
      	VideoIntvwPatcptnBean intvwvVdeoPatcptn = compnyIntvwService.selectVacancyIntwvVideoPatcptn(param.getVideoIntvwPatcptnSeq(), langCd);
      	if(intvwvVdeoPatcptn == null) { // 화상면접 신청 정보가 없는 경우
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		    return mv;
      	}
      	if("N".equals(intvwvVdeoPatcptn.getAbleDelYn())) { //수정/취소는 면접일 1일 전까지만 가능합니다.
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd("NOT_ABLE_DEL");
			mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		    return mv;
      	}

      	int ret = 0;
      	ret = compnyIntvwService.deleteVacancyIntwvVideo(param);
      	if(ret > 0) {
			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
			ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
      	} else {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      	}

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 화상면접신청관라::신청
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/intvwVideoApply")
	public ModelAndView intvwVideoApply(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/vacancy/intvwVideoApply.left");

		String userSeq = SessionUtil.getUserSeq(req);
		String langCd = locale.getLanguage().toUpperCase();
		List<String> holiday1List = null;
		List<String> holiday2List = null;
		conditionBean.setLangCd(langCd);

		// 콤보박스 : 잡센터
		mv.addObject("jobCenterCdList", commonService.selectJobCenterCdList(conditionBean));
		// 콤보박스 : 면접시간 테이블
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_VIDEO_TIME_TABLE_CD_VAL);
		mv.addObject("videoTimeTableCdList", commonService.selectCommCdList(conditionBean));

		// 구직자 정보
		MemberBean mb2 = commonService.selectMemberInfoByUserSeq(conditionBean);
		if(mb2 != null) {
			// 구직자의 잡센터 휴일 목록
			holiday2List = compnyIntvwService.selectJcHolidayList(mb2.getJcCd());
			if(mb2.getUserCell() != null && !"".equals(mb2.getUserCell().trim())) {
				mb2.setUserCell(EncryptUtil.getAes256Dec(mb2.getUserCell()));
			}
		}

		// Company Info
		CompnyMemBean mb1 = compnyService.selectCompnyByUserSeq(userSeq, langCd);
		if(mb1 != null) {
			// 잡센터 휴일 목록
			holiday1List = compnyIntvwService.selectJcHolidayList(mb1.getJcCd());
		}

		mv.addObject("compny", mb1);
		mv.addObject("member", mb2);
		mv.addObject("holiday1List", holiday1List);
		mv.addObject("holiday2List", holiday2List);
		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyIntvwService.selectJcHolidayList(mb2.getJcCd()));
		return mv;
	}

	/**
	 * 화상면접신청관라::신청
	 * @param locale
	 * @param param
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/intvwVideoApplyAjax", method = RequestMethod.POST)
	public ModelAndView intvwVideoApplyAjax(Locale locale,
		@ModelAttribute("VideoIntvwPatcptnBean") VideoIntvwPatcptnBean param,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
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

		param.setRegUserSeq(userSeq);
		compnyIntvwService.insertVacancyIntwvVideo(param);

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 잡센터 휴일 목록
	 * @param locale
	 * @param jcCd
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/jcHolidayAjax")
	public ModelAndView jcHolidayAjax(Locale locale,
		String jcCd,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		if(jcCd != null && !"".equals(jcCd.trim())) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, compnyIntvwService.selectJcHolidayList(jcCd));
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 화상면접 시간테이블 조회
	 * @param locale
	 * @param param
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/videoTimeTableListAjax")
	public ModelAndView videoTimeTableListAjax(Locale locale,
		@ModelAttribute("VideoIntvwPatcptnBean") VideoIntvwPatcptnBean param,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyIntvwService.selectVacancyIntwvVideoTimeList(param));

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}


	/**
	 * 화상면접신청관라::상세
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/intvwVideoView")
	public ModelAndView intvwVideoView(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		String videoIntvwPatcptnSeq,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/vacancy/intvwVideoView.left");

		String langCd = locale.getLanguage().toUpperCase();
		VideoIntvwPatcptnBean intvwvVdeoPatcptn = null;
		MemberBean member = null;

		// 화상면접신청 정보
		intvwvVdeoPatcptn = compnyIntvwService.selectVacancyIntwvVideoPatcptn(videoIntvwPatcptnSeq, langCd);
		if(intvwvVdeoPatcptn != null) {
			// 구직자 정보
			conditionBean.setCondUserSeq(intvwvVdeoPatcptn.getUserSeq());
			member = commonService.selectMemberInfoByUserSeq(conditionBean);
			if(member.getUserCell() != null && !"".equals(member.getUserCell().trim())) {
				member.setUserCell(EncryptUtil.getAes256Dec(member.getUserCell()));
			}
		}

		mv.addObject("member", member);
		mv.addObject("intvwvVdeoPatcptn", intvwvVdeoPatcptn);
		return mv;
	}


	/**
	 * 인터뷰 삭제
	 * interview delete
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/intvwDelProcessAjax", method = RequestMethod.POST)
	public ModelAndView intvwDelProcessAjax(Locale locale,
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

  		if(compnyVacancyService.deleteIntvw(condApplicBean) > 0) {
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
