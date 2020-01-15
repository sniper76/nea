package ony.framework;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;



public class ResponseData {
	/** 세션아이디를 보관한다. */
	private String	sessionId;
	/** 응답 코드 : 정상인 경우 0을 되돌린다. */
	private String	responseCode;
	/** 응답 메시지 : 정상인 경우 '정상적으로 처리되었습니다.'를 되돌린다. */
	private String	responseText;
	/** 시스템 오류인 경우 시스템 오류를 되돌린다. */
	private String	systemError;
	/** 응답 데이타. */
	private Object data;

	/**
	 * 세션아이디 getter
	 *
	 * @return 세션아이디
	 */
	public String getSessionId() {
		return sessionId;
	}

	/**
	 * 세션아이디 setter
	 *
	 * @param sessionId 세션아이디
	 */
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	/**
	 * 응답 코드 getter
	 *
	 * @return 응답 코드
	 */
	public String getResponseCode() {
		return responseCode;
	}

	/**
	 * 응답 코드 setter
	 *
	 * @param responseCode 응답 코드
	 */
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}

	/**
	 * 응답 메시지 getter
	 *
	 * @return 응답 메시지
	 */
	public String getResponseText() {
		return responseText;
	}

	/**
	 * 응답 메시지 setter
	 *
	 * @param responseText 응답 메시지
	 */
	public void setResponseText(String responseText) {
		this.responseText = responseText;
	}

	/**
	 * 시스템 오류 getter
	 *
	 * @return 시스템 오류
	 */
	public String getSystemError() {
		return systemError;
	}

	/**
	 * 시스템 오류 setter
	 *
	 * @param systemError 시스템 오류
	 */
	public void setSystemError(String systemError) {
		this.systemError = systemError;
	}

	/**
	 * 응답 데이터 getter
	 *
	 * @return 응답 데이터
	 */
	public Object getData() {
		return data;
	}

	/**
	 * 응답 데이터 setter
	 *
	 * @param data 응답 데이터
	 */
	public void setData(Object data) {
		this.data = data;
	}

	/**
	 * Bean 데이터를 문자열로 반환한다.
	 *
	 * @return Bean 데이터 문자열
	 */
	public String toString() {
		return ReflectionToStringBuilder.toString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
