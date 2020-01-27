package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * bean 구직신청정보를 담는 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class JobskReqBean extends CommonBean {
	private String jobskReqSeq;
	private String resumeSeq;
	private String jcCd;
	private String jcUserSeq;
	private String jobskNum;
	private String jcAgreeStsCd;
	private String jcAgreeDt;
	private String resumeOpenDt;
	private String delYn;
	private String delDt;

	private String jcUserNm;
	private String jcNm;

	public String getJcUserNm() {
		return jcUserNm;
	}
	public void setJcUserNm(String jcUserNm) {
		this.jcUserNm = jcUserNm;
	}
	public String getJcNm() {
		return jcNm;
	}
	public void setJcNm(String jcNm) {
		this.jcNm = jcNm;
	}
	public String getJobskReqSeq() {
		return jobskReqSeq;
	}
	public void setJobskReqSeq(String jobskReqSeq) {
		this.jobskReqSeq = jobskReqSeq;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getJcCd() {
		return jcCd;
	}
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	public String getJcUserSeq() {
		return jcUserSeq;
	}
	public void setJcUserSeq(String jcUserSeq) {
		this.jcUserSeq = jcUserSeq;
	}
	public String getJobskNum() {
		return jobskNum;
	}
	public void setJobskNum(String jobskNum) {
		this.jobskNum = jobskNum;
	}
	public String getJcAgreeStsCd() {
		return jcAgreeStsCd;
	}
	public void setJcAgreeStsCd(String jcAgreeStsCd) {
		this.jcAgreeStsCd = jcAgreeStsCd;
	}
	public String getJcAgreeDt() {
		return jcAgreeDt;
	}
	public void setJcAgreeDt(String jcAgreeDt) {
		this.jcAgreeDt = jcAgreeDt;
	}
	public String getResumeOpenDt() {
		return resumeOpenDt;
	}
	public void setResumeOpenDt(String resumeOpenDt) {
		this.resumeOpenDt = resumeOpenDt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getDelDt() {
		return delDt;
	}
	public void setDelDt(String delDt) {
		this.delDt = delDt;
	}

}
