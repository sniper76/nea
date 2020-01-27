package ony.cpes.external.mypage.privt.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
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
import ony.cmm.common.bean.FileBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.mypage.privt.bean.CondInterestBean;
import ony.cpes.external.mypage.privt.bean.CondPrivtMemBean;
import ony.cpes.external.mypage.privt.bean.MatchingBean;
import ony.cpes.external.mypage.privt.bean.MatchingSrchBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemChgBean;
import ony.cpes.external.mypage.privt.service.InterestService;
import ony.cpes.external.mypage.privt.service.PrivtMatchingService;
import ony.cpes.external.mypage.privt.service.PrivtMemService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/cpes/private/member")
@Controller
public class PrivtMemController extends BaseController{
	private static Log log = LogFactory.getLog(PrivtMemController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private PrivtMemService privtMemService;

	@Autowired
	private InterestService interestService;

	@Autowired
	private PrivtMatchingService privtMatchingService;

	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 개인 마이페이지 메인
	 * private main
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/main")
	public ModelAndView main(Locale locale,
		@ModelAttribute("ConditionBean") ConditionBean conditionBean,
		@ModelAttribute("CondPrivtMemBean") CondPrivtMemBean condPrivtMemBean,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/main.left");

		String userSeq = SessionUtil.getUserSeq(req);

		condPrivtMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condPrivtMemBean.setCondUserSeq(userSeq);

  		PrivtMemBean result = privtMemService.selectPrivtMember(condPrivtMemBean);

  		if(StringUtil.isEmpty(result)) {
      		mv.addObject(ConstVal.USER_EXIST_YN_KEY, ConstVal.NO_VAL);
    		return mv;
  		}

  		if(result.getUserCell() != null && !"".equals(result.getUserCell().trim())) {
  			result.setUserCell(EncryptUtil.getAes256Dec(result.getUserCell()));
  		}
  		if(result.getUserEmail() != null && !"".equals(result.getUserEmail().trim())) {
  			result.setUserEmail(EncryptUtil.getAes256Dec(result.getUserEmail()));
  		}

  		// select member image list
  		FileBean fileBean = new FileBean();
      	fileBean.setFileGrpSeq(result.getFileGrpSeq());
      	List<FileBean> memImgList = commonService.selectAttachFilesList(fileBean);

      	// select summary information
      	mv.addObject("smry", privtMemService.selectApplicSmry2(userSeq));

		conditionBean.setCondGrpCd(ConstVal.GRP_CD_USER_AUTH_CD_VAL);
	  	mv.addObject("userAuthCd", commonService.selectCommCdList(conditionBean));//회원타입
  		mv.addObject(ConstVal.RESULT_KEY, result);
  		mv.addObject("memImgList", memImgList);
		return mv;
	}

	/**
	 * 관심채용공고 목록
	 * @param locale
	 * @param currentPageNo
	 * @param pageUnit
	 * @param pageSize
	 * @param param
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/interestListAjax")
	public ModelAndView interestListAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("CondInterestBean") CondInterestBean param,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);

		PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	param.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	param.setLastIndex(paginationInfo.getLastRecordIndex());
      	param.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
      	param.setLangCd(locale.getLanguage().toUpperCase());//language code
      	param.setRegUserSeq(userSeq);
      	param.setCd(userAuthCd);
      	param.setCondUserSeq(userSeq);

	  	int totCnt = 0;

		totCnt = interestService.selectVacancyListCnt(param);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, interestService.selectVacancyList(param));
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * Tailored Matching List
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/matchingListAjax")
	public ModelAndView matchingListAjax(Locale locale,
		@RequestParam(required = false, defaultValue = "1") int currentPageNo,
		@RequestParam(required = false, defaultValue = "10") int pageUnit,
		@RequestParam(required = false, defaultValue = "10") int pageSize,
		@ModelAttribute("MatchingSrchBean") MatchingSrchBean param,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
    	AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = StringUtil.nvl(SessionUtil.getUserSeq(req));
		String userAuthCd = SessionUtil.getUserAuthCd(req);

		PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
      	param.setFirstIndex(paginationInfo.getFirstRecordIndex());
      	param.setLastIndex(paginationInfo.getLastRecordIndex());
      	param.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
      	param.setLangCd(locale.getLanguage().toUpperCase());//language code
      	param.setRegUserSeq(userSeq);
      	param.setCd(userAuthCd);

      	param.setUserSeq(userSeq);
      	param.setLangCds(getStringByList(param.getLangCdStr()));
      	param.setPreferntCondCds(getStringByList(param.getPrivilegeCdStr()));
      	param.setEduDegreeCds(getStringByList(param.getEduDegreeCdStr()));

	  	int totCnt = 0;
	  	int matchSetCnt = 0;

	  	MatchingBean matchSetParam = new MatchingBean();
	  	matchSetParam.setUserSeq(userSeq);
	  	matchSetCnt = privtMatchingService.selectMatchingCnt(matchSetParam);

		totCnt = privtMatchingService.selectMatchingByVacancysCnt(param);
	    paginationInfo.setTotalRecordCount(totCnt);
	    mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

		if(totCnt > 0) {
			mv.addObject(ConstVal.RESULT_LIST_KEY, privtMatchingService.selectMatchingByVacancys(param));
		}

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject("matchSetCnt", matchSetCnt);
		mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	    return mv;
	}

	/**
	 * 개인정보 수정 화면
	 * private info modify form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondPrivtMemBean") CondPrivtMemBean condPrivtMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();

		if(!StringUtil.isEmpty(condPrivtMemBean.getCondCertNo()) && condPrivtMemBean.getCondCertNo().length() == 7) {//비밀번호 확인을 하고 들어온경우만
			mv.setViewName("mypage/privt/member/modify.left");
		} else {
			mv.addObject(ConstVal.RESULT_KEY, "modify");
			mv.setViewName("common/pwdConfirm.left");
			return mv;
		}

		condPrivtMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condPrivtMemBean.setCondUserSeq(SessionUtil.getUserSeq(req));

      	mv.addObject(ConstVal.RESULT_KEY, privtMemService.selectPrivtMember(condPrivtMemBean));

	  	return mv;
	}


	/**
	 * 개인정보 수정
	 * private info update
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/modifyProcessAjax", method = RequestMethod.POST)
	public ModelAndView modifyProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("PrivtMemBean") PrivtMemBean privtMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();


		privtMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

		String userSeq = SessionUtil.getUserSeq(req);
		privtMemBean.setUserSeq(userSeq);
		privtMemBean.setRegUserSeq(userSeq);
  		privtMemBean.setModUserSeq(userSeq);


  		if(privtMemService.updatePrivtMember(privtMemBean) > 0) {
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
	 * 회원타입 변경 form
	 * member type change form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/typeChange", method = RequestMethod.POST)
	public ModelAndView typeChange(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondPrivtMemBean") CondPrivtMemBean condPrivtMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/member/typeChange.left");

		condPrivtMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condPrivtMemBean.setCondUserSeq(SessionUtil.getUserSeq(req));


  		PrivtMemBean param = privtMemService.selectPrivtMember(condPrivtMemBean);

  		if(StringUtil.isEmpty(param)) {
      		mv.addObject(ConstVal.USER_EXIST_YN_KEY,ConstVal.NO_VAL);
    		return mv;
  		}
  		mv.addObject(ConstVal.RESULT_KEY, param);
  		mv.addObject(ConstVal.RESULT2_KEY, privtMemService.selectMemberChg(condPrivtMemBean));


		conditionBean.setCondGrpCd(ConstVal.GRP_CD_USER_AUTH_CD_VAL);
	  	mv.addObject("userAuthCd", commonService.selectCommCdList(conditionBean));//회원타입

		return mv;

	}


    /**
	 * 회원타입 변경 처리
	 * member type change process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/typeChangeProcessAjax", method = RequestMethod.POST)
	public ModelAndView typeChangeProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("PrivtMemChgBean") PrivtMemChgBean privtMemChgBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		privtMemChgBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		String userSeq = SessionUtil.getUserSeq(req);
  		privtMemChgBean.setUserSeq(userSeq);
  		privtMemChgBean.setModUserSeq(userSeq);
  		privtMemChgBean.setRegUserSeq(userSeq);


  		PrivtMemChgBean result = privtMemService.insertMemberTypeChange(privtMemChgBean);

  		if(!StringUtil.isEmpty(result)) {
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
      		mv.addObject(ConstVal.RESULT2_KEY,result);
		} else {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
		}


    	mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}

	private List<String> getStringByList(String strs) {
		List<String> cds = new ArrayList<String>();
		if(!StringUtil.isEmpty(strs) ) {
			String[] temp;
			if(strs.indexOf(",") > -1) {
				temp = strs.split(",");
			}
			else {
				temp = new String[1];
				temp[0] = strs;
			}
			for (String s : temp) {
				cds.add(s);
			}
		}
		return cds;
	}

}
