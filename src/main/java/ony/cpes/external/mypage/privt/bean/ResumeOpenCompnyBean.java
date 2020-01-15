package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class ResumeOpenCompnyBean extends CommonBean{
	private String compnySeq;//기업_시퀀스
	private String resumeOpenCompnySeq;//이력서_열람_기업_시퀀스
	private String resumeSeq;//이력서_시퀀스
	private String compnyNm;//기업_시퀀스
	private int vacancyCnt;
	private String addrNm;
	private String isicCd;
	private String isicNm;
	private String compnyTypeNm;
	private String imagePath;

	public String getCompnySeq() {
		return compnySeq;
	}
	public void setCompnySeq(String compnySeq) {
		this.compnySeq = compnySeq;
	}
	public String getResumeOpenCompnySeq() {
		return resumeOpenCompnySeq;
	}
	public void setResumeOpenCompnySeq(String resumeOpenCompnySeq) {
		this.resumeOpenCompnySeq = resumeOpenCompnySeq;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getCompnyNm() {
		return compnyNm;
	}
	public void setCompnyNm(String compnyNm) {
		this.compnyNm = compnyNm;
	}
	public int getVacancyCnt() {
		return vacancyCnt;
	}
	public void setVacancyCnt(int vacancyCnt) {
		this.vacancyCnt = vacancyCnt;
	}
	public String getAddrNm() {
		return addrNm;
	}
	public void setAddrNm(String addrNm) {
		this.addrNm = addrNm;
	}
	public String getIsicCd() {
		return isicCd;
	}
	public void setIsicCd(String isicCd) {
		this.isicCd = isicCd;
	}
	public String getIsicNm() {
		return isicNm;
	}
	public void setIsicNm(String isicNm) {
		this.isicNm = isicNm;
	}
	public String getCompnyTypeNm() {
		return compnyTypeNm;
	}
	public void setCompnyTypeNm(String compnyTypeNm) {
		this.compnyTypeNm = compnyTypeNm;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


}
