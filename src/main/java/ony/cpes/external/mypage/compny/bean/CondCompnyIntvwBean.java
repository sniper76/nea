package ony.cpes.external.mypage.compny.bean;

import ony.cmm.common.bean.CommonBean;

public class CondCompnyIntvwBean extends CommonBean {

	private String vacancySeq;
	private String intvwBgnDt;
	private String intvwEndDt;
	private String jcCd;
	private String intvwTypeCd;
	private String userNm;

	public String getVacancySeq() {
		return vacancySeq;
	}
	public void setVacancySeq(String vacancySeq) {
		this.vacancySeq = vacancySeq;
	}
	public String getIntvwBgnDt() {
		return intvwBgnDt;
	}
	public void setIntvwBgnDt(String intvwBgnDt) {
		this.intvwBgnDt = intvwBgnDt;
	}
	public String getIntvwEndDt() {
		return intvwEndDt;
	}
	public void setIntvwEndDt(String intvwEndDt) {
		this.intvwEndDt = intvwEndDt;
	}
	public String getJcCd() {
		return jcCd;
	}
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	public String getIntvwTypeCd() {
		return intvwTypeCd;
	}
	public void setIntvwTypeCd(String intvwTypeCd) {
		this.intvwTypeCd = intvwTypeCd;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

}
