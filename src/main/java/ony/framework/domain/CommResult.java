package ony.framework.domain;

import org.apache.commons.lang.exception.ExceptionUtils;

import ony.framework.util.CommUtil;

/**
 * NCA Result Domain Class
 * 
 * @author Quehenr
 */
public class CommResult {

	public static String MODEL_KEY = "comm_result";

	private boolean result;
	private String resultStr;

	private static final String SUC_MSG = "성공적으로 수행 되었습니다.";
	private static final String FAIL_MSG = "에러가 발생 하였습니다.";

	public CommResult() {
		setResult(true);
	}

	public CommResult(boolean result) {
		setResult(result);
	}

	public static CommResult ok() {
		return ok(SUC_MSG);
	}

	public static CommResult ok(String msg) {
		CommResult cr = new CommResult();
		cr.setResult(true);
		cr.setResultStr(msg);
		return cr;
	}

	public static CommResult fail() {
		return fail(FAIL_MSG);
	}

	public static CommResult fail(Throwable t) {
		return fail(ExceptionUtils.getStackTrace(t));
	}

	public static CommResult fail(String msg) {
		CommResult cr = new CommResult();
		cr.setResult(false);
		cr.setResultStr(msg);

		return cr;
	}

	/**
	 * 생성자<br/>
	 * true/false 지정 및 결과 메세지도 같이 셋팅한다.
	 * 
	 * @param result true/false
	 * @param resultStr 결과 메세지
	 */
	public CommResult(boolean result, String resultStr) {
		setResult(result, resultStr);
	}

	/**
	 * toString
	 * 
	 * @return result 및 resultStr
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return CommUtil.objToString(this);
	}

	/**
	 * result = false<br>
	 * resultStr = Throwable 객체의 stactTrace를 String으로 변환
	 * 
	 * @param t
	 */
	public CommResult(Throwable t) {
		setResult(false, ExceptionUtils.getStackTrace(t));
	}

	/**
	 * result = false<br>
	 * resultStr = Exception 객체의 stactTrace를 String으로 변환
	 * 
	 * @param e
	 */
	public CommResult(Exception e) {
		setResult(false, ExceptionUtils.getStackTrace(e));
	}

	/**
	 * 성공, 실패 여부.
	 * 
	 * @return the result
	 */
	public boolean isResult() {
		return result;
	}

	/**
	 * result값 Set<br/>
	 * true/false에 해당하는 각 Message가 resultStr에 저장된다.
	 * 
	 * @param result the result to set
	 */
	public void setResult(boolean result) {
		this.result = result;
		if (this.result) {
			this.resultStr = SUC_MSG;
		} else {
			this.resultStr = FAIL_MSG;
		}
	}

	/**
	 * result값 및 resultStr을 셋팅한다.
	 * 
	 * @param result
	 * @param resultStr
	 */
	public void setResult(boolean result, String resultStr) {
		this.result = result;
		this.resultStr = CommUtil.isEmpty(resultStr) ? resultStr : resultStr.replaceAll("\r", "").replaceAll("\n", "");
	}

	/**
	 * result = false<br>
	 * resultStr = Throwable 객체의 stactTrace를 String으로 변환
	 * 
	 * @param t
	 */
	public void setResult(Throwable t) {
		setResult(false, ExceptionUtils.getStackTrace(t));
	}

	/**
	 * result = false<br>
	 * resultStr = Exception 객체의 stactTrace를 String으로 변환
	 * 
	 * @param e
	 */
	public void setResult(Exception e) {
		setResult(false, ExceptionUtils.getStackTrace(e));
	}

	/**
	 * resultStr Get
	 * 
	 * @return the resultStr
	 */
	public String getResultStr() {
		return resultStr;
	}

	/**
	 * resultStr Set
	 * 
	 * @param resultStr the resultStr to set
	 */
	public void setResultStr(String resultStr) {
		this.resultStr = resultStr;
	}
}
