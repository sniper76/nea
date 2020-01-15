package ony.cpes.external.compny.controller;

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
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.compny.service.CompnyService;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.mypage.compny.bean.CompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.framework.BaseController;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;

@RequestMapping("/compny")
@Controller
public class CompnyController extends BaseController{
	private static Log log = LogFactory.getLog(CompnyController.class);

	@Autowired
	private CommonService commonService;

	@Autowired
	private CompnyService compnyService;


	@Autowired SessionLocaleResolver localeResolver;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	/**
	 * 기업정보 상세 화면
	 * company detail info
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public ModelAndView view(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondCompnyMemBean") CondCompnyMemBean condCompnyMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("compny/view.one");

		if(StringUtil.isEmpty(condCompnyMemBean.getCondSeq())) {//정상적인 접근이 아님
			mv.addObject(ConstVal.CONN_YN_KEY,ConstVal.NO_VAL);
			return mv;
		}

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condCompnyMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		CondVacancyBean condVacancyBean = new CondVacancyBean();
		condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		condVacancyBean.setCondSeq(condCompnyMemBean.getCondSeq());

		if(principal !=null) {
			String userSeq = SessionUtil.getUserSeq(req);
			condCompnyMemBean.setCondUserSeq(userSeq);
      		condVacancyBean.setCondUserSeq(userSeq);
		}

		CompnyMemBean param = compnyService.selectCompnyInfo(condCompnyMemBean);
		if(StringUtil.isEmpty(param)) {
			mv.addObject(ConstVal.DATA_EXIST_YN_KEY,ConstVal.NO_VAL);
			return mv;
		}


      	mv.addObject(ConstVal.RESULT_KEY, param);
      	mv.addObject(ConstVal.TOT_CNT_KEY, compnyService.selectVacancyContinueListCnt(condVacancyBean));


	  	return mv;
	}

	/**
	 * 채용정보 목록
	 * community list
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	  @RequestMapping("/vacancyContinueListAjax")
	  public ModelAndView vacancyContinueListAjax(Locale locale,
	  			@RequestParam(required = false, defaultValue = "1") int currentPageNo,
	  			@RequestParam(required = false, defaultValue = "10") int pageUnit,
	  			@RequestParam(required = false, defaultValue = "10") int pageSize,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		  	ModelAndView mv = new ModelAndView();
		  	mv.setViewName("compny/vacancyContinueList.empty");

	      	condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code

	      	PaginationInfo paginationInfo = PageUtil.getPageInfo(currentPageNo, pageUnit, pageSize);
	  		mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);


	  		if(principal != null) {
	  			condVacancyBean.setCondUserSeq(SessionUtil.getUserSeq(req));
	  		}

	      	condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
	      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
	      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());


	      	condVacancyBean.setCondBkmkCateCd(ConstVal.BKMK_CATE_CD_VACANCY_VAL);
	      	int totCnt = compnyService.selectVacancyContinueListCnt(condVacancyBean);
	    	paginationInfo.setTotalRecordCount(totCnt);
	    	mv.addObject(ConstVal.PAGINATION_INFO_KEY, paginationInfo);

	    	if(totCnt > 0) {
	    		mv.addObject(ConstVal.RESULT_LIST_KEY, compnyService.selectVacancyContinueList(condVacancyBean));
	    	}


		  	return mv;
	  }

}
