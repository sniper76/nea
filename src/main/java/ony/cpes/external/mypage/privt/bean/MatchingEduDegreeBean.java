package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * MatchingEduDegree bean
 * @author
 * @version 1.0
 * @since 2019.11.04
 */
public class MatchingEduDegreeBean extends CommonBean {

	private String jobskMatchSetMinEduDegreeSeq;
	private String minEduDegreeCd;
	private String jobskMatchSetSeq;
	public String getJobskMatchSetMinEduDegreeSeq() {
		return jobskMatchSetMinEduDegreeSeq;
	}
	public void setJobskMatchSetMinEduDegreeSeq(String jobskMatchSetMinEduDegreeSeq) {
		this.jobskMatchSetMinEduDegreeSeq = jobskMatchSetMinEduDegreeSeq;
	}
	public String getMinEduDegreeCd() {
		return minEduDegreeCd;
	}
	public void setMinEduDegreeCd(String minEduDegreeCd) {
		this.minEduDegreeCd = minEduDegreeCd;
	}
	public String getJobskMatchSetSeq() {
		return jobskMatchSetSeq;
	}
	public void setJobskMatchSetSeq(String jobskMatchSetSeq) {
		this.jobskMatchSetSeq = jobskMatchSetSeq;
	}

}
