package ony.cpes.external.mypage.instt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class EduTrnngHistBean extends CommonBean {
	private String eduProgramId;//교육_프로그램_ID
	private String insttSeq;//기관_시퀀스
	private String insttTrnngHistSeq;//기관_훈련_이력_시퀀스
	private String trnngDt;//훈련_날짜
	private String trnngNm;//훈련_명
	private String userSeq;//훈련_명

	public String getEduProgramId() {
		return eduProgramId;
	}
	public void setEduProgramId(String eduProgramId) {
		this.eduProgramId = eduProgramId;
	}
	public String getInsttSeq() {
		return insttSeq;
	}
	public void setInsttSeq(String insttSeq) {
		this.insttSeq = insttSeq;
	}
	public String getInsttTrnngHistSeq() {
		return insttTrnngHistSeq;
	}
	public void setInsttTrnngHistSeq(String insttTrnngHistSeq) {
		this.insttTrnngHistSeq = insttTrnngHistSeq;
	}
	public String getTrnngDt() {
		return trnngDt;
	}
	public void setTrnngDt(String trnngDt) {
		this.trnngDt = trnngDt;
	}
	public String getTrnngNm() {
		return trnngNm;
	}
	public void setTrnngNm(String trnngNm) {
		this.trnngNm = trnngNm;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}


}
