package ony.cpes.external.instt.controller;

import java.security.Principal;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.StringUtils;
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
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.tag.CpesPaginationTag;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.compny.service.CompnyService;
import ony.cpes.external.instt.service.InsttService;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngFreeBean;
import ony.cpes.external.mypage.instt.bean.CondInsttMemBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.instt.service.InsttMemService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/instt")
@Controller
public class InsttController extends BaseController{
	private static Log log = LogFactory.getLog(InsttController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private InsttService insttService;


	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	/**
	 * 교육기관정보 상세 화면
	 * instt detail info
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping("/view")
	public ModelAndView view(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondInsttMemBean") CondInsttMemBean condInsttMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("instt/view.one");

		if(StringUtil.isEmpty(condInsttMemBean.getCondSeq())) {//정상적인 접근이 아님
			mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
			return mv;
		}

		condInsttMemBean.setLangCd(locale.getLanguage().toUpperCase());
		CondEduTrnngBean condEduTrnngBean = new CondEduTrnngBean();
		condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condEduTrnngBean.setCondSeq(condInsttMemBean.getCondSeq());

		if(principal !=null) {
			String userSeq = SessionUtil.getUserSeq(req);
			condInsttMemBean.setCondUserSeq(userSeq);
      		condEduTrnngBean.setCondUserSeq(userSeq);
		}

		InsttMemBean param = insttService.selectInstt(condInsttMemBean);
		if(StringUtil.isEmpty(param)) {
			mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
			return mv;
      	}

		mv.addObject(ConstVal.RESULT_LIST_KEY, insttService.selectEduTrnngHistList(condInsttMemBean));

      	mv.addObject(ConstVal.RESULT_KEY, param);
      	mv.addObject(ConstVal.TOT_CNT_KEY, insttService.selectEduTrnngContinueListCnt(condEduTrnngBean));


	  	return mv;
	}

	/**
	 * 교육훈련정보 목록
	 * education tranning list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/eduTrnngContinueListAjax")
	  public ModelAndView eduTrnngContinueListAjax(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		  	ModelAndView mv = new ModelAndView();
		  	mv.setViewName("instt/eduTrnngContinueList.empty");


	      	condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

	      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
	  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);


	  		if(principal != null) {
	  			condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));
	  		}

	  		condEduTrnngBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
	  		condEduTrnngBean.setLastIndex(paginationInfo.getLastRecordIndex());
	  		condEduTrnngBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());



	      	int totCnt = insttService.selectEduTrnngContinueListCnt(condEduTrnngBean);
	    	paginationInfo.setTotalRecordCount(totCnt);
	    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

	    	if(totCnt > 0) {
	    		mv.addObject(ConstVal.RESULT_LIST_KEY, insttService.selectEduTrnngContinueList(condEduTrnngBean));
	    	}


		  	return mv;
	  }

		/**
		 * instt list
		 *
		 * @param req
		 * @param res
		 * @return ModelAndView
		 * @throws Exception
		 */
		@RequestMapping("/insttList")
		public ModelAndView insttList(Locale locale,
				@RequestParam(required = false, defaultValue = "1") int currentPageNo,
				@RequestParam(required = false, defaultValue = "10") int pageUnit,
				@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondEduTrnngBean") CondEduTrnngBean condEduTrnngBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

			ModelAndView mv = new ModelAndView();
			mv.setViewName("instt/insttList.one");

			conditionBean.setLangCd(locale.getLanguage().toUpperCase());
			condEduTrnngBean.setLangCd(locale.getLanguage().toUpperCase());

			if(principal != null) {
				condEduTrnngBean.setCondUserSeq(SessionUtil.getUserSeq(req));
			}

			// Location
			conditionBean.setCondCntryId(ConstVal.CONTRY_CD_CAMBODIA_VAL);
			mv.addObject("locCd", commonService.selectLocCdList(conditionBean));

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_INSTT_OWNER_CD_VAL);
			mv.addObject("insttOwnerCd", commonService.selectCommCdList(conditionBean));

			conditionBean.setCondGrpCd(ConstVal.GRP_CD_INSTT_TYPE_CD_VAL);
			mv.addObject("insttTypeCd", commonService.selectCommCdList(conditionBean));

			return mv;

		}

		@RequestMapping("/insttListAjax")
		public ModelAndView insttListAjax(Locale locale,
				@ModelAttribute("CondEduTrnngFreeBean") CondEduTrnngFreeBean conditionBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {
			ModelAndView mv = new ModelAndView();

			conditionBean.setLangCd(locale.getLanguage().toUpperCase());
//			conditionBean.setCondCntryId(ConstVal.ONE_VAL);
			conditionBean.setCondCateCd(ConstVal.BKMK_CATE_CD_INSTT_VAL);
			conditionBean.setCondDivCd(ConstVal.EDU_DIV_CD_SOFT_SKILL_VAL);

			if (principal != null) {
				conditionBean.setCondUserSeq(SessionUtil.getUserSeq(req));
			}

			PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
					conditionBean.getPageSize());
			conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
			conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
			conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			int totCnt = insttService.selectInsttListCnt(conditionBean);
			paginationInfo.setTotalRecordCount(totCnt);
			conditionBean.setRecordsTotal(totCnt);

			if(totCnt > 0) {
				mv.addObject(ConstVal.RESULT_KEY, insttService.selectInsttList(conditionBean));
			}

			CpesPaginationTag pTag = new CpesPaginationTag();

			mv.addObject("totalPageCount", paginationInfo.getTotalPageCount());
			mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
			mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

			mv.setViewName(ConstVal.JSON_VIEW_KEY);
			return mv;
		}

}
