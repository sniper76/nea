package ony.framework;

import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



/**
 *
 * @author Sung-Gyum, Kim(elka2001@nate.com)
 *
 */




public class BaseController {



	/**
	 * 클라이언트에서 전송한 Request에서 파라미터를 구한다.
	 *
	 * @param request HttpServletRequest
	 * @param name 파라미터명
	 * @return 파라미터값
	 */
	public String getParam(HttpServletRequest request, String name) {
		return request.getParameter(name);
	}

	/**
	 * 클라이언트에서 전송한 Request에서 파라미터를 구한다.<br/>
	 * 파라미터값이 없는 경우 defaultValue 값을 반환한다.
	 *
	 * @param request HttpServletRequest
	 * @param name 파라미터명
	 * @param defaultValue 파라미터값이 없는 경우 반환할 default 값
	 * @return 파라미터값
	 */
	public String getParam(HttpServletRequest request, String name, String defaultValue) {
		String	value	= request.getParameter(name);

		if ((null == value) || (0 == value.length())) {
			value	= defaultValue;
		}

		return value;
	}

	/**
	 * 클라이언트가 접속한 IP 값을 반환한다.
	 *
	 * @param request the request
	 * @return remote ip 주소
	 */
	public String getRemoteAddr(HttpServletRequest request) {
		this.debug("==========> Access IP 1 : " + request.getHeader("X-FORWARDED-FOR"));
		this.debug("==========> Access IP 2 : " + request.getRemoteAddr());

		String	ip	= request.getHeader("X-FORWARDED-FOR");

		if ((null == ip) || "".equals(ip) || "0:0:0:0:0:0:0:1".equals(ip)) {
			ip	= request.getRemoteAddr();
		}

		return ip;
	}

	/**
	 * 클라이언트에서 전송한 Request의 Body(JSON 문자열)를 구한다.
	 *
	 * @param request HttpServletRequest
	 * @return 클라이언트에서 전송한 Requeet의 Body
	 */
	public String getRequestBody(HttpServletRequest request) {
		return request.getParameter("_REQ_JSON_OBJECT_");
	}

	/**
	 * JSON 문자열을 객체로 변환
	 * <pre>
	 * Example:
	 *     Single single = (Single)this.getObjectFromJSON(request, Single.class);
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param beanClass 변환할 객체의 타입
	 * @return 변환한 객체
	 */
	public Object getObjectFromJSON(HttpServletRequest request, Class<?> beanClass) {
		return JSONObject.toBean(JSONObject.fromObject(getRequestBody(request)), beanClass);
	}

	/**
	 * JSON 문자열을 객체로 변환 (List 형태의 입력을 받을 경우 List 의 객체 정보를 classMap 으로 넘겨준다)
	 * <pre>
	 * Example:
	 *     Map classMap = new HashMap();
	 *     classMap.put("children", Children.class);
	 *     Single single = (Single)this.getObjectFromJSON(request, Single.class, classMap);
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param beanClass 변환할 객체의 타입
	 * @param classMap List 객체 정보
	 * @return 변환한 객체
	 */
	public Object getObjectFromJSON(HttpServletRequest request, Class<?> beanClass, Map<?, ?> classMap) {
		return JSONObject.toBean(JSONObject.fromObject(getRequestBody(request)), beanClass, classMap);
	}

	/**
	 * JSON 문자열을 Object의 Array로 변환
	 * <pre>
	 * Example:
	 *     BoardItem[] boardItems = (BoardItem[])this.getArrayFromJSON(request, BoardItem.class);
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param beanClass 변환할 객체의 타입
	 * @return 변환한 객체의 배열
	 */
	public Object[] getArrayFromJSON(HttpServletRequest request, Class<?> beanClass) {
		return (Object[])JSONArray.toArray(JSONArray.fromObject(getRequestBody(request)), beanClass);
	}

	/**
	 * JSON 문자열을 Object의 Array로 변환 (List 형태의 입력을 받을 경우 List 의 객체 정보를 classMap 으로 넘겨준다)
	 * <pre>
	 * Example:
     *     Map classMap = new HashMap();
     *     classMap.put("children", Children.class);
     *     Single[] singles = (Single[])getArrayFromJSON(request, Single.class, classMap);
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param beanClass 변환할 객체의 타입
	 * @param classMap List 객체 정보
	 * @return 변환한 객체의 배열
	 */
	public Object[] getArrayFromJSON(HttpServletRequest request, Class<?> beanClass, Map<?, ?> classMap) {
		return (Object[])JSONArray.toArray(JSONArray.fromObject(getRequestBody(request)), beanClass, classMap);
	}

	/**
	 * JSON 문자열을 Object의 List로 변환
	 * <pre>
	 * Example:
	 *     List single = this.getListFromJSON(request, Single.class);
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param beanClass 변환할 객체의 타입
	 * @return 변환한 객체 목록
	 */
	public Object getListFromJSON(HttpServletRequest request, Class<?> beanClass) {
		return Arrays.asList(this.getArrayFromJSON(request, beanClass));
	}

	/**
	 * JSON 문자열을 Object의 List로 변환 (List 형태의 입력을 받을 경우 List 의 객체 정보를 classMap 으로 넘겨준다)
	 * <pre>
	 * Example:
     *     Map classMap = new HashMap();
     *     classMap.put("children", Children.class);
     *     List singles = (Single[])getArrayFromJSON(request, Single.class, classMap);
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param beanClass 변환할 객체의 타입
	 * @param classMap List 객체 정보
	 * @return 변환한 객체의 배열
	 */
	public Object getListFromJSON(HttpServletRequest request, Class<?> beanClass, Map<?, ?> classMap) {
		return Arrays.asList(this.getArrayFromJSON(request, beanClass, classMap));
	}

	/**
	 * 목록형태의 JSON String을 컬렉션 형태의 데이터로 반환한다. (beanClaass) 로 넘기는 형태로 데이터를 반환한다.
	 *
	 * @param request HttpServletRequest
	 * @param beanClass 변환할 객체의 타입
	 * @return 변환한 객체의 컬렉션
	 */
	public Object getCollectionFromJSON(HttpServletRequest request, Class<?> beanClass) {
		return JSONArray.toCollection(JSONArray.fromObject(getRequestBody(request)), beanClass);
	}

	/**
	 * UTF-8 데이터를 웹응답으로 내보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 */
	public void outputToClient(HttpServletResponse response, String data) {
		ResponseHelper.outputToClient(response, data);
	}

	/**
	 * 데이터를 웹응답으로 내보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 * @param charset 문자셋
	 */
	public void outputToClient(HttpServletResponse response, String data, String charset) {
		ResponseHelper.outputToClient(response, data, charset);
	}

	/**
	 * 데이터를 웹응답으로 내보낸다
	 *
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 */
	public void outputToClientHtml(HttpServletResponse response, String data) {
		ResponseHelper.outputToClientHtml(response, data, BaseConstant.DEFAULT_ENCODING);
    }

	/**
	 * 데이터를 웹응답으로 내보낸다
	 *
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 * @param charset 문자셋
	 */
	public void outputToClientHtml(HttpServletResponse response, String data, String charset) {
		ResponseHelper.outputToClientHtml(response, data, charset);
    }

	/**
	 * UTF-8 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.<br/>
	 * ResponseData 를 사용하지 않고 순수 data 만 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 */
	public void outputJSONData(HttpServletRequest request, HttpServletResponse response, Object data) {
		ResponseHelper.outputJSONData(request, response, data);
	}

	/**
	 * 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.<br/>
	 * ResponseData 를 사용하지 않고 순수 data 만 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 * @param charset 문자셋
	 */
	public void outputJSONData(HttpServletRequest request, HttpServletResponse response, Object data, String charset) {
		ResponseHelper.outputJSONData(request, response, data, charset);
	}

	/**
	 * UTF-8 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 */
	public void outputJSON(HttpServletRequest request, HttpServletResponse response, Object data) {
		ResponseHelper.outputJSON(request, response, data);
	}
	
	/**
	 * UTF-8 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param resultCode 결과 코드
	 * @param resultMsg 결과 메시지
	 */
	public void outputJSON(HttpServletRequest request, HttpServletResponse response, String resultCode, String resultMsg) {
		ResponseHelper.outputJSON(request, response, resultCode, resultMsg);
	}

	/**
	 * 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 * @param charset 문자셋
	 */
	public void outputJSON(HttpServletRequest request, HttpServletResponse response, Object data, String charset) {
		ResponseHelper.outputJSON(request, response, data, charset);
	}

	/**
	 * 오류 발생시 UTF-8 JSON으로 변환하여 웹응답으로 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param errCode 에러 코드
	 * @param errMsg 에러 메시지
	 * @param t 오류 객체
	 */
	public void outputJSON(HttpServletRequest request, HttpServletResponse response, String errCode, String errMsg,
			Throwable t) {
		ResponseHelper.outputJSON(request, response, errCode, errMsg, t);
	}

	/**
	 * 오류 발생시 JSON으로 변환하여 웹응답으로 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param errCode 에러 코드
	 * @param errMsg 에러 메시지
	 * @param t 오류 객체
	 * @param charset 문자셋
	 */
	public void outputJSON(HttpServletRequest request, HttpServletResponse response, String errCode, String errMsg,
			Throwable t, String charset) {
		ResponseHelper.outputJSON(request, response, errCode, errMsg, t, charset);
	}

	/**
	 * 배열 혹은 리스트를 JSON Array 로 변환하여 웹응답으로 보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param arrayOrList 응답 데이터
	 */
	public void outputJSONArray(HttpServletResponse response, Object arrayOrList) {
		ResponseHelper.outputJSONArray(response, arrayOrList);
	}

	/**
	 * 배열 혹은 리스트를 JSON Array 로 변환하여 웹응답으로 보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param arrayOrList 응답 데이터
	 * @param charset 문자셋
	 */
	public void outputJSONArray(HttpServletResponse response, Object arrayOrList,
			String charset) {
		ResponseHelper.outputJSONArray(response, arrayOrList, charset);
	}

	/**
	 * UTF-8 응답데이타를 JSON으로 변환하여 웹응답으로 보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param jsonData 응답 데이타 객체
	 */
	public void outputJSONRaw(HttpServletResponse response, String jsonData) {
		ResponseHelper.outputJSONRaw(response, jsonData);
	}

	/**
	 * 응답데이타를 JSON으로 변환하여 웹응답으로 보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param jsonData 응답 데이타 객체
	 * @param charset 문자셋
	 */
	public static void outputJSONRaw(HttpServletResponse response, String jsonData,
			String charset) {
		ResponseHelper.outputJSONRaw(response, jsonData, charset);
	}


	/**
	 * UTF-8 XML 문자열을 웹응답으로 보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param xml 응답 XMLS 문자열
	 */
	public void outputXMLFromString(HttpServletResponse response, String xml) {
		ResponseHelper.outputXMLFromString(response, xml);
	}

	/**
	 * XML 문자열을 웹응답으로 보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param xml 응답 XMLS 문자열
	 * @param charset 문자셋
	 */
	public void outputXMLFromString(HttpServletResponse response, String xml, String charset) {
		ResponseHelper.outputXMLFromString(response, xml, charset);
    }

	/**
	 * Logging Error.
	 *
	 * @param obj 출력에 사용할 객체(Object)
	 * @param msg 출력할 메시지(String)
	 */
	public static void error(Object obj, String msg) {
		LogHelper.error(obj, msg);
	}

	/**
	 * Logging Fatal.
	 *
	 * @param obj 출력에 사용할 객체(Object)
	 * @param msg 출력할 메시지(String)
	 */
	public static void fatal(Object obj, String msg) {
		LogHelper.fatal(obj, msg);
	}

	/**
	 * Logging Info.
	 *
	 * @param obj 출력에 사용할 객체(Object)
	 * @param msg 출력할 메시지(String)
	 */
	public static void info(Object obj, String msg) {
		LogHelper.info(obj, msg);
	}

	/**
	 * Logging Debug.
	 *
	 * @param obj 출력에 사용할 객체(Object)
	 * @param msg 출력할 메시지(String)
	 */
	public static void debug(Object obj, String msg) {
		LogHelper.debug(obj, msg);
	}

	/**
	 * Logging Error.
	 *
	 * @param cls 출력에 사용할 클래스(Class)
	 * @param msg 출력할 메시지(String)
	 */
	public static void error(Class<?> cls, String msg) {
		LogHelper.error(cls, msg);
	}

	/**
	 * Logging Fatal.
	 *
	 * @param cls 출력에 사용할 클래스(Class)
	 * @param msg 출력할 메시지(String)
	 */
	public static void fatal(Class<?> cls, String msg) {
		LogHelper.fatal(cls, msg);
	}

	/**
	 * Logging Info.
	 *
	 * @param cls 출력에 사용할 클래스(Class)
	 * @param msg 출력할 메시지(String)
	 */
	public static void info(Class<?> cls, String msg) {
		LogHelper.info(cls, msg);
	}

	/**
	 * Logging Debug.
	 *
	 * @param cls 출력에 사용할 클래스(Class)
	 * @param msg 출력할 메시지(String)
	 */
	public static void debug(Class<?> cls, String msg) {
		LogHelper.debug(cls, msg);
	}

	/**
	 * Logging Error (현재 오브젝트).
	 *
	 * @param msg 출력할 메시지(String)
	 */
	public void error(String msg) {
		LogHelper.error(this, msg);
	}

	/**
	 * Logging Fatal (현재 오브젝트).
	 *
	 * @param msg 출력할 메시지(String)
	 */
	public void fatal(String msg) {
		LogHelper.fatal(this, msg);
	}

	/**
	 * Logging Info. (현재 오브젝트)
	 *
	 * @param msg 출력할 메시지(String)
	 */
	public void info(String msg) {
		LogHelper.info(this, msg);
	}

	/**
	 * Logging Debug (현재 오브젝트).
	 *
	 * @param msg 출력할 메시지(String)
	 */
	public void debug(String msg) {
		LogHelper.debug(this, msg);
	}


}
