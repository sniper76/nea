package ony.cpes.external.mypage.mypgComm.controller;

import java.security.Principal;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.service.CompnyVacancyService;
import ony.cpes.external.mypage.mypgComm.service.MypgCommService;
import ony.cpes.external.mypage.mypgComm.service.ResumeOpenCompnyService;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.mypage.privt.bean.ResumeOpenCompnyBean;
import ony.cpes.external.mypage.privt.controller.ResumeController;
import ony.cpes.external.mypage.privt.service.ResumeService;
import ony.framework.BaseController;
import ony.framework.util.StringUtil;

@Controller
public class MypgCommController extends BaseController {
	private static Log log = LogFactory.getLog(ResumeController.class);

	@Autowired
	private ResumeService resumeService;

	@Autowired
	private CommonService commonService;

	@Autowired
	private CompnyVacancyService compnyVacancyService;

	@Autowired
	private ResumeOpenCompnyService resumeOpenCompnyService;

	@Autowired
	private MypgCommService mypgCommService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Autowired MessageSource messageSource;

	@RequestMapping("/cpes/compny/resume/resumeDetail")
	public ModelAndView resumeDetail(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("ResumeBean") ResumeBean resumeBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mv = new ModelAndView();

		// 현재 로그인한 유저의 개인 정보 조회
		conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone
      	MemberBean memberBean = commonService.selectMemberInfo(conditionBean);

      	resumeBean.setUserSeq(memberBean.getUserSeq());
      	ResumeBean resumeDetail = resumeService.selectResumeDetail(resumeBean);
		mv.addObject("resumeDetail", resumeDetail);
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

		ConditionBean resumeConditionBean = new ConditionBean();
		resumeConditionBean.setCondUserSeq(resumeDetail.getUserSeq());
		MemberBean resumeMemberBean = commonService.selectMemberInfoByUserSeq(resumeConditionBean);
		mv.addObject("memberBean", resumeMemberBean);

		ResumeOpenCompnyBean rocb = new ResumeOpenCompnyBean();
		rocb.setResumeSeq(resumeBean.getResumeSeq());
		rocb.setCompnySeq(memberBean.getUserSeq());
		resumeOpenCompnyService.insertResumeOpenCompny(rocb);

		CondVacancyBean condVacancyBean = new CondVacancyBean();
		condVacancyBean.setCondUserSeq(memberBean.getUserSeq());
		condVacancyBean.setCondVacancyStsCd(ConstVal.VACANCY_STS_CD_ONGOING);
		condVacancyBean.setCondOfferFlag("true");
		int onGoingVacCnt = compnyVacancyService.selectVacancyListCnt(condVacancyBean);
		mv.addObject("onGoingVacCnt", onGoingVacCnt);

		if(!StringUtil.isEmpty(resumeBean.getVacancySeq())) {
			int valiCheck = mypgCommService.selectVacancycheck(resumeBean);
			if(valiCheck > 0) {
				mv.addObject("applic", mypgCommService.selectResumeApplic(resumeBean));
				mv.addObject("Intvw", mypgCommService.selectResumeIntvw(resumeBean));
				mv.addObject("offer", mypgCommService.selectResumeOffer(resumeBean));
				mv.addObject("valiCheck", valiCheck);
			}
		}

		mv.setViewName("mypage/resume/detail.one");
		return mv;
	}
}
