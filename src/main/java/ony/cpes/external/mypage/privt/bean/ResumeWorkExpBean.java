package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * bean 이력서 추천인 정보를 담는 Bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.06
 */
public class ResumeWorkExpBean extends CommonBean {

	private String resumeWorkExpSeq;
	private String resumeWorkExpId;
	private String bgnDt;
	private String endDt;
	private String iscoCd;
	private String isicCd;
	private String orgnzNm;
	private String leaveReason;
	private String addrProvcCd;
	private String resumeSeq;
	private String selfempYn;

	// 조회 관련
	private String bgnDtYy;
	private String bgnDtMm;
	private String endDtYy;
	private String endDtMm;

	public String getBgnDtYy() {
		return bgnDtYy;
	}
	public void setBgnDtYy(String bgnDtYy) {
		this.bgnDtYy = bgnDtYy;
	}
	public String getBgnDtMm() {
		return bgnDtMm;
	}
	public void setBgnDtMm(String bgnDtMm) {
		this.bgnDtMm = bgnDtMm;
	}
	public String getEndDtYy() {
		return endDtYy;
	}
	public void setEndDtYy(String endDtYy) {
		this.endDtYy = endDtYy;
	}
	public String getEndDtMm() {
		return endDtMm;
	}
	public void setEndDtMm(String endDtMm) {
		this.endDtMm = endDtMm;
	}
	public String getResumeWorkExpSeq() {
		return resumeWorkExpSeq;
	}
	public void setResumeWorkExpSeq(String resumeWorkExpSeq) {
		this.resumeWorkExpSeq = resumeWorkExpSeq;
	}
	public String getResumeWorkExpId() {
		return resumeWorkExpId;
	}
	public void setResumeWorkExpId(String resumeWorkExpId) {
		this.resumeWorkExpId = resumeWorkExpId;
	}
	public String getBgnDt() {
		return bgnDt;
	}
	public void setBgnDt(String bgnDt) {
		this.bgnDt = bgnDt;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
	}
	public String getIsicCd() {
		return isicCd;
	}
	public void setIsicCd(String isicCd) {
		this.isicCd = isicCd;
	}
	public String getOrgnzNm() {
		return orgnzNm;
	}
	public void setOrgnzNm(String orgnzNm) {
		this.orgnzNm = orgnzNm;
	}
	public String getLeaveReason() {
		return leaveReason;
	}
	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}
	public String getAddrProvcCd() {
		return addrProvcCd;
	}
	public void setAddrProvcCd(String addrProvcCd) {
		this.addrProvcCd = addrProvcCd;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getSelfempYn() {
		return selfempYn;
	}
	public void setSelfempYn(String selfempYn) {
		this.selfempYn = selfempYn;
	}

}
