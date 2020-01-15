package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * bean 이력서 추천인 정보를 담는 Bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.06
 */
public class ResumeSpecialStudyBean extends CommonBean {

	private String specialStudySeq;
	private String specialStudyNm;
	private String duraMonthCnt;
	private String bgnDt;
	private String endDt;
	private String insttNm;
	private String cntryCd;
	private String provcCd;
	private String resumeSeq;

	// 조회 관련
	private String bgnDtYy;
	private String bgnDtMm;
	private String endDtYy;
	private String endDtMm;
	private String cntryCdNm;
	private String provcCdNm;

	public String getCntryCdNm() {
		return cntryCdNm;
	}
	public void setCntryCdNm(String cntryCdNm) {
		this.cntryCdNm = cntryCdNm;
	}
	public String getProvcCdNm() {
		return provcCdNm;
	}
	public void setProvcCdNm(String provcCdNm) {
		this.provcCdNm = provcCdNm;
	}
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
	public String getSpecialStudySeq() {
		return specialStudySeq;
	}
	public void setSpecialStudySeq(String specialStudySeq) {
		this.specialStudySeq = specialStudySeq;
	}
	public String getSpecialStudyNm() {
		return specialStudyNm;
	}
	public void setSpecialStudyNm(String specialStudyNm) {
		this.specialStudyNm = specialStudyNm;
	}
	public String getDuraMonthCnt() {
		return duraMonthCnt;
	}
	public void setDuraMonthCnt(String duraMonthCnt) {
		this.duraMonthCnt = duraMonthCnt;
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
	public String getInsttNm() {
		return insttNm;
	}
	public void setInsttNm(String insttNm) {
		this.insttNm = insttNm;
	}
	public String getCntryCd() {
		return cntryCd;
	}
	public void setCntryCd(String cntryCd) {
		this.cntryCd = cntryCd;
	}
	public String getProvcCd() {
		return provcCd;
	}
	public void setProvcCd(String provcCd) {
		this.provcCd = provcCd;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}

}
