package ony.cpes.external.login.bean;

import java.util.List;

import ony.cmm.common.bean.CommonBean;

/**
 * LOGIN CONDITION bean
 * @author kwon
 * @since
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일           수정자     수정내용
 *  ------------- -------- ---------------------------
 *  2019.10.17 KWON
 *
 * </pre>
 */
public class LoginBean extends CommonBean{

	private static final long serialVersionUID = 4979179976898050104L;

	private String newPwd = "";//new password
	private String curPwd = "";//current password
	private String mngId = "";
	private String successYn = "";
	private String statCd = "";
	private String userPwd = "";
	private String userEmail = "";
	private String userSeq = "";
	private String userCell = "";
	private String stopDiv = "";
	private String certify = "";
	private String userAuthCd = "";
	private String regNum = "";
	private String mngerNm = "";
	private String userNm = "";
	private String userNmKh = "";

	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String getCurPwd() {
		return curPwd;
	}
	public void setCurPwd(String curPwd) {
		this.curPwd = curPwd;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getSuccessYn() {
		return successYn;
	}
	public void setSuccessYn(String successYn) {
		this.successYn = successYn;
	}
	public String getStatCd() {
		return statCd;
	}
	public void setStatCd(String statCd) {
		this.statCd = statCd;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserCell() {
		return userCell;
	}
	public void setUserCell(String userCell) {
		this.userCell = userCell;
	}
	public String getStopDiv() {
		return stopDiv;
	}
	public void setStopDiv(String stopDiv) {
		this.stopDiv = stopDiv;
	}
	public String getCertify() {
		return certify;
	}
	public void setCertify(String certify) {
		this.certify = certify;
	}
	public String getUserAuthCd() {
		return userAuthCd;
	}
	public void setUserAuthCd(String userAuthCd) {
		this.userAuthCd = userAuthCd;
	}
	public String getRegNum() {
		return regNum;
	}
	public void setRegNum(String regNum) {
		this.regNum = regNum;
	}
	public String getMngerNm() {
		return mngerNm;
	}
	public void setMngerNm(String mngerNm) {
		this.mngerNm = mngerNm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserNmKh() {
		return userNmKh;
	}
	public void setUserNmKh(String userNmKh) {
		this.userNmKh = userNmKh;
	}


}
