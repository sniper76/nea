package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class JobskBean extends CommonBean{

	private String jobskReqSeq;//구직_신청_시퀀스
	private String resumeSeq;//이력서_시퀀스
	private String jcCd;//JOB_CENTER_코드(JC_CD)
	private String jcUserSeq;//JOB_CENTER_사용자_시퀀스
	private String jobskNum;//구직번호
	private String jcAgreeStsCd;//JOB_CENTER_승인_상태_코드
	private String jcAgreeDt;//JOB_CENTER_승인_날짜
	private String resumeOpenDt;//이력서_열람_날짜
	private String delYn;//삭제_여부
	private String delDt;//삭제_날짜
	private String userSeq;
	private String priResumeYn;
	private String jobskReqYn;
	private String jcAgreeStsNm;
	private String jcNm;
	private String jcTel;
	private String resumeTitle;
	private String nowWorkYn;
	private String urgentJobseekYn;
	private String jobskStsCd;
	private String jobskEndDt;
	private String jobskStsNm;
	private String jcUserNm;
	private int cancalCnt;

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
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getPriResumeYn() {
		return priResumeYn;
	}
	public void setPriResumeYn(String priResumeYn) {
		this.priResumeYn = priResumeYn;
	}
	public String getJobskReqYn() {
		return jobskReqYn;
	}
	public void setJobskReqYn(String jobskReqYn) {
		this.jobskReqYn = jobskReqYn;
	}
	public String getJcAgreeStsNm() {
		return jcAgreeStsNm;
	}
	public void setJcAgreeStsNm(String jcAgreeStsNm) {
		this.jcAgreeStsNm = jcAgreeStsNm;
	}
	public String getJcNm() {
		return jcNm;
	}
	public void setJcNm(String jcNm) {
		this.jcNm = jcNm;
	}
	public String getJcTel() {
		return jcTel;
	}
	public void setJcTel(String jcTel) {
		this.jcTel = jcTel;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getNowWorkYn() {
		return nowWorkYn;
	}
	public void setNowWorkYn(String nowWorkYn) {
		this.nowWorkYn = nowWorkYn;
	}
	public String getUrgentJobseekYn() {
		return urgentJobseekYn;
	}
	public void setUrgentJobseekYn(String urgentJobseekYn) {
		this.urgentJobseekYn = urgentJobseekYn;
	}
	public String getJobskStsCd() {
		return jobskStsCd;
	}
	public void setJobskStsCd(String jobskStsCd) {
		this.jobskStsCd = jobskStsCd;
	}
	public String getJobskEndDt() {
		return jobskEndDt;
	}
	public void setJobskEndDt(String jobskEndDt) {
		this.jobskEndDt = jobskEndDt;
	}
	public String getJobskStsNm() {
		return jobskStsNm;
	}
	public void setJobskStsNm(String jobskStsNm) {
		this.jobskStsNm = jobskStsNm;
	}
	public int getCancalCnt() {
		return cancalCnt;
	}
	public void setCancalCnt(int cancalCnt) {
		this.cancalCnt = cancalCnt;
	}
	public String getJcUserNm() {
		return jcUserNm;
	}
	public void setJcUserNm(String jcUserNm) {
		this.jcUserNm = jcUserNm;
	}


}
