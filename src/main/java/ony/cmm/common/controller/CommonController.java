package ony.cmm.common.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.AjaxResultBean;
import ony.cmm.common.bean.BookMarkBean;
import ony.cmm.common.bean.CertifyBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.bean.FileBean;
import ony.cmm.common.bean.LikeBean;
import ony.cmm.common.bean.LocCdBean;
import ony.cmm.common.bean.SmsBean;
import ony.cmm.common.service.CommonService;
import ony.cmm.common.util.EncryptUtil;
import ony.cmm.common.util.SessionUtil;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.member.service.MemberService;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VideoIntvwPatcptnBean;
import ony.cpes.external.mypage.compny.service.CompnyVacancyService;
import ony.cpes.external.mypage.privt.bean.CondPrivtMemBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemBean;
import ony.cpes.external.mypage.privt.service.PrivtMemService;
import ony.framework.BaseConfig;
import ony.framework.BaseController;
import ony.framework.util.Encryption;
import ony.framework.util.PageUtil;
import ony.framework.util.StringUtil;




@Controller
public class CommonController extends BaseController{

  private static Log log = LogFactory.getLog(CommonController.class);

  @Autowired SessionLocaleResolver localeResolver;

  @Autowired MessageSource messageSource;

  @Autowired
  private MemberService memberService;

  @Autowired
  private PrivtMemService privtMemService;

  @Autowired
  private CompnyVacancyService compnyVacancyService;

  @Autowired
  CommonService commonService;


	/**
	 * 메인페이지
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
 */
	@RequestMapping("/index")
	public String index(HttpServletRequest req, HttpServletResponse res) throws Exception {

		return "index.one";
	}

    /**
     * 로그아웃
     * log out
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/loginOutAjax", method = RequestMethod.POST)
	public ModelAndView loginOutAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		try {
			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
			SecurityContextHolder.clearContext();
		} catch(Exception e) {
      		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
		}


    	mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}

  	/**
  	 * 관리자 로그인 거부화면
  	 * @param request
  	 * @param response
  	 * @return
  	 * @throws Exception
   */
  	@RequestMapping("/common/accessDeniedPage")
	public String accessDeniedPage(HttpServletRequest req, HttpServletResponse res) throws Exception {

		return "common/accessDeniedPage.one";
	}

	/**
	   * 인증번호 생성
	   * certify number create
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	*/
	@RequestMapping(value = "/common/getCertifyNoAjax", method = RequestMethod.POST)
	public ModelAndView getCertifyNo(Locale locale, @ModelAttribute("CertifyBean") CertifyBean certifyBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
  		ModelAndView mv = new ModelAndView();
  		//String lang = locale.getLanguage().toUpperCase();

  		String rndStr = StringUtil.randomStrNumber(6);//랜덤 숫자,random number

  		if(StringUtils.equals(ConstVal.SEND_DIVISION_SMS_VAL, certifyBean.getSendDivision())) {//cell phone,email send
            String msg = messageSource.getMessage("login.stop.msg.verification2",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req))+":"+ rndStr;
            SmsBean sms = new SmsBean();
            sms.setSmsText(msg);
            sms.setSmsTo(certifyBean.getUserCell());
            commonService.insertSmsLog(sms);

  		} else {//email send

  		}

  		certifyBean.setCertifyNo(rndStr);
  		certifyBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  		certifyBean.setSuccessYn(ConstVal.YES_VAL);


  		mv.addObject(ConstVal.RESULT_KEY,certifyBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}


	/**
	   * 이메일 중복체크
	   * user email duplicatoin check
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	*/
	@RequestMapping(value = "/common/getEmailDupChkAjax", method = RequestMethod.POST)
	public ModelAndView getEmailDupChk(Locale locale, @ModelAttribute("CertifyBean") CertifyBean certifyBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		certifyBean.setUserEmail(EncryptUtil.getAes256Enc(certifyBean.getUserEmail()));
		int cnt = memberService.selectEmailDupChk(certifyBean);
		if(cnt > 0) {
			certifyBean.setSuccessYn(ConstVal.NO_VAL);
			certifyBean.setMessage(messageSource.getMessage("member.join.step.two.errors.email.dup",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));
		} else {
			certifyBean.setSuccessYn(ConstVal.YES_VAL);
			certifyBean.setMessage(messageSource.getMessage("member.join.step.two.msg.email",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));
		}

		certifyBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
		certifyBean.setCnt(cnt);

		mv.addObject(ConstVal.RESULT_KEY,certifyBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}


	/**
	   * 사용자 핸드폰 중복체크
	   * user cell phone duplicatoin check
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	*/
	@RequestMapping(value = "/common/getCellPhoneDupChkAjax", method = RequestMethod.POST)
	public ModelAndView getCellPhoneDupChk(Locale locale, @ModelAttribute("CertifyBean") CertifyBean certifyBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		certifyBean.setUserCell(EncryptUtil.getAes256Enc(certifyBean.getUserCell()));
		int cnt = memberService.selectCellPhoneDupChk(certifyBean);
		if(cnt > 0) {
			certifyBean.setSuccessYn(ConstVal.NO_VAL);
			certifyBean.setMessage(messageSource.getMessage("member.join.step.two.errors.cell.dup",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));
		} else {
			certifyBean.setSuccessYn(ConstVal.YES_VAL);
			certifyBean.setMessage(messageSource.getMessage("member.join.step.two.msg.cell",null, ConstVal.ERROR_KEY, localeResolver.resolveLocale(req)));
		}

		certifyBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
		certifyBean.setCnt(cnt);

		mv.addObject(ConstVal.RESULT_KEY,certifyBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}




	 /**
	   * 좋아요 저장
	   * like insert
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	 */
	@RequestMapping(value = "/cpes/all/likeAjax", method = RequestMethod.POST)
	public ModelAndView likeAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("LikeBean") LikeBean likeBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		String userSeq = SessionUtil.getUserSeq(req);
		likeBean.setUserSeq(userSeq);
		likeBean.setRegUserSeq(userSeq);

		AjaxResultBean ajaxResultBean = new AjaxResultBean();


		if(likeBean.getLikeSeq() == null || likeBean.getLikeSeq().equals("")) {
			if(commonService.insertLike(likeBean) > 0) {
				ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
				ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
				ajaxResultBean.setReturnVal(likeBean.getLikeSeq());
			} else {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
			}
		}else{
			if(commonService.deleteLike(likeBean) > 0) {
				ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
				ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
			} else {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
			}
		}



		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}


	 /**
	   * 북마크 저장
	   * bookmark insert
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	 */
	@RequestMapping(value = "/cpes/all/bookMarkAjax", method = RequestMethod.POST)
	public ModelAndView bookMarkAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean, @ModelAttribute("BookMarkBean") BookMarkBean bookMarkBean, Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		bookMarkBean.setUserSeq(userSeq);
		bookMarkBean.setRegUserSeq(userSeq);


		if(StringUtil.isEmpty(bookMarkBean.getBkmkSeq())) {
			String bkmkSeq = commonService.insertBookMark(bookMarkBean);
			if(!StringUtils.equals(ConstVal.SPACE_VAL, bkmkSeq) ) {
				ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
				ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
				ajaxResultBean.setReturnVal(bkmkSeq);
			} else {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
			}
		}else {
			if(commonService.deleteBookMark(bookMarkBean) > 0) {
				ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
				ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
			} else {
				ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
				ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
			}
		}


		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}



	@RequestMapping("/common/viewAddrPopup")
	public ModelAndView viewAddrPopup(Principal principal,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		List<LocCdBean> locCdList = commonService.selectLocCdList(conditionBean);
		mv.addObject("commonLocCdList", locCdList);

		mv.setViewName("common/commonAddr.empty");
		return mv;
	}

	@RequestMapping("/common/nextDepthSelectAjax")
	public ModelAndView nextDepthSelectAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		// 다음 depth 코드 조회
		List<LocCdBean> resultList = commonService.selectLocCdList(conditionBean);
		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_KEY,resultList);
		mv.addObject(ConstVal.RESULT2_KEY,ajaxResultBean);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	@RequestMapping("/common/viewCommonPopup")
	public ModelAndView viewIscoPopup(Principal principal,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean, HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		if("addr".equals(conditionBean.getFlag())) {
			mv.addObject(ConstVal.RESULT_KEY, commonService.selectCommonLocCdList(conditionBean));
		}else if("isco".equals(conditionBean.getFlag())) {
			mv.addObject(ConstVal.RESULT_KEY, commonService.selectIscoCdList(conditionBean));
		}

		mv.addObject("flag", conditionBean.getFlag());
		mv.setViewName("common/commonPopup.empty");
		return mv;
	}

	@RequestMapping("/common/nextDepthCdSelectAjax")
	public ModelAndView selectIscoCdAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		if("addr".equals(conditionBean.getFlag())) {
			mv.addObject(ConstVal.RESULT_KEY, commonService.selectCommonLocCdList(conditionBean));
		}else if("isco".equals(conditionBean.getFlag())) {
			mv.addObject(ConstVal.RESULT_KEY, commonService.selectIscoCdList(conditionBean));
		}

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	/**
	 * 비밀번호 변경 화면
	 * pwd change form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/cpes/all/pwdChange", method = RequestMethod.POST)
	public ModelAndView pwdChange(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/common/pwdChange.left");
		return mv;

	}

    /**
     * 사용자 비밀번호 변경 처리
     * user pwd change process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/cpes/all/pwdChangeProcessAjax", method = RequestMethod.POST)
	public ModelAndView pwdChangeProcessAjax(Locale locale,
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
  		privtMemBean.setModUserSeq(userSeq);

  		PrivtMemBean param = privtMemService.selectPwd(privtMemBean);


  		if(StringUtils.equals(EncryptUtil.getSha512(privtMemBean.getCurPwd()), param.getUserPwd())) {//현재비밀번호와 디비에 있는 비밀번호가 같을를경우만  CURRENT PWD = ORG PWD EQUAL
  			privtMemBean.setNewPwd(EncryptUtil.getSha512(privtMemBean.getNewPwd()));
  			if(privtMemService.updatePwd(privtMemBean) > 0) {
      			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
	      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
  			} else {
    			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
	      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
  			}

  		} else {//현재비밀번호와 같지않음
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);

  		}



    	mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}

	/**
	 * 회원탈퇴신청
	 * pwd change form
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/cpes/all/withdrawal", method = RequestMethod.POST)
	public ModelAndView withdrawal(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("CondPrivtMemBean") CondPrivtMemBean condPrivtMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/withdrawal.left");


		condPrivtMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code


  		mv.addObject(ConstVal.USER_EMAIL_KEY, EncryptUtil.getAes256Dec(SessionUtil.getUserEmail(req)));

		return mv;

	}


    /**
     * 사용자 탈퇴 처리
     * user withdrawal process
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/cpes/all/withdrawalProcessAjax", method = RequestMethod.POST)
	public ModelAndView withdrawalProcessAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("PrivtMemBean") PrivtMemBean privtMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		privtMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		privtMemBean.setUserSeq(userSeq);
  		privtMemBean.setModUserSeq(userSeq);


  		PrivtMemBean param = privtMemService.selectPwd(privtMemBean);
  		if(!StringUtil.isEmpty(param)) {
	  		privtMemBean.setUserAuthCd(SessionUtil.getUserAuthCd(req));

	  		if(StringUtils.equals(EncryptUtil.getSha512(privtMemBean.getUserPwd()), param.getUserPwd())) {//현재비밀번호와 디비에 있는 비밀번호가 같을를경우만  CURRENT PWD = ORG PWD EQUAL

	  			if(privtMemService.deleteMember(privtMemBean) > 0) {
	      			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
		      		SecurityContextHolder.clearContext();
	  			} else {
	    			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
		      		ajaxResultBean.setStatCd(ConstVal.CODE_02_VAL);
	  			}

	  		} else {//현재비밀번호와 같지않음
	  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
	      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);

	  		}
  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
  		}



    	mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}

	/**
	 * 비밀번호 확인
	 * community wirte
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/cpes/all/pwdConfirmAjax", method = RequestMethod.POST)
	public ModelAndView pwdConfirmAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				@ModelAttribute("PrivtMemBean") PrivtMemBean privtMemBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {

		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		privtMemBean.setLangCd(locale.getLanguage().toUpperCase());//언어코드,lanuage code
		privtMemBean.setUserSeq(userSeq);
  		privtMemBean.setUserPwd(EncryptUtil.getSha512(privtMemBean.getUserPwd()));


  		if(privtMemService.selectPrivtMemberPwdChk(privtMemBean) < 1) {//비밀번호 확인
      		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_03_VAL);

  		} else {
  			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
      		ajaxResultBean.setMessage(StringUtil.randomStrNumber(7));
  		}




		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);

		return mv;
	}

	/**
	 * ckeditor 이미지 업로드
	 *
	 * 파일은 MultipartFile 타입의 upload 란 이름으로 ckeditor에서 넘어옴
	 *
	 * @param request
	 * @param response
	 * @param upload
	 */
	@RequestMapping(value = "/common/ckeditorImgUpload", method = RequestMethod.POST)
	public void ckeditorImgUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws IOException {
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        try{

        	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

            String fileName = upload.getOriginalFilename();
            String uploadPath = BaseConfig.getValue("ckeditorImgDir") + BaseConfig.getValue("SEPARATOR") + sdf.format(new Date());//저장경로

            // 폴더 생성
            File fDir = new File(uploadPath);

            if (!fDir.exists()) {
    			fDir.mkdirs();
    		}

            File destFile = new File(uploadPath, fileName);
            upload.transferTo(destFile);

            String callback = request.getParameter("CKEditorFuncNum");

            printWriter = response.getWriter();
            String fileUrl = uploadPath + BaseConfig.getValue("SEPARATOR") + fileName;

            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + "/common/imgLoading.do?url=" + fileUrl
                    + "','img upload complete.'"
                    + ")</script>");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            if (printWriter != null) {
			    printWriter.close();
			}
        }
	}

	/**
	 * 이미지 로딩 (화면 출력)
	 * @param request
	 * @param response
	 * @param url
	 * @throws IOException
	 */
	@RequestMapping(value = "/common/imgLoading", method = RequestMethod.GET)
	public void imgLoading(HttpServletRequest request, HttpServletResponse response, @RequestParam String url) throws IOException {

		if(!StringUtil.isEmpty(url)) {
			String ext = url.split("[.]")[1];

			BufferedOutputStream out = null;
			InputStream in = null;

			try {
				response.setContentType("image/" + ext);
				File file = new File(url);
				if(file.exists()){
					in = new FileInputStream(file);
					out = new BufferedOutputStream(response.getOutputStream());
					int len;
					byte[] buf = new byte[1024];
					while ((len = in.read(buf)) > 0) {
						out.write(buf, 0, len);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(out != null){ out.flush(); }
				if(out != null){ out.close(); }
				if(in != null){ in.close(); }
			}
		}
	}


	@RequestMapping("/cpes/compny/offer/vacancyListPopup")
	public ModelAndView vacancyListPopup(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("CondVacancyBean") CondVacancyBean condVacancyBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mv = new ModelAndView();

		// 현재 로그인한 유저의 개인 정보 조회
		conditionBean.setCondUserEmail(EncryptUtil.getAes256Enc(principal.getName()));//email or cell phone
		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
	  	MemberBean memberBean = commonService.selectMemberInfo(conditionBean);
	  	mv.addObject("memberBean", memberBean);

		condVacancyBean.setCondUserSeq(memberBean.getUserSeq());
		condVacancyBean.setCondOfferFlag("true");
		condVacancyBean.setCondVacancyStsCd(ConstVal.VACANCY_STS_CD_ONGOING);
		condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());

		int onGoingVacCnt = compnyVacancyService.selectVacancyListCnt(condVacancyBean);

		if(onGoingVacCnt > 0) {
			PaginationInfo paginationInfo = PageUtil.getPageInfo(1, onGoingVacCnt, onGoingVacCnt);

			condVacancyBean.setFirstIndex(paginationInfo.getFirstRecordIndex());
	      	condVacancyBean.setLastIndex(paginationInfo.getLastRecordIndex());
	      	condVacancyBean.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	      	condVacancyBean.setCondStatCd(ConstVal.VACANCY_SEARCH_COND_DEFAULT_VAL);

	      	mv.addObject(ConstVal.RESULT_LIST_KEY, compnyVacancyService.selectVacancyList(condVacancyBean));

		}
		mv.setViewName("common/commonOfferPopup.empty");
		return mv;
	}

	@RequestMapping("/cpes/compny/offer/commonOfferInsert")
	public ModelAndView commonOfferInsert(Locale locale, @ModelAttribute("OfferBean") OfferBean offerBean, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();
		// 현재 로그인한 유저의 개인 정보 조회

		String userSeq = SessionUtil.getUserSeq(req);
      	offerBean.setRegUserSeq(userSeq);
      	offerBean.setModUserSeq(userSeq);
      	offerBean.setLangCd(locale.getLanguage().toUpperCase());

      	int result = commonService.insertOffer(offerBean);

      	if(result > 0) {
      		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
      	}else {
      		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      	}

      	mv.addObject(ConstVal.RESULT_KEY, ajaxResultBean);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	/**
	 * 현재 진행중인 채용공고 갯수 조회
	 * @param conditionBean
	 * @param principal
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cpes/compny/offer/checkVacancyCnt")
	public ModelAndView checkVacancyCnt(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();


		String userSeq = SessionUtil.getUserSeq(req);
		CondVacancyBean condVacancyBean = new CondVacancyBean();
		condVacancyBean.setLangCd(locale.getLanguage().toUpperCase());
		condVacancyBean.setCondUserSeq(userSeq);
		condVacancyBean.setCondVacancyStsCd(ConstVal.VACANCY_STS_CD_ONGOING);
		condVacancyBean.setCondOfferFlag("true");
		int onGoingVacCnt = compnyVacancyService.selectVacancyListCnt(condVacancyBean);
		mv.addObject(ConstVal.RESULT_KEY, onGoingVacCnt);

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	@RequestMapping("/common/selectDext5upload")
	public ModelAndView selectDext5upload(@ModelAttribute("FileBean") FileBean fileBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		List<FileBean> fileList = commonService.selectAttachFilesList(fileBean);

		mv.addObject(ConstVal.RESULT_KEY, fileList);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}


    /**
     * iscedcd list
     * iscedcd list
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/common/iscedCdAjax", method = RequestMethod.POST)
	public ModelAndView iscedCdAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();
		conditionBean.setLangCd(locale.getLanguage().toUpperCase());

		try {
			mv.addObject(ConstVal.RESULT_LIST_KEY, commonService.selectIscedCdList(conditionBean));
			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		} catch(Exception e) {
      		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
		}


    	mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}


    /**
     * iscedcd list
     * iscedcd list
     * @param req
     * @param res
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/common/isicCdAjax", method = RequestMethod.POST)
	public ModelAndView isicCdAjax(Locale locale,
				@ModelAttribute("ConditionBean") ConditionBean conditionBean,
				Principal principal,
				HttpServletRequest req,
				HttpServletResponse res) throws Exception {
    	ModelAndView mv = new ModelAndView();
		AjaxResultBean ajaxResultBean = new AjaxResultBean();
		conditionBean.setLangCd(locale.getLanguage().toUpperCase());

		try {
			mv.addObject(ConstVal.RESULT_LIST_KEY, commonService.selectIsicCdList(conditionBean));
			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
      		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		} catch(Exception e) {
      		ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
      		ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
		}


    	mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
	  	mv.setViewName(ConstVal.JSON_VIEW_KEY);
	  	return mv;

	}

	 /**
	   * 북마크 일괄 삭제
	   * bookmark insert
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	 */
	@RequestMapping(value = "/cpes/all/bookMarkDeListAjax", method = RequestMethod.POST)
	public ModelAndView bookMarkDeListAjax(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			@ModelAttribute("BookMarkBean") BookMarkBean bookMarkBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		bookMarkBean.setUserSeq(userSeq);
		bookMarkBean.setRegUserSeq(userSeq);



		if(commonService.deleteBookMarkList(bookMarkBean) > 0 ) {
			ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
			ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);
		} else {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
		}



		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}


	@RequestMapping("/common/iscoCdListAjax")
	public ModelAndView iscoCdListAjax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		AjaxResultBean ajaxResultBean = new AjaxResultBean();
		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		mv.addObject(ConstVal.RESULT_LIST_KEY, commonService.selectIscoCdList(conditionBean));
		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	// only for dev...
	@RequestMapping("/pub")
	public String pub(HttpServletRequest req, HttpServletResponse res) throws Exception {
	  	return "pub.one";
	}

	@RequestMapping("/common/nextDepthCdSelect2Ajax")
	public ModelAndView nextDepthCdSelect2Ajax(Locale locale, @ModelAttribute("ConditionBean") ConditionBean conditionBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject(ConstVal.RESULT_KEY, commonService.select2CommonLocCdList(conditionBean));

		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}

	 /**
	   * 북마크 일괄 삭제
	   * bookmark insert
	   * @param req
	   * @param res
	   * @return ModelAndView
	   * @throws Exception
	 */
	@RequestMapping(value = "/cpes/all/common/videoIntvwViewAjax", method = RequestMethod.POST)
	public ModelAndView videoIntvwViewAjax(Locale locale,
			@ModelAttribute("ConditionBean") ConditionBean conditionBean,
			Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView();

		AjaxResultBean ajaxResultBean = new AjaxResultBean();

		String userSeq = SessionUtil.getUserSeq(req);
		conditionBean.setLangCd(locale.getLanguage().toUpperCase());
		conditionBean.setCondUserSeq(userSeq);

		ajaxResultBean.setSuccessYn(ConstVal.YES_VAL);
		ajaxResultBean.setStatCd(ConstVal.STAT_CD_SUCCESS_VAL);

		VideoIntvwPatcptnBean videoIntvwPatcptnBean = commonService.selectVideoIntvw(conditionBean);
		if(StringUtil.isEmpty(videoIntvwPatcptnBean)) {
			ajaxResultBean.setSuccessYn(ConstVal.NO_VAL);
			ajaxResultBean.setStatCd(ConstVal.CODE_01_VAL);
		} else {
			videoIntvwPatcptnBean.setUserCell(EncryptUtil.getAes256Dec(videoIntvwPatcptnBean.getUserCell()));
			mv.addObject(ConstVal.RESULT2_KEY, videoIntvwPatcptnBean);
		}

		mv.addObject(ConstVal.RESULT_KEY,ajaxResultBean);
		mv.setViewName(ConstVal.JSON_VIEW_KEY);
		return mv;
	}


}
