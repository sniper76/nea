package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class OfferBean extends CommonBean{
	private String compnySeq;//기업_시퀀스
	private String compnyNm;//기업_시퀀스
	private String content;//내용
	private String resumeSeq;//이력서_시퀀스
	private String offerOpenYn;//입사제의열람여부
	private String offerOpenDt;//입사제의열람일시
	private String offerAcptYn;//입사제의수락여부
	private String offerAcptDt;//입사제의수락날짜
	private String emailNtceYn;//이메일_알림_여부
	private String emailNtceDt;//이메일_알림_날짜
	private String referralYn;//알선_여부
	private String smsNtceYn;//SMS알림여부
	private String smsNtceDt;//SMS알림날짜
	private String offerSeq;//SMS알림날짜
	private String vacancySeq;//SMS알림날짜
	private String vacancyTitle;//SMS알림날짜
	private String employFormNm;
	private String recrumtMemb;
	private String minSalaryAmt;//SMS알림날짜
	private String maxSalaryAmt;
	private String vacancyStsCd;
	private String vacancyStsNm;
	private String remainDt;
	private String addrNm;
	private int applicCnt;

	private String userNm;
	private int age;
	private String resumeTitle;
	private String eduDegreeNm;
	private String iscoNm;
	private String careerYn;
	private String genderNm;
	private String remainDiv;
	private String genderCd;
	private String imagePath;
	private String bkmkSeq;
	private int totCareerTermYearCnt;
	private int totCareerTermMonthCnt;

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
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getOfferOpenYn() {
		return offerOpenYn;
	}
	public void setOfferOpenYn(String offerOpenYn) {
		this.offerOpenYn = offerOpenYn;
	}
	public String getOfferOpenDt() {
		return offerOpenDt;
	}
	public void setOfferOpenDt(String offerOpenDt) {
		this.offerOpenDt = offerOpenDt;
	}
	public String getOfferAcptYn() {
		return offerAcptYn;
	}
	public void setOfferAcptYn(String offerAcptYn) {
		this.offerAcptYn = offerAcptYn;
	}
	public String getOfferAcptDt() {
		return offerAcptDt;
	}
	public void setOfferAcptDt(String offerAcptDt) {
		this.offerAcptDt = offerAcptDt;
	}
	public String getEmailNtceYn() {
		return emailNtceYn;
	}
	public void setEmailNtceYn(String emailNtceYn) {
		this.emailNtceYn = emailNtceYn;
	}
	public String getEmailNtceDt() {
		return emailNtceDt;
	}
	public void setEmailNtceDt(String emailNtceDt) {
		this.emailNtceDt = emailNtceDt;
	}
	public String getReferralYn() {
		return referralYn;
	}
	public void setReferralYn(String referralYn) {
		this.referralYn = referralYn;
	}
	public String getSmsNtceYn() {
		return smsNtceYn;
	}
	public void setSmsNtceYn(String smsNtceYn) {
		this.smsNtceYn = smsNtceYn;
	}
	public String getSmsNtceDt() {
		return smsNtceDt;
	}
	public void setSmsNtceDt(String smsNtceDt) {
		this.smsNtceDt = smsNtceDt;
	}
	public String getOfferSeq() {
		return offerSeq;
	}
	public void setOfferSeq(String offerSeq) {
		this.offerSeq = offerSeq;
	}
	public String getVacancySeq() {
		return vacancySeq;
	}
	public void setVacancySeq(String vacancySeq) {
		this.vacancySeq = vacancySeq;
	}
	public String getVacancyTitle() {
		return vacancyTitle;
	}
	public void setVacancyTitle(String vacancyTitle) {
		this.vacancyTitle = vacancyTitle;
	}
	public String getEmployFormNm() {
		return employFormNm;
	}
	public void setEmployFormNm(String employFormNm) {
		this.employFormNm = employFormNm;
	}
	public String getRecrumtMemb() {
		return recrumtMemb;
	}
	public void setRecrumtMemb(String recrumtMemb) {
		this.recrumtMemb = recrumtMemb;
	}
	public String getMinSalaryAmt() {
		return minSalaryAmt;
	}
	public void setMinSalaryAmt(String minSalaryAmt) {
		this.minSalaryAmt = minSalaryAmt;
	}
	public String getMaxSalaryAmt() {
		return maxSalaryAmt;
	}
	public void setMaxSalaryAmt(String maxSalaryAmt) {
		this.maxSalaryAmt = maxSalaryAmt;
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
	public String getRemainDt() {
		return remainDt;
	}
	public void setRemainDt(String remainDt) {
		this.remainDt = remainDt;
	}
	public String getAddrNm() {
		return addrNm;
	}
	public void setAddrNm(String addrNm) {
		this.addrNm = addrNm;
	}
	public int getApplicCnt() {
		return applicCnt;
	}
	public void setApplicCnt(int applicCnt) {
		this.applicCnt = applicCnt;
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
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getEduDegreeNm() {
		return eduDegreeNm;
	}
	public void setEduDegreeNm(String eduDegreeNm) {
		this.eduDegreeNm = eduDegreeNm;
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
	public String getGenderNm() {
		return genderNm;
	}
	public void setGenderNm(String genderNm) {
		this.genderNm = genderNm;
	}
	public String getRemainDiv() {
		return remainDiv;
	}
	public void setRemainDiv(String remainDiv) {
		this.remainDiv = remainDiv;
	}
	public String getGenderCd() {
		return genderCd;
	}
	public void setGenderCd(String genderCd) {
		this.genderCd = genderCd;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getBkmkSeq() {
		return bkmkSeq;
	}
	public void setBkmkSeq(String bkmkSeq) {
		this.bkmkSeq = bkmkSeq;
	}

}
