package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * MatchingEduDegree bean
 * @author
 * @version 1.0
 * @since 2019.11.04
 */
public class MatchingPrivilegeBean extends CommonBean {

	private String jobskMatchSetPreferntCondSeq;
	private String preferntCondCd;
	private String jobskMatchSetSeq;
	public String getJobskMatchSetPreferntCondSeq() {
		return jobskMatchSetPreferntCondSeq;
	}
	public void setJobskMatchSetPreferntCondSeq(String jobskMatchSetPreferntCondSeq) {
		this.jobskMatchSetPreferntCondSeq = jobskMatchSetPreferntCondSeq;
	}
	public String getPreferntCondCd() {
		return preferntCondCd;
	}
	public void setPreferntCondCd(String preferntCondCd) {
		this.preferntCondCd = preferntCondCd;
	}
	public String getJobskMatchSetSeq() {
		return jobskMatchSetSeq;
	}
	public void setJobskMatchSetSeq(String jobskMatchSetSeq) {
		this.jobskMatchSetSeq = jobskMatchSetSeq;
	}
}
