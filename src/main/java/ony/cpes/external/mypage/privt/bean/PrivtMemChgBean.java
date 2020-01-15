package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class PrivtMemChgBean extends CommonBean{
	private String agreeRejectReason;//승인_거부_사유
	private String chgAgreeStsCd;//변경_승인_상태_코드
	private String chgAgreeStsNm;
	private String chgNextCd;//변경_이후_코드(USER_AUTH_CD)
	private String chgPrevCd;//변경_이전_코드(USER_AUTH_CD)
	private String chgReason;//변경_사유
	private String jcCd;//JOB_CENTER_코드(JC_CD)
	private String jcUserSeq;//JOB_CENTER_사용자_시퀀스
	private String stsChgDt;//상태_변경_날짜
	private String userChgSeq;//회원_변경_시퀀스
	private String userSeq;//사용자_시퀀스
	public String getAgreeRejectReason() {
		return agreeRejectReason;
	}
	public void setAgreeRejectReason(String agreeRejectReason) {
		this.agreeRejectReason = agreeRejectReason;
	}
	public String getChgAgreeStsCd() {
		return chgAgreeStsCd;
	}
	public void setChgAgreeStsCd(String chgAgreeStsCd) {
		this.chgAgreeStsCd = chgAgreeStsCd;
	}
	public String getChgAgreeStsNm() {
		return chgAgreeStsNm;
	}
	public void setChgAgreeStsNm(String chgAgreeStsNm) {
		this.chgAgreeStsNm = chgAgreeStsNm;
	}
	public String getChgNextCd() {
		return chgNextCd;
	}
	public void setChgNextCd(String chgNextCd) {
		this.chgNextCd = chgNextCd;
	}
	public String getChgPrevCd() {
		return chgPrevCd;
	}
	public void setChgPrevCd(String chgPrevCd) {
		this.chgPrevCd = chgPrevCd;
	}
	public String getChgReason() {
		return chgReason;
	}
	public void setChgReason(String chgReason) {
		this.chgReason = chgReason;
	}
	public String getJcCd() {
		return jcCd;
	}
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	public String getJcUserSeq() {
		return jcUserSeq;
	}
	public void setJcUserSeq(String jcUserSeq) {
		this.jcUserSeq = jcUserSeq;
	}
	public String getStsChgDt() {
		return stsChgDt;
	}
	public void setStsChgDt(String stsChgDt) {
		this.stsChgDt = stsChgDt;
	}
	public String getUserChgSeq() {
		return userChgSeq;
	}
	public void setUserChgSeq(String userChgSeq) {
		this.userChgSeq = userChgSeq;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}



}
