package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

public class ResumeHopeWorkLocBean extends CommonBean {
	private String resumeHopeWorkLocSeq;
	private String resumeSeq;
	private String addrCd;
	private String addrDtl;
	private String addrFullCd;
	private String addrFullNm;

	// 조회 관련
	private String addrCdNm;

	public String getAddrCdNm() {
		return addrCdNm;
	}
	public void setAddrCdNm(String addrCdNm) {
		this.addrCdNm = addrCdNm;
	}
	public String getResumeHopeWorkLocSeq() {
		return resumeHopeWorkLocSeq;
	}
	public void setResumeHopeWorkLocSeq(String resumeHopeWorkLocSeq) {
		this.resumeHopeWorkLocSeq = resumeHopeWorkLocSeq;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getAddrCd() {
		return addrCd;
	}
	public void setAddrCd(String addrCd) {
		this.addrCd = addrCd;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getAddrFullCd() {
		return addrFullCd;
	}
	public void setAddrFullCd(String addrFullCd) {
		this.addrFullCd = addrFullCd;
	}
	public String getAddrFullNm() {
		return addrFullNm;
	}
	public void setAddrFullNm(String addrFullNm) {
		this.addrFullNm = addrFullNm;
	}

}
