package ony.cpes.external.mypage.counsel.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
import ony.cmm.common.bean.BookMarkBean;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.counsel.bean.CondCounselBean;
import ony.cpes.external.counsel.bean.CounselBean;
import ony.cpes.external.counsel.service.CounselService;
import ony.cpes.external.member.bean.MemberBean;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;




@RequestMapping("/cpes/private/mypage/counsel")
@Controller
public class MypageCounselController extends BaseController{

  private static Log log = LogFactory.getLog(MypageCounselController.class);

  @Autowired
  private CommonService commonService;

  @Autowired
  private CounselService counselService;

  @Autowired SessionLocaleResolver localeResolver;

  @Resource(name = "propertiesService")
  protected EgovPropertyService propertiesService;





    /**
     * 상담목록
     * counsel list
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
  			@ModelAttribute("CondCounselBean") CondCounselBean condCounselBean,
  			Principal principal,
  			HttpServletRequest req,
  			HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	mv.setViewName("mypage/counsel/list.left");

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);


      	condCounselBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
      	condCounselBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	condCounselBean.setCondCateDivCd(ConstVal.COUNSEL_CATE_DIV_CD_COURSE_VAL);
      	condCounselBean.setCondSeflYn(ConstVal.YES_VAL);

		condCounselBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
		condCounselBean.setLastIndex(paginationInfo.getLastRecordIndex());
		condCounselBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		condCounselBean.setCondLikeCateCd(ConstVal.LIKE_CATE_CD_COUNSEL_VAL);
    	int totCnt = counselService.selectCounselListCnt(condCounselBean);
    	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);


      	if(totCnt > 0) {
      		mv.addObject(ConstVal.RESULT_LIST_KEY, counselService.selectCounselList(condCounselBean));
      	}

      	return mv;
  	}


    /**
       * 상담상세
       * counsel detail view
       * @param req
       * @param res
       * @return ModelAndView
       * @throws Exception
     */
	@RequestMapping("/view")
    public ModelAndView view(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("CondCounselBean") CondCounselBean condCounselBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();
    	mv.setViewName("mypage/counsel/viewOnline.left");


    	condCounselBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
    	condCounselBean.setCondCateDivCd(ConstVal.COUNSEL_CATE_DIV_CD_COURSE_VAL);
    	condCounselBean.setCondSeflYn(ConstVal.YES_VAL);
  		condCounselBean.setCondUserSeq(SessionUtil.getUserSeq(req));
  		condCounselBean.setCondLikeCateCd(ConstVal.LIKE_CATE_CD_COUNSEL_VAL);

  		CounselBean counselBean = counselService.selectCounsel(condCounselBean);
  		if(StringUtil.isEmpty(counselBean)) {//데이터가 존재하지 않음
  			mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
      		return mv;
  		}

  		mv.addObject(ConstVal.RESULT_KEY, counselBean);

  		if(!StringUtils.equals(ConstVal.COUNSEL_METHOD_DIV_CD_ONLINE_VAL, counselBean.getCounselMethodDivCd())) {//온라인이 아닌경우(전화,센터 상담)
  			mv.setViewName("mypage/counsel/viewTelCenter.left");
  		}




      	return mv;
	}

    /**
     * 상담 삭제
     * counsel delete
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/deleteAjax", method = RequestMethod.POST)
  	public ModelAndView deleteAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("CondCounselBean") CondCounselBean condCounselBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();

      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

    	condCounselBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
    	condCounselBean.setCondUserSeq(SessionUtil.getUserSeq(req));

  		if(counselService.deleteCounsel(condCounselBean) > 0) {//삭제성공, delete success
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
  			ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//삭제실패,delete fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
  		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}


    /**
     * 상담상세
     * counsel detail view
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
   */
	@RequestMapping("/modify")
	public ModelAndView modify(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("CondCounselBean") CondCounselBean condCounselBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/counsel/modify.left");

	  	conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	  	conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone

	  	condCounselBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	  	condCounselBean.setCondModifyYn(ConstVal.NO_VAL);
	  	condCounselBean.setCondCateDivCd(ConstVal.COUNSEL_CATE_DIV_CD_COURSE_VAL);
	  	condCounselBean.setCondSeflYn(ConstVal.YES_VAL);
		condCounselBean.setCondModifyYn(ConstVal.YES_VAL);//본인글만 수정가능
		condCounselBean.setCondUserSeq(SessionUtil.getUserSeq(req));

		CounselBean counselBean = counselService.selectCounsel(condCounselBean);
		if(StringUtil.isEmpty(counselBean)) {//데이터가 존재하지 않음
			mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
    		return mv;
		}

		mv.addObject(ConstVal.RESULT_KEY, counselBean);
		mv.addObject(ConstVal.MODIFY_YN_KEY, ConstVal.YES_VAL);
    	conditionBean.setCondGrpCd(ConstVal.GRP_CD_COUNSEL_METHOD_DIV_CD_VAL);//상담방법 공통코드,counsel method
    	mv.addObject(ConstVal.RESULT_LIST_KEY, commonService.selectCommCdList(conditionBean));

    	return mv;
	}



    /**
     * 상담 수정
     * counsel update
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/modifyProcessAjax", method = RequestMethod.POST)
  	public ModelAndView modifyProcessAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("CounselBean") CounselBean counselBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();

    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

    	String userSeq = SessionUtil.getUserSeq(req);
      	conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
  		counselBean.setUserSeq(userSeq);
  		counselBean.setQustRegUserSeq(userSeq);
  		counselBean.setQustModUserSeq(userSeq);
  		counselBean.setQustJcCd(userSeq);
  		counselBean.setCounselCateDivCd(ConstVal.COUNSEL_CATE_DIV_CD_COURSE_VAL);

  		if(counselService.updateCounsel(counselBean) > 0) {//수정성공, modify success
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
  			ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//수정실패,modify fail
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
  		}


		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}


}
