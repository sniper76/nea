package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

public class ResumeIscoBean extends CommonBean {
	private String resumeIscoSeq;
	private String iscoCd;
	private String resumeSeq;

	private String iscoCdNm;

	public String getIscoCdNm() {
		return iscoCdNm;
	}
	public void setIscoCdNm(String iscoCdNm) {
		this.iscoCdNm = iscoCdNm;
	}
	public String getResumeIscoSeq() {
		return resumeIscoSeq;
	}
	public void setResumeIscoSeq(String resumeIscoSeq) {
		this.resumeIscoSeq = resumeIscoSeq;
	}
	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}

}
