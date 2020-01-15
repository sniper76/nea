package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

public class ResumeDisablBean extends CommonBean {
	private String resumeDisablSeq;
	private String resumeSeq;
	private String disableCd;

	private String disableCdNm;

	public String getDisableCdNm() {
		return disableCdNm;
	}
	public void setDisableCdNm(String disableCdNm) {
		this.disableCdNm = disableCdNm;
	}
	public String getResumeDisablSeq() {
		return resumeDisablSeq;
	}
	public void setResumeDisablSeq(String resumeDisablSeq) {
		this.resumeDisablSeq = resumeDisablSeq;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getDisableCd() {
		return disableCd;
	}
	public void setDisableCd(String disableCd) {
		this.disableCd = disableCd;
	}

}
