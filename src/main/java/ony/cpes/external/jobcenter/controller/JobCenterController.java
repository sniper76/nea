package ony.cpes.external.jobcenter.controller;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.tag.CpesPaginationTag;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.jobcenter.bean.CondJobCenterBean;
import ony.cpes.external.jobcenter.bean.JobCenterBean;
import ony.cpes.external.jobcenter.service.JobCenterService;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;


@RequestMapping("/jobcenter")
@Controller
public class JobCenterController  extends BaseController {
	  private static Log log = LogFactory.getLog(JobCenterController.class);

	  @Autowired
	  private CommonService commonService;

	  @Autowired
	  private JobCenterService jobCenterService;

	  @Autowired SessionLocaleResolver localeResolver;

	  @Resource(name = "propertiesService")
	  protected EgovPropertyService propertiesService;


	  @Autowired MessageSource messageSource;


	/**
	 * 잡센터 목록
	 * borad list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/list")
	public ModelAndView list(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondJobCenterBean") CondJobCenterBean condJobCenterBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {

	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobcenter/list.one");

	  	mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.YES_VAL);

	  	return mv;

	}

	  @RequestMapping("/listAjax")
	  public ModelAndView listAjax(Locale locale,
			  @ModelAttribute("CondJobCenterBean") CondJobCenterBean conditionBean,
			  Principal principal,
			  HttpServletRequest req,
			  HttpServletResponse res) throws Exception {

		  ModelAndView mv = new ModelAndView();

			if (principal != null) {
				conditionBean.setCondUserSeq(SessionUtil.getUserSeq(req));
			}
			conditionBean.setLangCd(locale.getLanguage().toUpperCase());

			PaginationInfo paginationInfo = PageUtil.getPageInfo(conditionBean.getPageIndex(), conditionBean.getPageUnit(),
					conditionBean.getPageSize());
			conditionBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
			conditionBean.setLastIndex(paginationInfo.getLastRecordIndex());
			conditionBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			int totCnt = jobCenterService.selectJobCenterListCnt(conditionBean);
			paginationInfo.setTotalRecordCount(totCnt);
			conditionBean.setRecordsTotal(totCnt);

			if(totCnt > 0) {
				mv.addObject(ConstVal.RESULT_KEY, jobCenterService.selectJobCenterList(conditionBean));
			}

			CpesPaginationTag pTag = new CpesPaginationTag();

			mv.addObject("totalPageCount", paginationInfo.getTotalRecordCount());
			mv.addObject("currentPageNo", paginationInfo.getCurrentPageNo());
			mv.addObject(ConstVal.PAGINATION_INFO_KEY, pTag.getPagination(req, paginationInfo, "fnGoSrch"));

			mv.setViewName(ConstVal.JSON_VIEW_KEY);

		  return mv;
	  }



	/**
	 * 잡센터 상세
	 * borad view
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/view")
	public ModelAndView view(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondJobCenterBean") CondJobCenterBean condJobCenterBean,
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {


	  	ModelAndView mv = new ModelAndView();
	  	mv.setViewName("jobcenter/view.one");//게시판 기본유형,BASIC TYPE
	  	mv.addObject(ConstVal.LOGIN_YN_KEY, ConstVal.NO_VAL);



      	condJobCenterBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code


	  	mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.YES_VAL);

		JobCenterBean jobCenterBean = jobCenterService.selectJobCenter(condJobCenterBean);//게시물 상세정보,jobcenter detail info

		if(StringUtil.isEmpty(jobCenterBean)) {//데이터 없음,NO DATA
			mv.addObject(ConstVal.NO_DATA_KEY,ConstVal.YES_VAL);
			return mv;
		}

		mv.addObject(ConstVal.RESULT2_KEY, jobCenterBean);


	  	return mv;

	}
}
