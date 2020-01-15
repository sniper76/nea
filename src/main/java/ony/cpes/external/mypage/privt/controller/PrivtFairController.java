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
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.cpes.external.mypage.privt.service.PrivtFairService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/private/fair")
@Controller
public class PrivtFairController extends BaseController{
	private static Log log = LogFactory.getLog(PrivtFairController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private PrivtFairService privtFairService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	/**
	 * 관심채용행사 목록
	 * interest fair list
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
				@ModelAttribute("CondFairBean") CondFairBean condFairBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/fair/list.left");


		condFairBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condFairBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	condFairBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	condFairBean.setLastIndex(paginationInfo.getLastRecordIndex());
      	condFairBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

      	int totCnt = privtFairService.selectFairListCnt(condFairBean);
      	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
    		mv.addObject(ConstVal.RESULT_LIST_KEY, privtFairService.selectFairList(condFairBean));
    	}

		return mv;

	}

	/**
	 * 채용행사 신청 취소
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

  		if(privtFairService.updateCancelFair(condFairBean) > 0) {
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
	 * 채용행사 신청 삭제
	 * applic delete
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/deleteProcessAjax", method = RequestMethod.POST)
	public ModelAndView deleteProcessAjax(Locale locale,
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

  		if(privtFairService.deleteFair(condFairBean) > 0) {
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
