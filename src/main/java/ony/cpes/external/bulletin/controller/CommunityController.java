package ony.cpes.external.bulletin.controller;

import java.security.Principal;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.fasterxml.jackson.databind.ObjectMapper;

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
import ony.cpes.external.bulletin.bean.CondBulletinBean;
import ony.cpes.external.bulletin.service.BulletinService;
import ony.cpes.external.member.bean.MemberBean;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/community")
@Controller
public class CommunityController  extends BaseController {
	  private static Log log = LogFactory.getLog(CommunityController.class);

	  @Autowired
	  private CommonService commonService;

	  @Autowired
	  private BulletinService bulletinService;

	  @Autowired SessionLocaleResolver localeResolver;

	  @Resource(name = "propertiesService")
	  protected EgovPropertyService propertiesService;


	  @Autowired MessageSource messageSource;



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
	  	mv.setViewName("bulletin/community/list.one");//게시판 기본유형,BASIC TYPE
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

      	condBulletinBean.setCondBulletinTypeCd(ConstVal.BULLETIN_TYPE_CD_COMMUNITY_VAL);//커뮤니티 타입
	  	BulletinConfigBean bulletinConfigBean = bulletinService.selectBulletinConfigType(condBulletinBean);//게시판 설정 정보가 bulletin config


	  	if(StringUtil.isEmpty(bulletinConfigBean)) {//게시판 설정 정보가 없는경우,bulletin config nothing
	  		mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
	  		return mv;
	  	}
	  	condBulletinBean.setCondBulletinMngSeq(bulletinConfigBean.getBulletinMngSeq());
	  	condBulletinBean.setCondLikeCateCd(ConstVal.LIKE_CATE_CD_COMMUNITY_VAL);

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
	 * community view
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
	  	mv.setViewName("bulletin/community/view.one");//게시판 기본유형,BASIC TYPE
	  	mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.NO_VAL);


      	condBulletinBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

      	if(principal != null) {
      		mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.YES_VAL);
      		condBulletinBean.setCondUserSeq(SessionUtil.getUserSeq(req));
      	}

    	condBulletinBean.setCondBulletinTypeCd(ConstVal.BULLETIN_TYPE_CD_COMMUNITY_VAL);//커뮤니티 타입
	  	BulletinConfigBean bulletinConfigBean = bulletinService.selectBulletinConfigType(condBulletinBean);//게시판 설정 정보가 bulletin config

	  	if(StringUtil.isEmpty(bulletinConfigBean)) {//게시판 설정 정보가 없는경우,bulletin config nothing
	  		mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
	  		return mv;
	  	}



	  	mv.addObject(ConstVal.RESULT_KEY, bulletinConfigBean);//게시판 설정정보,BOARD CONFIG INFO
	  	mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.YES_VAL);

	  	condBulletinBean.setCondBulletinMngSeq(bulletinConfigBean.getBulletinMngSeq());

	  	condBulletinBean.setCondLikeCateCd(ConstVal.LIKE_CATE_CD_COMMUNITY_VAL);
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
	 * 게시판 작성
	 * community wirte
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/write")
	public ModelAndView write(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondBulletinBean") CondBulletinBean condBulletinBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("bulletin/community/write.one");//게시판 기본유형,BASIC TYPE

	  	if(principal == null) {
	  		res.sendRedirect("/login.do?retUrl=/community/list.do");
	  	}

	  	condBulletinBean.setCondBulletinTypeCd(ConstVal.BULLETIN_TYPE_CD_COMMUNITY_VAL);//커뮤니티 타입
	  	BulletinConfigBean bulletinConfigBean = bulletinService.selectBulletinConfigType(condBulletinBean);//게시판 설정 정보가 bulletin config

	  	if(StringUtil.isEmpty(bulletinConfigBean)) {//게시판 설정 정보가 없는경우,bulletin config nothing
	  		mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
	  		return mv;
	  	}

	  	mv.addObject(ConstVal.RESULT_KEY, bulletinConfigBean);//게시판 설정정보,BOARD CONFIG INFO
	  	mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.YES_VAL);



	  	return mv;
	}

    /**
     * 커뮤니티 신규 저장
     * community new insert
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/writeProcessAjax", method = RequestMethod.POST)
  	public ModelAndView writeProcessAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("BulletinBean") BulletinBean bulletinBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

	  	if(principal == null) {
	  		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
	  	} else {

	  		String userSeq = SessionUtil.getUserSeq(req);
	      	bulletinBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	      	bulletinBean.setRegUserSeq(userSeq);
      		bulletinBean.setModUserSeq(userSeq);

      		bulletinBean.setTitleEn(bulletinBean.getTitle());
      		bulletinBean.setTitleKh(bulletinBean.getTitle());
      		bulletinBean.setContentEn(bulletinBean.getContent());
      		bulletinBean.setContentKh(bulletinBean.getContent());
      		bulletinBean.setBulletinTypeCd(ConstVal.BULLETIN_TYPE_CD_COMMUNITY_VAL);

      		if(bulletinService.insertBulletin(bulletinBean) > 0) {//입력성공, insert success
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
	 * 게시판 수정 화면
	 * community modify
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/modify")
	public ModelAndView modify(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondBulletinBean") CondBulletinBean condBulletinBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("bulletin/community/modify.one");//게시판 기본유형,BASIC TYPE

	  	condBulletinBean.setLangCd(locale.getLanguage().toUpperCase());

	  	if(principal == null) {
	  		res.sendRedirect("/login.do?retUrl=/community/list.do");
	  	} else {
	  		condBulletinBean.setCondUserSeq(SessionUtil.getUserSeq(req));
	  	}

	  	condBulletinBean.setCondBulletinTypeCd(ConstVal.BULLETIN_TYPE_CD_COMMUNITY_VAL);//커뮤니티 타입
	  	BulletinConfigBean bulletinConfigBean = bulletinService.selectBulletinConfigType(condBulletinBean);//게시판 설정 정보가 bulletin config

	  	if(StringUtil.isEmpty(bulletinConfigBean)) {//게시판 설정 정보가 없는경우,bulletin config nothing
	  		mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
	  		return mv;
	  	}
	  	mv.addObject(ConstVal.RESULT_KEY, bulletinConfigBean);//게시판 설정정보,BOARD CONFIG INFO


	  	condBulletinBean.setCondBulletinMngSeq(bulletinConfigBean.getBulletinMngSeq());
	  	condBulletinBean.setCondLikeCateCd(ConstVal.LIKE_CATE_CD_COMMUNITY_VAL);
	  	condBulletinBean.setCondViewCntYn(ConstVal.NO_VAL);
		BulletinBean bulletinBean = bulletinService.selectBulletin(condBulletinBean);//게시물 상세정보,bulletin detail info

		if(StringUtil.isEmpty(bulletinBean)) {//데이터 없음,NO DATA
			mv.addObject(ConstVal.NO_DATA_KEY,ConstVal.YES_VAL);
			return mv;
		}

		if(!StringUtils.equals(ConstVal.YES_VAL, bulletinBean.getModifyYn())) {//본인글이 아닌경우,no myself write
			mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
	  		return mv;
		}

		mv.addObject(ConstVal.RESULT2_KEY, bulletinBean);
	  	mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.YES_VAL);



	  	return mv;
	}

    /**
     * 커뮤니티 수정 처리
     * community update
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/modifyProcessAjax", method = RequestMethod.POST)
  	public ModelAndView modifyProcessAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("BulletinBean") BulletinBean bulletinBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

	  	if(principal == null) {
	  		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
	  	} else {
	  		String userSeq = SessionUtil.getUserSeq(req);
	  		bulletinBean.setLangCd(locale.getLanguage().toUpperCase());
	  		bulletinBean.setRegUserSeq(userSeq);
      		bulletinBean.setModUserSeq(userSeq);

      		bulletinBean.setTitleEn(bulletinBean.getTitle());
      		bulletinBean.setTitleKh(bulletinBean.getTitle());
      		bulletinBean.setContentEn(bulletinBean.getContent());
      		bulletinBean.setContentKh(bulletinBean.getContent());

      		if(bulletinService.updateBulletin(bulletinBean) > 0) {//수정성공, update success
      			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//수정실패,update fail
	      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
      		} else {
      			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//수정실패,update fail
	      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
      		}

	  	}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}


    /**
     * 커뮤니티 삭제 처리
     * community delete
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/deleteAjax", method = RequestMethod.POST)
  	public ModelAndView deleteAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("BulletinBean") BulletinBean bulletinBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
      	ModelAndView mv = new ModelAndView();
      	AjaxResultBean ajaxResultBean = new AjaxResultBean();

	  	if(principal == null) {
	  		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
	  	} else {
			String userSeq = SessionUtil.getUserSeq(req);
	  		bulletinBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
	  		bulletinBean.setRegUserSeq(userSeq);
      		bulletinBean.setModUserSeq(userSeq);


      		if(bulletinService.deleteBulletin(bulletinBean) > 0) {//수정성공, update success
      			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);//수정실패,update fail
	      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
      		} else {
      			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);//삭제실패,update fail
	      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);
      		}

	  	}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;
  	}


}
