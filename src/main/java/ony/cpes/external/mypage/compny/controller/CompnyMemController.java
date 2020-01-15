package ony.cpes.external.mypage.compny.controller;

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
import ony.cpes.external.login.bean.LoginBean;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.bean.CompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.service.CompnyMemService;
import ony.cpes.external.mypage.privt.bean.CondPrivtMemBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemChgBean;
import ony.cpes.external.mypage.privt.service.PrivtMemService;
import ony.framework.BaseController;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/compny/member")
@Controller
public class CompnyMemController extends BaseController{
	private static Log log = LogFactory.getLog(CompnyMemController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private CompnyMemService compnyMemService;

	@Autowired
	private PrivtMemService privtMemService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 기업회원 마이페이지 메인
	 * private main
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/main")
	public ModelAndView main(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondCompnyMemBean") CondCompnyMemBean condCompnyMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/main.left");
		return mv;

	}

	/**
	 * 기업정보 수정 화면
	 * private info modify form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondCompnyMemBean") CondCompnyMemBean condCompnyMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();

		if(!StringUtil.isEmpty(condCompnyMemBean.getCondCertNo()) && condCompnyMemBean.getCondCertNo().length() == 7) {//비밀번호 확인을 하고 들어온경우만
			mv.setViewName("mypage/compny/member/modify.left");
		} else {
			mv.addObject(ConstVal.RESULT_KEY, "modify");
			mv.setViewName("common/pwdConfirm.left");
			return mv;
		}

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone
		condCompnyMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condCompnyMemBean.setCondUserSeq(SessionUtil.getUserSeq(req));

  		conditionBean.setCondGrpCd(ConstVal.GRP_CD_COMPNY_TYPE_CD_VAL);
  		mv.addObject(ConstVal.RESULT_LIST_KEY,commonService.selectCommCdList(conditionBean));

  		conditionBean.setCondGrpCd(ConstVal.GRP_CD_NATION_CD_VAL);
  		mv.addObject(ConstVal.RESULT_LIST2_KEY,commonService.selectCommCdList(conditionBean));

      	mv.addObject(ConstVal.RESULT_KEY, compnyMemService.selectCompnyMember(condCompnyMemBean));

	  	return mv;
	}


	/**
	 * 기업정보 수정
	 * company info update
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/modifyProcessAjax", method = RequestMethod.POST)
	public ModelAndView modifyProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CompnyMemBean") CompnyMemBean compnyMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		compnyMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		compnyMemBean.setUserSeq(userSeq);
  		compnyMemBean.setRegUserSeq(userSeq);
  		compnyMemBean.setModUserSeq(userSeq);


  		if(compnyMemService.updateCompnyMember(compnyMemBean) > 0) {
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
	 * 기업정보 프로필 수정 화면
	 * private info modify form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/profileModify", method = RequestMethod.POST)
	public ModelAndView profileModify(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondCompnyMemBean") CondCompnyMemBean condCompnyMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/compny/member/profileModify.left");

		condCompnyMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condCompnyMemBean.setCondUserSeq(SessionUtil.getUserSeq(req));

		CompnyMemBean compnyMemBean = compnyMemService.selectCompnyMember(condCompnyMemBean);
		if(!StringUtil.isEmpty(compnyMemBean.getLogoFileGrpSeq())) {
			FileBean fileBean = new FileBean();
	      	fileBean.setFileSeq(compnyMemBean.getLogoFileGrpSeq());
			mv.addObject(ConstVal.RESULT2_KEY, commonService.selectAttachFiles(fileBean));
		}
      	mv.addObject(ConstVal.RESULT_KEY, compnyMemBean);

	  	return mv;
	}


	/**
	 * 기업프로필 수정
	 * company profile info update
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/profileModifyProcessAjax", method = RequestMethod.POST)
	public ModelAndView profileModifyProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CompnyMemBean") CompnyMemBean compnyMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		compnyMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
   		compnyMemBean.setUserSeq(userSeq);
  		compnyMemBean.setRegUserSeq(userSeq);
  		compnyMemBean.setModUserSeq(userSeq);


  		if(compnyMemService.updateProfile(compnyMemBean) > 0) {
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

	@RequestMapping("/companyLogoImgUpdate")
	public ModelAndView companyLogoImgUpdate(@RequestParam MultipartFile uploadFile,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();
		String userSeq = SessionUtil.getUserSeq(req);

		String logoFileGrpSeq = commonService.inserCommonFile(uploadFile, "", userSeq);
		CompnyMemBean compnyMemBean = new CompnyMemBean();
		compnyMemBean.setUserSeq(userSeq);
		compnyMemBean.setLogoFileGrpSeq(logoFileGrpSeq);
		compnyMemService.updateCompanyLogoImg(compnyMemBean);

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

}
