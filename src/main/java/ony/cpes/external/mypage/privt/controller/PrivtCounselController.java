package ony.cpes.external.mypage.privt.controller;

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
import ony.cpes.external.mypage.privt.bean.CondCounselBean;
import ony.cpes.external.mypage.privt.service.PrivtCounselService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/private/counsel")
@Controller
public class PrivtCounselController extends BaseController{
	private static Log log = LogFactory.getLog(PrivtCounselController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private PrivtCounselService privtCounselService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	/**
	 * 상담 목록
	 * education tranning nea list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/eduTrnngNeaList")
	  public ModelAndView eduTrnngNeaList(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondCounselBean") CondCounselBean condCounselBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/counsel/eduTrnngNeaList.left");


		condCounselBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condCounselBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condCounselBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condCounselBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condCounselBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = privtCounselService.selectEduTrnngNeaListCnt(condCounselBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, privtCounselService.selectEduTrnngNeaList(condCounselBean));
    	}

		return mv;

	}

	/**
	 * 상담 취소
	 * education tranning nea cancel
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/eduTrnngNeaCancelProcessAjax", method = RequestMethod.POST)
	public ModelAndView eduTrnngNeaCancelProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondCounselBean") CondCounselBean condCounselBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condCounselBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		condCounselBean.setCondUserSeq(userSeq);
  		condCounselBean.setRegUserSeq(userSeq);
  		condCounselBean.setModUserSeq(userSeq);

  		if(privtCounselService.updateCancelEduTrnngNea(condCounselBean) > 0) {
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
	 * 상담 삭제
	 * education tranning nea delete
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/eduTrnngNeaDeleteProcessAjax", method = RequestMethod.POST)
	public ModelAndView eduTrnngNeaDeleteProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondCounselBean") CondCounselBean condCounselBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		condCounselBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		condCounselBean.setCondUserSeq(userSeq);
  		condCounselBean.setRegUserSeq(userSeq);
  		condCounselBean.setModUserSeq(userSeq);

  		if(privtCounselService.deleteEduTrnngNea(condCounselBean) > 0) {
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
