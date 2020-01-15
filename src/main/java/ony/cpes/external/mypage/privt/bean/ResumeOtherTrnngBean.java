package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * bean 이력서정보를 담는 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class ResumeOtherTrnngBean extends CommonBean {
	private String resumeOtherTrnngSeq;
	private String resumeOtherTrnngId;
	private String bgnDt;
	private String endDt;
	private String trnngEduDegreeCd;
	private String insttNm;
	private String iscedCd;
	private String addrProvcCd;
	private String resumeSeq;

	// 조회 관련
	private String bgnDtYy;
	private String bgnDtMm;
	private String endDtYy;
	private String endDtMm;
	private String addrProvcCdNm;

	public String getBgnDtYy() {
		return bgnDtYy;
	}
	public void setBgnDtYy(String bgnDtYy) {
		this.bgnDtYy = bgnDtYy;
	}
	public String getBgnDtMm() {
		return bgnDtMm;
	}
	public void setBgnDtmM(String bgnDtMm) {
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
	public String getAddrProvcCdNm() {
		return addrProvcCdNm;
	}
	public void setAddrProvcCdNm(String addrProvcCdNm) {
		this.addrProvcCdNm = addrProvcCdNm;
	}
	public String getResumeOtherTrnngSeq() {
		return resumeOtherTrnngSeq;
	}
	public void setResumeOtherTrnngSeq(String resumeOtherTrnngSeq) {
		this.resumeOtherTrnngSeq = resumeOtherTrnngSeq;
	}
	public String getResumeOtherTrnngId() {
		return resumeOtherTrnngId;
	}
	public void setResumeOtherTrnngId(String resumeOtherTrnngId) {
		this.resumeOtherTrnngId = resumeOtherTrnngId;
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
	public String getTrnngEduDegreeCd() {
		return trnngEduDegreeCd;
	}
	public void setTrnngEduDegreeCd(String trnngEduDegreeCd) {
		this.trnngEduDegreeCd = trnngEduDegreeCd;
	}
	public String getInsttNm() {
		return insttNm;
	}
	public void setInsttNm(String insttNm) {
		this.insttNm = insttNm;
	}
	public String getIscedCd() {
		return iscedCd;
	}
	public void setIscedCd(String iscedCd) {
		this.iscedCd = iscedCd;
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

}
