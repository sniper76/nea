package ony.cpes.external.mypage.instt.controller;

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
import ony.cpes.external.mypage.compny.service.CompnyFairService;
import ony.cpes.external.mypage.instt.service.InsttFairService;
import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/instt/fair")
@Controller
public class InsttFairController extends BaseController{
	private static Log log = LogFactory.getLog(InsttFairController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private InsttFairService insttFairService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 채용공고를 관심 등록한 인재
	 * interest vacancy list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/inviteList")
	  public ModelAndView inviteList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondFairBean") CondFairBean condFairBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/instt/fair/inviteList.left");


		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condFairBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);

      	condFairBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condFairBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condFairBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = insttFairService.selectInviteListCnt(condFairBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, insttFairService.selectInviteList(condFairBean));
    	}

		return mv;

	}

	/**
	 * 초청받은 채용행사 신청
	 * invite fair request
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/inviteOkProcessAjax", method = RequestMethod.POST)
	public ModelAndView inviteOkProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondFairBean") CondFairBean condFairBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		condFairBean.setCondUserSeq(userSeq);
  		condFairBean.setRegUserSeq(userSeq);
  		condFairBean.setModUserSeq(userSeq);

  		if(insttFairService.updateInviteOk(condFairBean) > 0) {
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
	 * 초청받은 채용행사 삭제
	 * invite fair delete
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/inviteDeleteProcessAjax", method = RequestMethod.POST)
	public ModelAndView inviteDeleteProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondFairBean") CondFairBean condFairBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		condFairBean.setCondUserSeq(userSeq);
  		condFairBean.setRegUserSeq(userSeq);
  		condFairBean.setModUserSeq(userSeq);

  		if(insttFairService.deleteInvite(condFairBean) > 0) {
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
	 * 채용행사 부스 목록
	 * fair booth list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/boothList")
	  public ModelAndView boothList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondFairBean") CondFairBean condFairBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/instt/fair/boothList.left");


		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condFairBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);

      	condFairBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condFairBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condFairBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = insttFairService.selectBoothListCnt(condFairBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, insttFairService.selectBoothList(condFairBean));
    	}

		return mv;

	}

	/**
	 * 채용행사 부스 취소
	 * fair booth cancel
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/boothCancelProcessAjax", method = RequestMethod.POST)
	public ModelAndView boothCancelProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondFairBean") CondFairBean condFairBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

  		condFairBean.setCondUserSeq(userSeq);
  		condFairBean.setRegUserSeq(userSeq);
  		condFairBean.setModUserSeq(userSeq);

  		if(insttFairService.updateBoothCancel(condFairBean) > 0) {
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
	 * 참가 채용행사 관리
	 * join fair list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/joinList")
	  public ModelAndView joinList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondFairBean") CondFairBean condFairBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/instt/fair/joinList.left");


		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condFairBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condFairBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condFairBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condFairBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = insttFairService.selectJoinListCnt(condFairBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, insttFairService.selectJoinList(condFairBean));
    	}

		return mv;

	}


	/**
	 * 채용행사 취소
	 * cancel fair request
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/fairCancelProcessAjax", method = RequestMethod.POST)
	public ModelAndView inviteCancelProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondFairBean") CondFairBean condFairBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condFairBean.setCondUserSeq(userSeq);
  		condFairBean.setRegUserSeq(userSeq);
  		condFairBean.setModUserSeq(userSeq);

  		if(insttFairService.updateFairCancel(condFairBean) > 0) {
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
