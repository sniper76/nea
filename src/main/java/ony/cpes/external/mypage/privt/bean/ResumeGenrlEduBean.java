package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * bean 이력서정보를 담는 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class ResumeGenrlEduBean extends CommonBean {
	private String resumeGenrlEduSeq;
	private String resumeEduId;
	private String eduDegreeCd;
	private String iscedCd;
	private String eduDura;
	private String bgnDt;
	private String endDt;
	private String insttNm;
	private String addrProvcCd;
	private String resumeSeq;

	// 조회 관련
	private String eduDegreeCdNm;

	public String getEduDegreeCdNm() {
		return eduDegreeCdNm;
	}
	public void setEduDegreeCdNm(String eduDegreeCdNm) {
		this.eduDegreeCdNm = eduDegreeCdNm;
	}
	public String getResumeGenrlEduSeq() {
		return resumeGenrlEduSeq;
	}
	public void setResumeGenrlEduSeq(String resumeGenrlEduSeq) {
		this.resumeGenrlEduSeq = resumeGenrlEduSeq;
	}
	public String getResumeEduId() {
		return resumeEduId;
	}
	public void setResumeEduId(String resumeEduId) {
		this.resumeEduId = resumeEduId;
	}
	public String getEduDegreeCd() {
		return eduDegreeCd;
	}
	public void setEduDegreeCd(String eduDegreeCd) {
		this.eduDegreeCd = eduDegreeCd;
	}
	public String getIscedCd() {
		return iscedCd;
	}
	public void setIscedCd(String iscedCd) {
		this.iscedCd = iscedCd;
	}
	public String getEduDura() {
		return eduDura;
	}
	public void setEduDura(String eduDura) {
		this.eduDura = eduDura;
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
