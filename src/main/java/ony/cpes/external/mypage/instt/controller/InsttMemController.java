package ony.cpes.external.mypage.instt.controller;

import java.security.Principal;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.bean.FileBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.instt.bean.CondInsttMemBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.instt.service.InsttMemService;
import ony.framework.BaseController;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/instt/member")
@Controller
public class InsttMemController extends BaseController{
	private static Log log = LogFactory.getLog(InsttMemController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private InsttMemService insttMemService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 교육기관 마이페이지 메인
	 * private main
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/main")
	public ModelAndView main(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInsttMemBean") CondInsttMemBean condInsttMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/instt/main.left");
		return mv;

	}

	/**
	 * 교육기관 수정 화면
	 * education modify form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInsttMemBean") CondInsttMemBean condInsttMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();

		if(!StringUtil.isEmpty(condInsttMemBean.getCondCertNo()) && condInsttMemBean.getCondCertNo().length() == 7) {//비밀번호 확인을 하고 들어온경우만
			mv.setViewName("mypage/instt/member/modify.left");
		} else {
			mv.addObject(ConstVal.RESULT_KEY, "modify");
			mv.setViewName("common/pwdConfirm.left");
			return mv;
		}

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_INSTT_TYPE_CD_VAL);
  		mv.addObject("insttTypeCd",commonService.selectCommCdList(conditionBean));

		condInsttMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		condInsttMemBean.setCondUserSeq(SessionUtil.getUserSeq(req));

  		InsttMemBean insttMemBean = insttMemService.selectInsttMember(condInsttMemBean);

  		if(StringUtil.isEmpty(insttMemBean)) {
  			mv.addObject(ConstVal.DATA_EXIST_YN_KEY, ConstVal.NO_VAL);
  			return mv;
  		}

      	mv.addObject(ConstVal.RESULT_KEY, insttMemBean);

	  	return mv;
	}


	/**
	 * 교육기관 수정
	 * education info update
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/modifyProcessAjax", method = RequestMethod.POST)
	public ModelAndView modifyProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("InsttMemBean") InsttMemBean insttMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		insttMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		insttMemBean.setUserSeq(userSeq);
  		insttMemBean.setRegUserSeq(userSeq);
  		insttMemBean.setModUserSeq(userSeq);

  		if(insttMemService.updateInsttMember(insttMemBean) > 0) {
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
	 * 교육기관 프로파일 수정 화면
	 * education profile modify form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/profileModify", method = RequestMethod.POST)
	public ModelAndView profileModify(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInsttMemBean") CondInsttMemBean condInsttMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/instt/member/profileModify.left");

  		condInsttMemBean.setCondUserSeq(SessionUtil.getUserSeq(req));

  		InsttMemBean insttMemBean = insttMemService.selectInsttMember(condInsttMemBean);

  		if(StringUtil.isEmpty(insttMemBean)) {
  			mv.addObject(ConstVal.DATA_EXIST_YN_KEY, ConstVal.NO_VAL);
  			return mv;
  		}

      	mv.addObject(ConstVal.RESULT_KEY, insttMemBean);
  		mv.addObject(ConstVal.RESULT_LIST_KEY, insttMemService.selectEduTrnngHistList(condInsttMemBean));

	  	return mv;
	}


	/**
	 * 교육 히스트로 등록폼
	 * education history wirte form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/prgmHistoryFormAjax")
	  public ModelAndView prgmHistoryFormAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInsttMemBean") CondInsttMemBean condInsttMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		  	ModelAndView mv = new ModelAndView();
		  	mv.setViewName("mypage/instt/member/prgmHistoryForm.empty");

		  	return mv;
	}

	/**
	 * 교육기관 프로파일 수정
	 * education profile update
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/profileModifyProcessAjax", method = RequestMethod.POST)
	public ModelAndView profileModifyProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("InsttMemBean") InsttMemBean insttMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		insttMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		insttMemBean.setUserSeq(userSeq);
  		insttMemBean.setRegUserSeq(userSeq);
  		insttMemBean.setModUserSeq(userSeq);

  		if(insttMemService.updateProfile(insttMemBean) > 0) {
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);

		return mv;
	}

	@RequestMapping("/insttLogoImgUpdate")
	public ModelAndView insttLogoImgUpdate(@RequestParam MultipartFile uploadFile,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();
		String userSeq = SessionUtil.getUserSeq(req);

		String logoFileGrpSeq = commonService.inserCommonFile(uploadFile, "", userSeq);
		InsttMemBean insttMemBean = new InsttMemBean();
		insttMemBean.setUserSeq(userSeq);
		insttMemBean.setInsttLogoFileGrpSeq(logoFileGrpSeq);
		insttMemService.updateInsttLogoImg(insttMemBean);

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

}
