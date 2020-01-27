package ony.cpes.external.mypage.privt.controller;

import java.security.Principal;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.bean.FileBean;
import ony.cmm.common.bean.LocCdBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.mypage.privt.service.ResumeService;
import ony.framework.BaseController;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/private/resume")
@Controller
public class ResumeController extends BaseController{
	private static Log log = LogFactory.getLog(ResumeController.class);

	@Autowired
	private ResumeService resumeService;

	@Autowired
	private CommonService commonService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Autowired MessageSource messageSource;


	@RequestMapping("/write")
	public ModelAndView write(Principal principal,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		// 현재 로그인한 유저의 개인 정보 조회
		conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone
      	MemberBean memberBean = commonService.selectMemberInfo(conditionBean);
      	if(!StringUtils.isEmpty(memberBean)) {
      		memberBean.setUserCell(EncryptUtil.getAes256Dec(memberBean.getUserCell()));
      		memberBean.setUserEmail(EncryptUtil.getAes256Dec(memberBean.getUserEmail()));
      	}
      	mv.addObject("memberBean", memberBean);

      	/*FileBean fileBean = new FileBean();
      	fileBean.setFileSeq(memberBean.getFileGrpSeq());
      	mv.addObject("memberImg", commonService.selectAttachFiles(fileBean));*/

      	// 결혼 여부
      	conditionBean.setCondGrpCd(ConstVal.GRP_CD_MARITA_STATUS_ID_VAL);
		List<CommDtlCdBean> maritaStatusIdList = commonService.selectCommCdList(conditionBean);
		mv.addObject("maritaStatusIdList", maritaStatusIdList);

		// 지역 코드 조회
		List<LocCdBean> locCdList = commonService.selectLocCdList(conditionBean);
		mv.addObject("locCdList", locCdList);

		// 장애 여부
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_DISABL_OPTION_CD_VAL);
		List<CommDtlCdBean> disablOptionCdList = commonService.selectCommCdList(conditionBean);
		mv.addObject("disablOptionCdList", disablOptionCdList);

		// 희망 고용 형태
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_FORM_CD_VAL);
		List<CommDtlCdBean> employmentFormList = commonService.selectCommCdList(conditionBean);
		mv.addObject("employmentFormList", employmentFormList);

		// 희망 고용 TYPE
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_PREFER_EMPLOYMT_TYPE_CD_VAL);
		List<CommDtlCdBean> preferEmploymtTypeCdList = commonService.selectCommCdList(conditionBean);
		mv.addObject("preferEmploymtTypeCdList", preferEmploymtTypeCdList);

		// 희망 계약 형태
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EMPLOY_CTRCT_CD_VAL);
		List<CommDtlCdBean> termOfEmploymentContractList = commonService.selectCommCdList(conditionBean);
		mv.addObject("termOfEmploymentContractList", termOfEmploymentContractList);

		// 학력 및 전문 훈련
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_EDU_DEGREE_CD_VAL);
		List<CommDtlCdBean> educationDegreeCodeList = commonService.selectCommCdList(conditionBean);
		mv.addObject("educationDegreeCodeList", educationDegreeCodeList);

		/*conditionBean.setCondGrpCd(ConstVal.GRP_CD_TRNNG_EDU_DEGREE_CD_VAL);
		List<CommDtlCdBean> trnngEduDegreeCdList = commonService.selectCommCdList(conditionBean);
		mv.addObject("trnngEduDegreeCdList", trnngEduDegreeCdList);*/

		// 국가
		conditionBean.setDepth("0");
		List<LocCdBean> nationalityList = commonService.selectLocCdList(conditionBean);
		mv.addObject("nationalityList", nationalityList);

		// 외국어 레벨
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_LVL_CD_VAL);
		List<CommDtlCdBean> languageLevelList = commonService.selectCommCdList(conditionBean);
		mv.addObject("languageLevelList", languageLevelList);

		// 스킬
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_SKILL_CD_VAL);
		List<CommDtlCdBean> skillCdList = resumeService.selectSkillCdList(conditionBean);
		mv.addObject("skillCdList", skillCdList);

		// 언어 코드
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_LANG_CD_VAL);
		List<CommDtlCdBean> languageList = commonService.selectCommCdList(conditionBean);
		mv.addObject("languageList", languageList);

		mv.setViewName("mypage/resume/write.one");
		return mv;
	}

	@RequestMapping("/nextDepthSelectAjax")
	public ModelAndView nextDepthSelectAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		// 다음 depth 코드 조회
		List<LocCdBean> resultList = commonService.selectLocCdList(conditionBean);

		mv.addObject(ConstVal.RESULT_KEY,resultList);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	@RequestMapping("/insertResumeAjax")
	public ModelAndView insertResumeAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		String userSeq = SessionUtil.getUserSeq(req);
		resumeBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		resumeBean.setRegUserSeq(userSeq);//email or cell phone
		resumeBean.setModUserSeq(userSeq);//email or cell phone
  		resumeBean.setUserSeq(userSeq);
  		resumeBean.setPriResumeYn(ConstVal.NO_VAL);

  		int result = resumeService.insertResume(resumeBean);

		if(result > 0) {//입력성공, insert success
  			mv.addObject(ConstVal.RESULT_KEY, ConstVal.YES_VAL);
  		}else if(result == 99){
  			mv.addObject(ConstVal.RESULT_KEY, "FULL");
  		}else {
  			mv.addObject(ConstVal.RESULT_KEY, ConstVal.NO_VAL);
  		}


      	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	@RequestMapping("/list")
	public ModelAndView list(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		resumeBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		resumeBean.setUserSeq(SessionUtil.getUserSeq(req));

		mv.addObject(ConstVal.RESULT_LIST_KEY, resumeService.selectMyResumeList(resumeBean));

		mv.setViewName("mypage/resume/list.left");
		return mv;
	}


	@RequestMapping("/updatePriResumeYnAjax")
	public ModelAndView updatePriResumeYnAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		String userSeq = SessionUtil.getUserSeq(req);
		resumeBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		resumeBean.setUserSeq(userSeq);
		resumeBean.setModUserSeq(userSeq);
		resumeBean.setPriResumeYn(ConstVal.YES_VAL);

		String priResumeSeq = resumeService.selectPriResumeSeq(userSeq); //기존 대표이력서 seq
		if(resumeService.selectPriResumeYnValidation(priResumeSeq) == 0) {
			//resumeService.updateJobskReq(resumeBean);

			//resumeService.deleteIntvw(priResumeSeq);
			resumeService.deleteJobskReq(priResumeSeq);
			//resumeService.deleteApplic(priResumeSeq);
			//resumeService.deleteOffer(priResumeSeq);

			int resetResult = resumeService.resetPriResumeYn(resumeBean);
			int updateResult = resumeService.updateResume(resumeBean);

			if(resetResult > 0 && updateResult > 0) {
				mv.addObject(ConstVal.RESULT_KEY, ConstVal.YES_VAL);
			}else {
				mv.addObject(ConstVal.RESULT_KEY, ConstVal.NO_VAL);
			}
		}else {
			mv.addObject(ConstVal.RESULT_KEY, "99");
		}




		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	@RequestMapping("/deleteResumeAjax")
	public ModelAndView deleteResumeAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		resumeBean.setLangCd(locale.getLanguage().toUpperCase());
		resumeBean.setModUserSeq(SessionUtil.getUserSeq(req));

		mv.addObject(ConstVal.RESULT_KEY, resumeService.deleteResume(resumeBean));
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	@RequestMapping("/copyResume")
	public ModelAndView copyResume(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mv = write(principal, conditionBean, req, res);

		mv.addObject("resumeDetail", resumeService.selectResumeDetail(resumeBean));
		mv.addObject("hopeWorkLocList", resumeService.selectResumeHopeWorkLocDetail(resumeBean));
		mv.addObject("specialStudyList", resumeService.selectResumeSpecialStudyDetail(resumeBean));
		mv.addObject("otherTrnngList", resumeService.selectResumeOtherTrnngDetail(resumeBean));
		mv.addObject("langResult", resumeService.selectResumeLangDetail(resumeBean));
		mv.addObject("workExpList", resumeService.selectResumeWorkExpDetail(resumeBean));
		mv.addObject("skillList", resumeService.selectResumeSkillDetail(resumeBean));
		mv.addObject("refManList", resumeService.selectResumeRefManDetail(resumeBean));
		mv.addObject("disableList", resumeService.selectResumeDisableDetail(resumeBean));
		mv.addObject("genrlEdu", resumeService.selectResumeGenrlEduDetail(resumeBean));
		mv.addObject("iscoList", resumeService.selectResumeIsco(resumeBean));

		mv.addObject("updateFlag", "copy");

		mv.setViewName("mypage/resume/update.one");
		return mv;
	}

	@RequestMapping("/saveResumeUptOrCopyAjax")
	public ModelAndView saveResumeUptOrCopy(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = 0;

		String userSeq = SessionUtil.getUserSeq(req);
		resumeBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		resumeBean.setRegUserSeq(userSeq);//email or cell phone
		resumeBean.setModUserSeq(userSeq);//email or cell phone
  		resumeBean.setUserSeq(userSeq);
  		if(StringUtil.isEmpty(resumeBean.getPriResumeYn())) {
  			resumeBean.setPriResumeYn(ConstVal.NO_VAL);
  		}

  		if("copy".equals(resumeBean.getUpdateFlag())) {
  			result = resumeService.insertResume(resumeBean);

  			if(result > 0) {//입력성공, insert success
      			mv.addObject(ConstVal.RESULT_KEY, ConstVal.YES_VAL);
      		}else if(result == 99){
      			mv.addObject(ConstVal.RESULT_KEY, "FULL");
      		}else {
      			mv.addObject(ConstVal.RESULT_KEY, ConstVal.NO_VAL);
      		}
		}else if("update".equals(resumeBean.getUpdateFlag())) {
			result = resumeService.updateResume(resumeBean);

			if(result > 0) {//입력성공, insert success
      			mv.addObject(ConstVal.RESULT_KEY, ConstVal.YES_VAL);
      		}else {
      			mv.addObject(ConstVal.RESULT_KEY, ConstVal.NO_VAL);
      		}
		}

      	mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	@RequestMapping("/updateResume")
	public ModelAndView updateResume(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mv = write(principal, conditionBean, req, res);

		mv.addObject("resumeDetail", resumeService.selectResumeDetail(resumeBean));
		mv.addObject("hopeWorkLocList", resumeService.selectResumeHopeWorkLocDetail(resumeBean));
		mv.addObject("specialStudyList", resumeService.selectResumeSpecialStudyDetail(resumeBean));
		mv.addObject("otherTrnngList", resumeService.selectResumeOtherTrnngDetail(resumeBean));
		mv.addObject("langResult", resumeService.selectResumeLangDetail(resumeBean));
		mv.addObject("workExpList", resumeService.selectResumeWorkExpDetail(resumeBean));
		mv.addObject("skillList", resumeService.selectResumeSkillDetail(resumeBean));
		mv.addObject("refManList", resumeService.selectResumeRefManDetail(resumeBean));
		mv.addObject("disableList", resumeService.selectResumeDisableDetail(resumeBean));
		mv.addObject("genrlEdu", resumeService.selectResumeGenrlEduDetail(resumeBean));
		mv.addObject("iscoList", resumeService.selectResumeIsco(resumeBean));

		mv.addObject("updateFlag", "update");
		mv.addObject("tempFlag", resumeService.selectTempResumeCheck(resumeBean));

		mv.setViewName("mypage/resume/update.one");
		return mv;
	}

	@RequestMapping("/resumeDetail")
	public ModelAndView resumeDetail(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mv = new ModelAndView();

		// 현재 로그인한 유저의 개인 정보 조회
		conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone
      	MemberBean memberBean = commonService.selectMemberInfo(conditionBean);
      	if(!StringUtils.isEmpty(memberBean)) {
      		memberBean.setUserCell(EncryptUtil.getAes256Dec(memberBean.getUserCell()));
      		memberBean.setUserEmail(EncryptUtil.getAes256Dec(memberBean.getUserEmail()));
      	}

      	mv.addObject("memberBean", memberBean);

      	/*FileBean fileBean = new FileBean();
      	fileBean.setFileSeq(memberBean.getFileGrpSeq());
      	mv.addObject("memberImg", commonService.selectAttachFiles(fileBean));*/

      	resumeBean.setUserSeq(memberBean.getUserSeq());

		mv.addObject("resumeDetail", resumeService.selectResumeDetail(resumeBean));
		mv.addObject("hopeWorkLocList", resumeService.selectResumeHopeWorkLocDetail(resumeBean));
		mv.addObject("specialStudyList", resumeService.selectResumeSpecialStudyDetail(resumeBean));
		mv.addObject("otherTrnngList", resumeService.selectResumeOtherTrnngDetail(resumeBean));
		mv.addObject("langList", resumeService.selectResumeLangDetail(resumeBean));
		mv.addObject("workExpList", resumeService.selectResumeWorkExpDetail(resumeBean));
		mv.addObject("skillList", resumeService.selectResumeSkillForDetail(resumeBean));
		mv.addObject("refManList", resumeService.selectResumeRefManDetail(resumeBean));
		mv.addObject("disableList", resumeService.selectResumeDisableDetail(resumeBean));
		mv.addObject("genrlEdu", resumeService.selectResumeGenrlEduDetail(resumeBean));
		mv.addObject("jobskReqDetail", resumeService.selectJobskReqDetail(resumeBean));
		mv.addObject("iscoList", resumeService.selectResumeIsco(resumeBean));
		mv.addObject("paramInfo", resumeBean);

		mv.setViewName("mypage/resume/detail.one");
		return mv;
	}

	@RequestMapping("/updateUserImg")
	public ModelAndView updateUserImg(@RequestParam MultipartFile uploadImgFile, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		String userSeq = SessionUtil.getUserSeq(req);
		String imgFile = commonService.inserCommonFile(uploadImgFile, "", userSeq, resumeBean.getResumeSeq(), "resume");

		resumeBean.setFileGrpSeq(imgFile);
		resumeBean.setModUserSeq(userSeq);
		resumeBean.setTempFlag("0");
		resumeService.updateResume(resumeBean);

		mv.addObject(ConstVal.RESULT_KEY, imgFile);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

}
