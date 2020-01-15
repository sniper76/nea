package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class IntvwBean extends CommonBean{

	private String resumeSeq;//이력서_시퀀스
	private String compnySeq;//기업_시퀀스
	private String compnyNm;//기업_시퀀스
	private String content;//내용
	private String intvwTypeCd;//면접 방법
	private String intvwTypeNm;//면접 방법
	private String intvwOpenYn;//면접제의열람여부
	private String intvwOpenDt;//면접제의열람일시
	private String intvwDt;//면접일시
	private String referralYn;//알선_여부
	private String mngerEmail;
	private String intvwSeq;
	private String applicSeq;
	private String userNm;
	private int age;
	private String eduDegreeNm;
	private int totCareerTermYearCnt;
	private int totCareerTermMonthCnt;
	private String genderCd;
	private String genderNm;
	private String addrNm;
	private String resumeTitle;
	private String iscoNm;
	private String careerYn;
	private String vacancyTitle;
	private String vacancySeq;
	private String intvwStsCd;
	private String intvwStsNm;
	private String vacancyStsCd;
	private String vacancyStsNm;
	private String intvwRejectCd;

	public int getTotCareerTermYearCnt() {
		return totCareerTermYearCnt;
	}
	public void setTotCareerTermYearCnt(int totCareerTermYearCnt) {
		this.totCareerTermYearCnt = totCareerTermYearCnt;
	}
	public int getTotCareerTermMonthCnt() {
		return totCareerTermMonthCnt;
	}
	public void setTotCareerTermMonthCnt(int totCareerTermMonthCnt) {
		this.totCareerTermMonthCnt = totCareerTermMonthCnt;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getCompnySeq() {
		return compnySeq;
	}
	public void setCompnySeq(String compnySeq) {
		this.compnySeq = compnySeq;
	}
	public String getCompnyNm() {
		return compnyNm;
	}
	public void setCompnyNm(String compnyNm) {
		this.compnyNm = compnyNm;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIntvwTypeCd() {
		return intvwTypeCd;
	}
	public void setIntvwTypeCd(String intvwTypeCd) {
		this.intvwTypeCd = intvwTypeCd;
	}
	public String getIntvwTypeNm() {
		return intvwTypeNm;
	}
	public void setIntvwTypeNm(String intvwTypeNm) {
		this.intvwTypeNm = intvwTypeNm;
	}
	public String getIntvwOpenYn() {
		return intvwOpenYn;
	}
	public void setIntvwOpenYn(String intvwOpenYn) {
		this.intvwOpenYn = intvwOpenYn;
	}
	public String getIntvwOpenDt() {
		return intvwOpenDt;
	}
	public void setIntvwOpenDt(String intvwOpenDt) {
		this.intvwOpenDt = intvwOpenDt;
	}
	public String getIntvwDt() {
		return intvwDt;
	}
	public void setIntvwDt(String intvwDt) {
		this.intvwDt = intvwDt;
	}
	public String getReferralYn() {
		return referralYn;
	}
	public void setReferralYn(String referralYn) {
		this.referralYn = referralYn;
	}
	public String getMngerEmail() {
		return mngerEmail;
	}
	public void setMngerEmail(String mngerEmail) {
		this.mngerEmail = mngerEmail;
	}
	public String getIntvwSeq() {
		return intvwSeq;
	}
	public void setIntvwSeq(String intvwSeq) {
		this.intvwSeq = intvwSeq;
	}
	public String getApplicSeq() {
		return applicSeq;
	}
	public void setApplicSeq(String applicSeq) {
		this.applicSeq = applicSeq;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEduDegreeNm() {
		return eduDegreeNm;
	}
	public void setEduDegreeNm(String eduDegreeNm) {
		this.eduDegreeNm = eduDegreeNm;
	}
	public String getGenderCd() {
		return genderCd;
	}
	public void setGenderCd(String genderCd) {
		this.genderCd = genderCd;
	}
	public String getGenderNm() {
		return genderNm;
	}
	public void setGenderNm(String genderNm) {
		this.genderNm = genderNm;
	}
	public String getAddrNm() {
		return addrNm;
	}
	public void setAddrNm(String addrNm) {
		this.addrNm = addrNm;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getIscoNm() {
		return iscoNm;
	}
	public void setIscoNm(String iscoNm) {
		this.iscoNm = iscoNm;
	}
	public String getCareerYn() {
		return careerYn;
	}
	public void setCareerYn(String careerYn) {
		this.careerYn = careerYn;
	}
	public String getVacancyTitle() {
		return vacancyTitle;
	}
	public void setVacancyTitle(String vacancyTitle) {
		this.vacancyTitle = vacancyTitle;
	}
	public String getVacancySeq() {
		return vacancySeq;
	}
	public void setVacancySeq(String vacancySeq) {
		this.vacancySeq = vacancySeq;
	}
	public String getIntvwStsCd() {
		return intvwStsCd;
	}
	public void setIntvwStsCd(String intvwStsCd) {
		this.intvwStsCd = intvwStsCd;
	}
	public String getIntvwStsNm() {
		return intvwStsNm;
	}
	public void setIntvwStsNm(String intvwStsNm) {
		this.intvwStsNm = intvwStsNm;
	}
	public String getVacancyStsCd() {
		return vacancyStsCd;
	}
	public void setVacancyStsCd(String vacancyStsCd) {
		this.vacancyStsCd = vacancyStsCd;
	}
	public String getVacancyStsNm() {
		return vacancyStsNm;
	}
	public void setVacancyStsNm(String vacancyStsNm) {
		this.vacancyStsNm = vacancyStsNm;
	}
	public String getIntvwRejectCd() {
		return intvwRejectCd;
	}
	public void setIntvwRejectCd(String intvwRejectCd) {
		this.intvwRejectCd = intvwRejectCd;
	}


}
