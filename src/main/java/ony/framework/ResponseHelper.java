
package ony.framework;

import java.io.ByteArrayOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;



import ony.framework.BaseConstant;



public class ResponseHelper {


	/**
	 * UTF-8 데이터를 웹응답으로 내보낸다
	 *
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 */
	public static void outputToClient(HttpServletResponse response, String data) {
		outputToClient(response, data, BaseConstant.DEFAULT_ENCODING);
	}

	/**
	 * 데이터를 웹응답으로 내보낸다
	 *
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 * @param charset 문자셋
	 */
	public static void outputToClient(HttpServletResponse response, String data, String charset) {
		response.setCharacterEncoding(charset);

		if (response.containsHeader("IESupportJsonHack")) {
			//IE 오작동으로 인한 임시변경
			response.setContentType("text/html; charset=" + charset);
			//response.setContentType("text/plain : charset=" + charset);
			response.resetBuffer();
		}

		PrintWriter	out	= null;

		try {
			out	= new PrintWriter(new OutputStreamWriter(response.getOutputStream(), charset), true);
			out.print(data);
			out.flush();
		} catch (Exception e) {
			response.setStatus(500);	// Internal server error
			e.printStackTrace(System.out);
		} finally {
			if (null != out) {
				out.close();
			}
        }
    }

	/**
	 * 데이터를 웹응답으로 내보낸다
	 *
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 */
	public static void outputToClientHtml(HttpServletResponse response, String data) {
		outputToClientHtml(response, data, BaseConstant.DEFAULT_ENCODING);
    }

	/**
	 * 데이터를 웹응답으로 내보낸다
	 *
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 * @param charset 문자셋
	 */
	public static void outputToClientHtml(HttpServletResponse response, String data, String charset) {
		response.setCharacterEncoding(charset);

		PrintWriter	out	= null;

		try {
			response.setContentType("text/html");

			out	= new PrintWriter(new OutputStreamWriter(response.getOutputStream(), charset), true);
			out.print(data);
			out.flush();
		} catch (Exception e) {
			response.setStatus(500);	// Internal server error
			e.printStackTrace(System.out);
		} finally {
			if (null != out) {
				out.close();
			}
        }
    }

	/**
	 * UTF-8 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.<br/>
	 * ResponseData 를 사용하지 않고 순수 data 만 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 */
	public static void outputJSONData(HttpServletRequest request, HttpServletResponse response, Object data) {
		outputJSONData(request, response, data, BaseConstant.DEFAULT_ENCODING);
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
	public static void outputJSONData(HttpServletRequest request, HttpServletResponse response,
			Object data, String charset) {
		response.setContentType("application/json; charset=" + charset);

		// JsonConfig 설정(Java Date 타입을 yyyy.MM.dd HH:mm:ss 형태로 변환한다.)
		JsonValueProcessor	beanProcessor	= new JavaUtilDateJsonValueProcessor();
		JsonConfig			jsonConfig		= new JsonConfig();

		jsonConfig.registerJsonValueProcessor(java.util.Date.class, beanProcessor);

		String	jsonData	= JSONObject.fromObject(data, jsonConfig).toString();

		outputToClient(response, jsonData);
    }

	/**
	 * UTF-8 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 */
	public static void outputJSON(HttpServletRequest request, HttpServletResponse response, Object data) {
		outputJSON(request, response, data, BaseConstant.DEFAULT_ENCODING);
	}
	
	/**
	 * UTF-8 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param resultCode 결과 코드
	 * @param resultMsg 결과 메시지
	 */
	public static void outputJSON(HttpServletRequest request, HttpServletResponse response, String resultCode, String resultMsg) {
		outputJSON(request, response, resultCode, resultMsg, BaseConstant.DEFAULT_ENCODING);
	}

	/**
	 * 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param data 내보낼 응답 데이터
	 * @param charset 문자셋
	 */
	public static void outputJSON(HttpServletRequest request, HttpServletResponse response,
			Object data, String charset) {
		response.setContentType("application/json; charset=" + charset);

		ResponseData	resData	= new ResponseData();

		resData.setSessionId(request.getSession().getId());

		if (data instanceof Object[] || data instanceof java.util.List) {
			resData.setData(getJSONArrayString(data));
		} else {
			resData.setData(data);
		}

		resData.setResponseCode(BaseConstant.SUCCESS_CD);
		resData.setResponseText(BaseConstant.SUCCESS_NM);

		// JsonConfig 설정(Java Date 타입을 yyyy.MM.dd HH:mm:ss 형태로 변환한다.)
		JsonValueProcessor	beanProcessor	= new JavaUtilDateJsonValueProcessor();
		JsonConfig			jsonConfig		= new JsonConfig();

		jsonConfig.registerJsonValueProcessor(java.util.Date.class, beanProcessor);

		String	jsonData	= JSONObject.fromObject(resData, jsonConfig).toString();
		outputToClient(response, jsonData);
    }
	
	/**
	 * 데이터를 JSON으로 변환하여 웹응답으로 내보낸다.
	 *
	 * @param request the request
	 * @param response HttpServletResponse
	 * @param resultCode 결과 코드
	 * @param resultMsg 결과 메시지
	 */
	public static void outputJSON(HttpServletRequest request, HttpServletResponse response,
			String resultCode, String resultMsg,   String charset) {
		response.setContentType("application/json; charset=" + charset);

		ResponseData	resData	= new ResponseData();

		resData.setSessionId(request.getSession().getId());

		resData.setResponseCode(resultCode);
		resData.setResponseText(resultMsg);

		// JsonConfig 설정(Java Date 타입을 yyyy.MM.dd HH:mm:ss 형태로 변환한다.)
		JsonValueProcessor	beanProcessor	= new JavaUtilDateJsonValueProcessor();
		JsonConfig			jsonConfig		= new JsonConfig();

		jsonConfig.registerJsonValueProcessor(java.util.Date.class, beanProcessor);

		String	jsonData	= JSONObject.fromObject(resData, jsonConfig).toString();
		outputToClient(response, jsonData);
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
	public static void outputJSON(HttpServletRequest request, HttpServletResponse response,
			String errCode, String errMsg, Throwable t) {
		outputJSON(request, response, errCode, errMsg, t, BaseConstant.DEFAULT_ENCODING);
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
	public static void outputJSON(HttpServletRequest request, HttpServletResponse response,
			String errCode, String errMsg, Throwable t, String charset) {
		response.setContentType("application/json; charset=" + charset);

		ResponseData	resData	= new ResponseData();

		resData.setSessionId(request.getSession().getId());
		resData.setResponseCode(errCode);
		resData.setResponseText(errMsg);

		ByteArrayOutputStream	bos	= new ByteArrayOutputStream();
		PrintStream				ps	= new PrintStream(bos);

		t.printStackTrace(ps);
		resData.setSystemError(bos.toString());

		// JsonConfig 설정(Java Date 타입을 yyyy.MM.dd HH:mm:ss 형태로 변환한다.)
		JsonValueProcessor	beanProcessor	= new JavaUtilDateJsonValueProcessor();
		JsonConfig			jsonConfig		= new JsonConfig();

		jsonConfig.registerJsonValueProcessor(java.util.Date.class, beanProcessor);

		String	jsonData	= JSONObject.fromObject(resData, jsonConfig).toString();

		outputToClient(response, jsonData);
	}

	/**
	 * 배열 혹은 리스트를 JSON Array 로 변환하여 웹응답으로 보낸다
	 *
	 * @param response HttpServletResponse
	 * @param arrayOrList 응답 데이터
	 */
	public static void outputJSONArray(HttpServletResponse response, Object arrayOrList) {
		outputJSONArray(response, JSONArray.fromObject(arrayOrList).toString(),
				BaseConstant.DEFAULT_ENCODING);
	}

	/**
	 * 배열 혹은 리스트를 JSON Array 로 변환하여 웹응답으로 보낸다
	 *
	 * @param response HttpServletResponse
	 * @param arrayOrList 응답 데이터
	 * @param charset 문자셋
	 */
	public static void outputJSONArray(HttpServletResponse response, Object arrayOrList,
			String charset) {
		outputJSONRaw(response, getJSONArrayString(arrayOrList), charset);
	}

	/**
	 * UTF-8 응답데이타를 JSON으로 변환하여 웹응답으로 보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param jsonData 응답 데이타 객체
	 */
	public static void outputJSONRaw(HttpServletResponse response, String jsonData) {
		outputJSONRaw(response, jsonData, BaseConstant.DEFAULT_ENCODING);
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
		response.setContentType("application/json; charset=" + charset);
		outputToClient(response, jsonData, charset);
	}





	/**
	 * UTF-8 XML 문자열을 웹응답으로 보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param xml 응답 XMLS 문자열
	 */
	public static void outputXMLFromString(HttpServletResponse response, String xml) {
		outputXMLFromString(response, xml, BaseConstant.DEFAULT_ENCODING);
	}

	/**
	 * XML 문자열을 웹응답으로 보낸다.
	 *
	 * @param response HttpServletResponse
	 * @param xml 응답 XMLS 문자열
	 * @param charset 문자셋
	 */
	public static void outputXMLFromString(HttpServletResponse response, String xml,
			String charset) {
		response.setContentType("text/xml; charset=" + charset);
		outputToClient(response, xml);
    }

	/**
	 * Array Data 를 JSON 문자열로 변환
	 *
	 * @param data 객체 배열
	 * @return 변환된 JSON 문자열
	 */
	private static String getJSONArrayString(Object data) {
		JsonValueProcessor	beanProcessor	= new JavaUtilDateJsonValueProcessor();
		JsonConfig			jsonConfig		= new JsonConfig();

		jsonConfig.registerJsonValueProcessor(java.util.Date.class, beanProcessor);

		return JSONArray.fromObject(data, jsonConfig).toString();
	}
}
