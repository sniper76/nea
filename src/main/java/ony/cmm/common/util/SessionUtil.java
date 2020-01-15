package ony.cmm.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ony.cmm.common.ConstVal;
import ony.cpes.external.user.bean.UserBean;
import ony.framework.util.Encryption;
import ony.framework.util.StringUtil;

public class SessionUtil {

	public static  UserBean getUserBean(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserBean userBean = (UserBean)session.getAttribute(ConstVal.CPES_SESSION_KEY);
		return userBean;
	}

	public static String getUserSeq(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserBean userBean = (UserBean)session.getAttribute(ConstVal.CPES_SESSION_KEY);
		if(StringUtil.isEmpty(userBean)) {
			return "";
		} else {
			return userBean.getUserSeq();
		}
	}

	public static String getUserAuthCd(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserBean userBean = (UserBean)session.getAttribute(ConstVal.CPES_SESSION_KEY);
		if(StringUtil.isEmpty(userBean)) {
			return "";
		} else {
			return userBean.getUserAuthCd();
		}
	}


	public static String getUserEmail(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserBean userBean = (UserBean)session.getAttribute(ConstVal.CPES_SESSION_KEY);
		if(StringUtil.isEmpty(userBean)) {
			return "";
		} else {
			return userBean.getUserEmail();
		}
	}


	public static String getJcCd(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserBean userBean = (UserBean)session.getAttribute(ConstVal.CPES_SESSION_KEY);
		if(StringUtil.isEmpty(userBean)) {
			return "";
		} else {
			return userBean.getJcCd();
		}
	}

	public static String getUserAuthNm(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserBean userBean = (UserBean)session.getAttribute(ConstVal.CPES_SESSION_KEY);
		if(StringUtil.isEmpty(userBean)) {
			return "";
		} else {
			return userBean.getUserAuthNm();
		}
	}

	public static String getJcNm(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserBean userBean = (UserBean)session.getAttribute(ConstVal.CPES_SESSION_KEY);
		if(StringUtil.isEmpty(userBean)) {
			return "";
		} else {
			return userBean.getJcNm();
		}
	}

	public static String getJcTel(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserBean userBean = (UserBean)session.getAttribute(ConstVal.CPES_SESSION_KEY);
		if(StringUtil.isEmpty(userBean)) {
			return "";
		} else {
			return userBean.getJcTel();
		}
	}

}
