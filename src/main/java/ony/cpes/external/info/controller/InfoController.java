package ony.cpes.external.info.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ony.cmm.common.ConstVal;
import ony.cpes.external.info.service.LmiService;
import ony.framework.BaseController;

@RequestMapping("/info")
@Controller
public class InfoController extends BaseController {

	private static Log log = LogFactory.getLog(InfoController.class);

	@Autowired
	MessageSource messageSource;

	@Autowired
	private LmiService lmiService;

	/**
	 * 노동시장 지표
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/lmi")
	public ModelAndView view(Locale locale,
		String year,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
	  	mv.setViewName("info/lmi.one");

	  	if(year == null || "".equals(year.trim())) {
			Calendar cal = Calendar.getInstance();
			year = String.valueOf(cal.get(Calendar.YEAR));
	  	}

	  	mv.addObject(ConstVal.RESULT_LIST_KEY, lmiService.selectLmi(year));
  		return mv;
	}

	/**
	 * nea 소개
	 * nea intro
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/neaIntro")
	public ModelAndView neaIntro(Locale locale,
		String year,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();

		if(StringUtils.equals(ConstVal.LANG_KH_VAL, locale.getLanguage().toUpperCase())) {
			mv.setViewName("info/neaIntroKh.one");
		} else {
			mv.setViewName("info/neaIntroEn.one");
		}

  		return mv;
	}

	/**
	 * nea 비전
	 * nea 비전
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/neaVision")
	public ModelAndView neaVision(Locale locale,
		String year,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();

		if(StringUtils.equals(ConstVal.LANG_KH_VAL, locale.getLanguage().toUpperCase())) {
			mv.setViewName("info/neaVisionKh.one");
		} else {
			mv.setViewName("info/neaVisionEn.one");
		}

  		return mv;
	}

	/**
	 * nea 조직
	 * nea intro
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/neaGroup")
	public ModelAndView neaGroup(Locale locale,
		String year,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();

		if(StringUtils.equals(ConstVal.LANG_KH_VAL, locale.getLanguage().toUpperCase())) {
			mv.setViewName("info/neaGroupKh.one");
		} else {
			mv.setViewName("info/neaGroupEn.one");
		}

  		return mv;
	}

	/**
	 * 유용한 사이트
	 * useful website
	 * @param locale
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/usefulSite")
	public ModelAndView usefulSite(Locale locale,
		String year,
		Principal principal,
		HttpServletRequest req,
		HttpServletResponse res
	) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("info/usefulSite.one");


  		return mv;
	}
}
