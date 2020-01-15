package ony.cmm.common.bean;





/**
 * bean 공통정보를 담는 bean
 *
 * @author 우성택
 * @version 1.0
 * @since 2019.01.02
 */
public class AjaxResultBean {
	private String statCd;
	private String successYn;
	private String message;

	// 리턴 받을 값이 있는경우 사용
	private String returnVal;

	public String getReturnVal() {
		return returnVal;
	}
	public void setReturnVal(String returnVal) {
		this.returnVal = returnVal;
	}
	public String getStatCd() {
		return statCd;
	}
	public void setStatCd(String statCd) {
		this.statCd = statCd;
	}
	public String getSuccessYn() {
		return successYn;
	}
	public void setSuccessYn(String successYn) {
		this.successYn = successYn;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

}
