package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * MatchingIsco bean
 * @author
 * @version 1.0
 * @since 2019.11.04
 */
public class MatchingIscoBean extends CommonBean {

	private String jobskMatchSetIscoSeq;
	private String iscoCd;
	private String jobskMatchSetSeq;
	public String getJobskMatchSetIscoSeq() {
		return jobskMatchSetIscoSeq;
	}
	public void setJobskMatchSetIscoSeq(String jobskMatchSetIscoSeq) {
		this.jobskMatchSetIscoSeq = jobskMatchSetIscoSeq;
	}
	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
	}
	public String getJobskMatchSetSeq() {
		return jobskMatchSetSeq;
	}
	public void setJobskMatchSetSeq(String jobskMatchSetSeq) {
		this.jobskMatchSetSeq = jobskMatchSetSeq;
	}

}
