package ony.cpes.external.info.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
}
