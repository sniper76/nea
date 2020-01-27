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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.tag.CpesPaginationTag;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.jobfair.bean.CondWorkShopBean;
import ony.cpes.external.jobfair.service.JobFairService;
import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.cpes.external.mypage.privt.bean.MatchingBean;
import ony.cpes.external.mypage.privt.service.PrivtFairService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;

@RequestMapping("/cpes/private/workshop")
@Controller
public class PrivtWorkShopController extends BaseController{
	private static Log log = LogFactory.getLog(PrivtWorkShopController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private PrivtFairService privtFairService;

	@Autowired
	private JobFairService jobFairService;

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
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondFairBean") CondFairBean condFairBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/privt/workshop/list.left");

		return mv;

	}

	  @RequestMapping("/listAjax")
	  public ModelAndView listAjax(Locale locale,
			  @ModelAttribute("CondWorkShopBean") CondWorkShopBean conditionBean,
			  Principal principal,
			  HttpServletRequest req,
			  HttpServletResponse res) throws Exception {

		  ModelAndView mv = new ModelAndView();

			conditionBean.setLangCd(locale.getLanguage().toUpperCase());
			if (principal != null) {
				conditionBean.setCondUserSeq(SessionUtil.getUserSeq(req));
			}

			PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
					conditionBean.getPageSize());
			conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
			conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
			conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		  int totCnt = jobFairService.selectUserByWorkShopsCnt(conditionBean);
		  paginationInfo.setTotalRecordCount(totCnt);
		  conditionBean.setRecordsTotal(totCnt);

		  if(totCnt > 0) {
			  mv.addObject(ConstVal.RESULT_KEY, jobFairService.selectUserByWorkShops(conditionBean));
		  }

			CpesPaginationTag pTag = new CpesPaginationTag();

			mv.addObject("totalPageCount", paginationInfo.getTotalRecordCount());
			mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
			mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

			mv.setViewName(ConstVal.JSON_VIEW_KEY);
			return mv;
	  }

		@RequestMapping("/deleteAjax")
		public ModelAndView deleteAjax(Locale locale,
				@ModelAttribute("CondWorkShopBean") CondWorkShopBean conditionBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {
			ModelAndView mv = new ModelAndView();

			String userSeq = SessionUtil.getUserSeq(req);
			conditionBean.setLangCd(locale.getLanguage().toUpperCase());
			conditionBean.setCondUserSeq(userSeq);
			conditionBean.setRegUserSeq(userSeq);
			conditionBean.setModUserSeq(userSeq);

			int result = jobFairService.deleteUserByWorkshop(conditionBean);
			if(result > 0) {
				mv.addObject(ConstVal.RESULT_KEY, ConstVal.YES_VAL);
			}else {
				mv.addObject(ConstVal.RESULT_KEY, ConstVal.NO_VAL);
			}

			mv.setViewName(ConstVal.JSON_VIEW_KEY);
			return mv;
		}

}
