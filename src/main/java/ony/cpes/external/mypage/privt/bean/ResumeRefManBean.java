package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * bean 이력서 추천인 정보를 담는 Bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.06
 */
public class ResumeRefManBean extends CommonBean  {
	private String resumeRefManSeq;
	private String resumeRefManId;
	private String nm;
	private String orgnzNm;
	private String position;
	private String ref;
	private String cell;
	private String email;
	private String addrCd;
	private String resumeSeq;
	private String addrFullCd;
	private String addrFullNm;
	private String addrDtl;

	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getResumeRefManSeq() {
		return resumeRefManSeq;
	}
	public void setResumeRefManSeq(String resumeRefManSeq) {
		this.resumeRefManSeq = resumeRefManSeq;
	}
	public String getResumeRefManId() {
		return resumeRefManId;
	}
	public void setResumeRefManId(String resumeRefManId) {
		this.resumeRefManId = resumeRefManId;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getOrgnzNm() {
		return orgnzNm;
	}
	public void setOrgnzNm(String orgnzNm) {
		this.orgnzNm = orgnzNm;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getCell() {
		return cell;
	}
	public void setCell(String cell) {
		this.cell = cell;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddrCd() {
		return addrCd;
	}
	public void setAddrCd(String addrCd) {
		this.addrCd = addrCd;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
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
