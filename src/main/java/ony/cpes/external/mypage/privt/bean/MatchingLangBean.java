package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * MatchingLanguage bean
 * @author
 * @version 1.0
 * @since 2019.11.04
 */
public class MatchingLangBean extends CommonBean {

	private String jobskMatchSetLangSeq;
	private String langCd;
	private String jobskMatchSetSeq;
	public String getJobskMatchSetLangSeq() {
		return jobskMatchSetLangSeq;
	}
	public void setJobskMatchSetLangSeq(String jobskMatchSetLangSeq) {
		this.jobskMatchSetLangSeq = jobskMatchSetLangSeq;
	}
	public String getLangCd() {
		return langCd;
	}
	public void setLangCd(String langCd) {
		this.langCd = langCd;
	}
	public String getJobskMatchSetSeq() {
		return jobskMatchSetSeq;
	}
	public void setJobskMatchSetSeq(String jobskMatchSetSeq) {
		this.jobskMatchSetSeq = jobskMatchSetSeq;
	}

}
