package ony.framework.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import ony.cmm.common.bean.CommonBean;
import ony.cmm.common.bean.UserInfo;

/**
 * <pre class="doc_class">
 * yhLee
 * </pre>
 * 
 * @version 1.0
 * @author Administrator
 * @date 2018. 3. 19.
 */
public class SessionUtil {

	private SessionUtil() {
	}

	/**
	 * 세션에 로그인 정보를 넣는다.
	 * 
	 * @param request
	 * @param glm
	 */
	public static void sessionCreate(HttpServletRequest request, UserInfo sessionUser) {
		if (sessionUser != null && !CommUtil.isEmpty(sessionUser.getMberSeq()))
			request.getSession().setAttribute("sessionUser", sessionUser);
	}
	
	/**
	 * 관리자 로그인 여부
	 * 
	 * @param request
	 * @return
	 */
	public static boolean isLogin() {
		Object obj = getAttribute("sessionUser");
		
		if (obj == null) {
 
				return false;
		}

		return true;
	}
	
	/**
	 * 관리자 로그인 정보를 가져온다.
	 * 
	 * @param request
	 * @param glm
	 */
	public static UserInfo getUserSesson() {
		if (isLogin())
			return (UserInfo)getAttribute("sessionUser");
		else
			return null;
	}
	
	/**
	 * 세션정보에서 key에 해당하는 Object륿 반환한다.
	 * 
	 * @param String
	 * @param Object
	 */
	public static Object getAttribute(String key) {
		return RequestContextHolder.currentRequestAttributes().getAttribute(key, RequestAttributes.SCOPE_SESSION);
	}

	/**
	 * bean의 regId / updId에 현재 로그인한 관리자 아이디를 지정한다
	 * @param param
	 */
	public static void setLoginInfo(CommonBean param) {
		UserInfo loginInfo = getUserSesson();
		param.setRegUserSeq(loginInfo.getUsrId());
	}
	
	/**
	 * 세션 invalidate
	 * 
	 * @param request
	 */
	public static void sessionInvalite(HttpServletRequest request) {
		request.getSession().invalidate();
	}
}