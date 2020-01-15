package ony.cpes.external.bulletin.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
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
import ony.cpes.external.bulletin.bean.BulletinBean;
import ony.cpes.external.bulletin.bean.BulletinConfigBean;
import ony.cpes.external.bulletin.bean.CommentBean;
import ony.cpes.external.bulletin.bean.CondBulletinBean;
import ony.cpes.external.bulletin.service.BulletinService;
import ony.cpes.external.member.bean.MemberBean;
import ony.framework.BaseController;
import ony.framework.util.CommUtil;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;


@RequestMapping("/bulletin")
@Controller
public class BulletinController  extends BaseController {
	  private static Log log = LogFactory.getLog(BulletinController.class);

	  @Autowired
	  private CommonService commonService;

	  @Autowired
	  private BulletinService bulletinService;

	  @Autowired SessionLocaleResolver localeResolver;

	  @Resource(name = "propertiesService")
	  protected EgovPropertyService propertiesService;


	  @Autowired MessageSource messageSource;

	  /**
	   * left menu 화면
	   * user login page
	   * @param req
	   * @param res
	   * @return String
	   * @throws Exception
	   */
	    @RequestMapping("/leftBody")
		public String login(HttpServletRequest req, HttpServletResponse res) throws Exception {

			return "leftBodyTest.left";
		}

	/**
	 * 게시판 목록
	 * borad list
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
			@ModelAttribute("CondBulletinBean") CondBulletinBean condBulletinBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {


	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("bulletin/basic/list.one");//게시판 기본유형,BASIC TYPE
	  	mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.NO_VAL);

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
  		condBulletinBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
  		condBulletinBean.setLastIndex(paginationInfo.getLastRecordIndex());
  		condBulletinBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);


      	condBulletinBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

      	if(principal != null) {
      		mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.YES_VAL);
      		condBulletinBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	}


	  	BulletinConfigBean bulletinConfigBean = bulletinService.selectBulletinConfig(condBulletinBean);//게시판 설정 정보가 bulletin config


	  	if(StringUtil.isEmpty(bulletinConfigBean)) {//게시판 설정 정보가 없는경우,bulletin config nothing
	  		mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
	  		return mv;
	  	}

	  	if(StringUtils.equals(ConstVal.YES_VAL, bulletinConfigBean.getCateUseYn())) {//카테고리사용여부,category list
	  		mv.addObject(ConstVal.CATE_LIST_KEY, bulletinService.selectBulletinCateList(condBulletinBean));
	  	}

	  	if(StringUtils.equals(ConstVal.BULLETIN_TYPE_CD_THUMBNAIL_VAL,bulletinConfigBean.getBulletinTypeCd())) {
	  		mv.setViewName("bulletin/thumbnail/list.one");//THUMBNAIL TYPE
	  	} else if(StringUtils.equals(ConstVal.BULLETIN_TYPE_CD_PHOTO_VAL,bulletinConfigBean.getBulletinTypeCd())) {
	  		mv.setViewName("bulletin/photo/list.one");//PHOTO TYPE
	  	} else if(StringUtils.equals(ConstVal.BULLETIN_TYPE_CD_ATTACHMENT_VAL,bulletinConfigBean.getBulletinTypeCd())) {
	  		mv.setViewName("bulletin/attachment/list.one");//ATTACHMENT TYPE
	  	} else if(StringUtils.equals(ConstVal.BULLETIN_TYPE_CD_FAQ_VAL,bulletinConfigBean.getBulletinTypeCd())) {
	  		mv.setViewName("bulletin/faq/list.one");//FAQ TYPE
	  	}



		condBulletinBean.setCondLikeCateCd(ConstVal.LIKE_CATE_CD_BULLETIN_VAL);
	  	int totCnt = bulletinService.selectBulletinListCnt(condBulletinBean);
	  	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {//데이터가 존재할경우
    		List<BulletinBean> list = bulletinService.selectBulletinList(condBulletinBean);
    		mv.addObject(ConstVal.RESULT_LIST_KEY, list);
    	}

	  	mv.addObject(ConstVal.RESULT_KEY, bulletinConfigBean);//게시판 설정정보,BOARD CONFIG INFO
	  	mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.YES_VAL);
	  	return mv;

	}



	/**
	 * 게시판 상세
	 * borad view
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/view")
	public ModelAndView view(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondBulletinBean") CondBulletinBean condBulletinBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {


	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("bulletin/basic/view.one");//게시판 기본유형,BASIC TYPE
	  	mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.NO_VAL);



      	condBulletinBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

      	if(principal != null) {
      		mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.YES_VAL);
      		condBulletinBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	}


	  	BulletinConfigBean bulletinConfigBean = bulletinService.selectBulletinConfig(condBulletinBean);//게시판 설정 정보가 bulletin config

	  	if(StringUtil.isEmpty(bulletinConfigBean)) {//게시판 설정 정보가 없는경우,bulletin config nothing
	  		mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
	  		return mv;
	  	}

	  	if(StringUtils.equals(ConstVal.YES_VAL, bulletinConfigBean.getCateUseYn())) {//카테고리사용여부,category list
	  		mv.addObject(ConstVal.CATE_LIST_KEY, bulletinService.selectBulletinCateList(condBulletinBean));
	  	}

	  	if(StringUtils.equals(ConstVal.BULLETIN_TYPE_CD_THUMBNAIL_VAL,bulletinConfigBean.getBulletinTypeCd())) {
	  		mv.setViewName("bulletin/thumbnail/view.one");//THUMBNAIL TYPE
	  	} else if(StringUtils.equals(ConstVal.BULLETIN_TYPE_CD_PHOTO_VAL,bulletinConfigBean.getBulletinTypeCd())) {
	  		mv.setViewName("bulletin/photo/view.one");//PHOTO TYPE
	  	} else if(StringUtils.equals(ConstVal.BULLETIN_TYPE_CD_ATTACHMENT_VAL,bulletinConfigBean.getBulletinTypeCd())) {
	  		mv.setViewName("bulletin/attachment/view.one");//ATTACHMENT TYPE
	  	} else if(StringUtils.equals(ConstVal.BULLETIN_TYPE_CD_FAQ_VAL,bulletinConfigBean.getBulletinTypeCd())) {
	  		mv.setViewName("bulletin/faq/view.one");//FAQ TYPE
	  	}


	  	mv.addObject(ConstVal.RESULT_KEY, bulletinConfigBean);//게시판 설정정보,BOARD CONFIG INFO
	  	mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.YES_VAL);

	  	condBulletinBean.setCondLikeCateCd(ConstVal.LIKE_CATE_CD_BULLETIN_VAL);
		BulletinBean bulletinBean = bulletinService.selectBulletin(condBulletinBean);//게시물 상세정보,bulletin detail info

		if(StringUtil.isEmpty(bulletinBean)) {//데이터 없음,NO DATA
			mv.addObject(ConstVal.NO_DATA_KEY,ConstVal.YES_VAL);
			return mv;
		}

		mv.addObject(ConstVal.RESULT2_KEY, bulletinBean);


		condBulletinBean.setCondBulletinId(bulletinBean.getBulletinId());
		BulletinBean pre = bulletinService.selectBulletinPre(condBulletinBean);//이전글,pre
		BulletinBean next = bulletinService.selectBulletinNext(condBulletinBean);//다음글,next


		List<BulletinBean> preNextList = new ArrayList<BulletinBean>();
		if(StringUtil.isEmpty(pre)) {
			BulletinBean obj = new BulletinBean();
			obj.setNextYn(ConstVal.NO_VAL);
			obj.setEmptyYn(ConstVal.YES_VAL);
			obj.setTitle(messageSource.getMessage("bulletin.msg.no.prev",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));
			preNextList.add(obj);
		} else {
			preNextList.add(pre);
		}


		if(StringUtil.isEmpty(next)) {
			BulletinBean obj = new BulletinBean();
			obj.setNextYn(ConstVal.YES_VAL);
			obj.setEmptyYn(ConstVal.YES_VAL);
			obj.setTitle(messageSource.getMessage("bulletin.msg.no.next",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));
			preNextList.add(obj);
		} else {
			preNextList.add(next);
		}


		mv.addObject(ConstVal.RESULT_LIST_KEY,  preNextList);//이전글 다음글,bulletin pre,next

	  	return mv;

	}

	/**
	 * 게시판 코멘트 목록
	 * bulletin comment list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/commentListAjax")
	public ModelAndView commentListAjax(Locale locale,
			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
			@RequestParam(required = false, defaultValue = "2") int pageUnit,
			@RequestParam(required = false, defaultValue = "10") int pageSize,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondBulletinBean") CondBulletinBean condBulletinBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("bulletin/comment.empty");//THUMBNAIL TYPE

		AjaxResultBean ajaxResultBean = new AjaxResultBean();
		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
  		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

	  	condBulletinBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);//page info
  		condBulletinBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
  		condBulletinBean.setLastIndex(paginationInfo.getLastRecordIndex());
  		condBulletinBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

      	if(principal != null) {
      		mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.YES_VAL);
      		condBulletinBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	}

  		int totCnt = bulletinService.selectCommentListCnt(condBulletinBean);
	  	paginationInfo.setTotalRecordCount(totCnt);
    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

    	if(totCnt > 0) {
      		condBulletinBean.setLangCd(locale.getLanguage().toUpperCase());
      		mv.addObject(ConstVal.RESULT_LIST_KEY,bulletinService.selectCommentList(condBulletinBean));
    	}


		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	//mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
	}



    /**
     * comment 신규 저장
     * comment new insert
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/commentWriteAjax", method = RequestMethod.POST)
  	public ModelAndView commentWriteAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("CommentBean") CommentBean commentBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();


	  	if(principal == null) {
	  		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
	  	} else {
	  		String userSeq = SessionUtil.getUserSeq(req);
	  		commentBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	  		commentBean.setRegUserSeq(userSeq);
      		commentBean.setModUserSeq(userSeq);


      		if(bulletinService.insertComment(commentBean) > 0) {//입력성공, insert success
      			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,insert fail
	      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
      		} else {
      			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,insert fail
	      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
      		}

	  	}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}


	/**
	 * 게시판 댓글에 댓글 목록
	 * bulletin comment reply list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/commentReplyListAjax")
	public ModelAndView commentReplyListAjax(Locale locale,
			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
			@RequestParam(required = false, defaultValue = "2") int pageUnit,
			@RequestParam(required = false, defaultValue = "10") int pageSize,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondBulletinBean") CondBulletinBean condBulletinBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("bulletin/commentReply.empty");//THUMBNAIL TYPE

		AjaxResultBean ajaxResultBean = new AjaxResultBean();
		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
  		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

	  	condBulletinBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

      	if(principal != null) {
      		mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.YES_VAL);
      		condBulletinBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	}

      	mv.addObject(ConstVal.RESULT_LIST_KEY,bulletinService.selectCommentReplyList(condBulletinBean));
		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	//mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
	}


    /**
     * comment 삭제
     * comment new insert
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/commentDeleteAjax", method = RequestMethod.POST)
  	public ModelAndView commentDeleteAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("CommentBean") CommentBean commentBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();


	  	if(principal == null) {
	  		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
	  	} else {

	  		String userSeq = SessionUtil.getUserSeq(req);
      		commentBean.setLangCd(locale.getLanguage().toUpperCase());
      		commentBean.setRegUserSeq(userSeq);
      		commentBean.setModUserSeq(userSeq);

      		if(StringUtils.equals("1", commentBean.getDepth())) {//1뎁스 코멘트일경우 하위글이있으면 삭제 불가
      			commentBean.setContent(messageSource.getMessage("bulletin.msg.content.delete",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));
      		}


      		if(bulletinService.deleteComment(commentBean) > 0) {//입력성공, delete success
      			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//입력실패,delete fail
	      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
      		} else {
      			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//입력실패,delete fail
	      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
      		}
      	}


		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}

}
