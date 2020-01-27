package ony.cmm.common.bean;

/**
 * bean 공통정보를 담는 bean
 *
 * @author 우성택
 * @version 1.0
 * @since 2019.01.02
 */
public class SmsBean extends CommonBean{

	private String smsLogSeq	= "";	
	/* send parameters */
	private String smsUsername 	= "";
	private String smsPassword 	= "";
	private String smsFrom			= "";
	private String smsTo			= "";
	private String smsText			= "";
	
	/*receive parameters*/
	private String smsStatus		= "";
	private String smsMsgid		= "";
	private String smsErrMsg		= "";
	private String smsSendDt		= "";
	private String smsReceiveDt	= "";
	public String getSmsLogSeq() {
		return smsLogSeq;
	}
	public void setSmsLogSeq(String smsLogSeq) {
		this.smsLogSeq = smsLogSeq;
	}
	public String getSmsUsername() {
		return smsUsername;
	}
	public void setSmsUsername(String smsUsername) {
		this.smsUsername = smsUsername;
	}
	public String getSmsPassword() {
		return smsPassword;
	}
	public void setSmsPassword(String smsPassword) {
		this.smsPassword = smsPassword;
	}
	public String getSmsFrom() {
		return smsFrom;
	}
	public void setSmsFrom(String smsFrom) {
		this.smsFrom = smsFrom;
	}
	public String getSmsTo() {
		return smsTo;
	}
	public void setSmsTo(String smsTo) {
		this.smsTo = smsTo;
	}
	public String getSmsText() {
		return smsText;
	}
	public void setSmsText(String smsText) {
		this.smsText = smsText;
	}
	public String getSmsStatus() {
		return smsStatus;
	}
	public void setSmsStatus(String smsStatus) {
		this.smsStatus = smsStatus;
	}
	public String getSmsMsgid() {
		return smsMsgid;
	}
	public void setSmsMsgid(String smsMsgid) {
		this.smsMsgid = smsMsgid;
	}
	public String getSmsErrMsg() {
		return smsErrMsg;
	}
	public void setSmsErrMsg(String smsErrMsg) {
		this.smsErrMsg = smsErrMsg;
	}
	public String getSmsSendDt() {
		return smsSendDt;
	}
	public void setSmsSendDt(String smsSendDt) {
		this.smsSendDt = smsSendDt;
	}
	public String getSmsReceiveDt() {
		return smsReceiveDt;
	}
	public void setSmsReceiveDt(String smsReceiveDt) {
		this.smsReceiveDt = smsReceiveDt;
	}
	
	
		
}
