package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class ApplicBean extends CommonBean{

	private String vacancySeq;//구인_시퀀스
	private String applicTypeCd;//입사지원_형태_코드(온라인/이메일)(APPLIC_TYPE_CD)
	private String applicTypeNm;//입사지원_형태_코드(온라인/이메일)(APPLIC_TYPE_CD)
	private String applicCancelYn;//입사지원_취소_여부_YN
	private String resumeSeq;//이력서_시퀀스
	private String passYn;//합격_여부
	private String negoAmtUnitCd;//협상_급여_단위_코드(NEGO_SALARY_UNIT_CD)
	private String negoAmt;//협상_금액
	private String resumeOpenYn;//이력서_열람_여부
	private String resumePassYn;//서류_합격_여부
	private String resumeOpenDt;//이력서_열람_일시
	private String referralYn;//알선_여부
	private String applicProcCd;//입사지원_진행_코드
	private String applicProcNm;
	private String compnySeq;//입사지원_진행_코드
	private String compnyNm;//입사지원_진행_코드
	private String vacancyStsCd;//입사지원_진행_코드
	private String vacancyStsNm;//입사지원_진행_코드
	private String vacancyTitle;
	private int totCnt;
	private int openYCnt;
	private int openNCnt;
	private int cancelCnt;
	private int passCnt;
	private int checkCnt;
	private int paperCnt;
	private int intvwCnt;
	private String applicSeq;
	private String applicCancelDt;
	private String age;
	private String userNm;
	private String resumeTitle;
	private String eduDegreeCd;
	private String eduDegreeNm;
	private String iscoNm;
	private String careerYn;
	private String totCareerTermYearCnt;
	private String totCareerTermMonthCnt;
	private String genderNm;
	private String addrNm;
	private String genderCd;
	private String vacancyCloseYn;
	private Integer vacancyDaysLeft;
	private String delYn;
	private String failReason;
	private String displayYn;


	public String getTotCareerTermYearCnt() {
		return totCareerTermYearCnt;
	}
	public void setTotCareerTermYearCnt(String totCareerTermYearCnt) {
		this.totCareerTermYearCnt = totCareerTermYearCnt;
	}
	public String getTotCareerTermMonthCnt() {
		return totCareerTermMonthCnt;
	}
	public void setTotCareerTermMonthCnt(String totCareerTermMonthCnt) {
		this.totCareerTermMonthCnt = totCareerTermMonthCnt;
	}
	public String getVacancySeq() {
		return vacancySeq;
	}
	public void setVacancySeq(String vacancySeq) {
		this.vacancySeq = vacancySeq;
	}
	public String getApplicTypeCd() {
		return applicTypeCd;
	}
	public void setApplicTypeCd(String applicTypeCd) {
		this.applicTypeCd = applicTypeCd;
	}
	public String getApplicTypeNm() {
		return applicTypeNm;
	}
	public void setApplicTypeNm(String applicTypeNm) {
		this.applicTypeNm = applicTypeNm;
	}
	public String getApplicCancelYn() {
		return applicCancelYn;
	}
	public void setApplicCancelYn(String applicCancelYn) {
		this.applicCancelYn = applicCancelYn;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getPassYn() {
		return passYn;
	}
	public void setPassYn(String passYn) {
		this.passYn = passYn;
	}
	public String getNegoAmtUnitCd() {
		return negoAmtUnitCd;
	}
	public void setNegoAmtUnitCd(String negoAmtUnitCd) {
		this.negoAmtUnitCd = negoAmtUnitCd;
	}
	public String getNegoAmt() {
		return negoAmt;
	}
	public void setNegoAmt(String negoAmt) {
		this.negoAmt = negoAmt;
	}
	public String getResumeOpenYn() {
		return resumeOpenYn;
	}
	public void setResumeOpenYn(String resumeOpenYn) {
		this.resumeOpenYn = resumeOpenYn;
	}
	public String getResumePassYn() {
		return resumePassYn;
	}
	public void setResumePassYn(String resumePassYn) {
		this.resumePassYn = resumePassYn;
	}
	public String getResumeOpenDt() {
		return resumeOpenDt;
	}
	public void setResumeOpenDt(String resumeOpenDt) {
		this.resumeOpenDt = resumeOpenDt;
	}
	public String getReferralYn() {
		return referralYn;
	}
	public void setReferralYn(String referralYn) {
		this.referralYn = referralYn;
	}
	public String getApplicProcCd() {
		return applicProcCd;
	}
	public void setApplicProcCd(String applicProcCd) {
		this.applicProcCd = applicProcCd;
	}
	public String getApplicProcNm() {
		return applicProcNm;
	}
	public void setApplicProcNm(String applicProcNm) {
		this.applicProcNm = applicProcNm;
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
	public String getVacancyTitle() {
		return vacancyTitle;
	}
	public void setVacancyTitle(String vacancyTitle) {
		this.vacancyTitle = vacancyTitle;
	}
	public int getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	public int getOpenYCnt() {
		return openYCnt;
	}
	public void setOpenYCnt(int openYCnt) {
		this.openYCnt = openYCnt;
	}
	public int getOpenNCnt() {
		return openNCnt;
	}
	public void setOpenNCnt(int openNCnt) {
		this.openNCnt = openNCnt;
	}
	public int getCancelCnt() {
		return cancelCnt;
	}
	public void setCancelCnt(int cancelCnt) {
		this.cancelCnt = cancelCnt;
	}
	public String getApplicSeq() {
		return applicSeq;
	}
	public void setApplicSeq(String applicSeq) {
		this.applicSeq = applicSeq;
	}
	public String getApplicCancelDt() {
		return applicCancelDt;
	}
	public void setApplicCancelDt(String applicCancelDt) {
		this.applicCancelDt = applicCancelDt;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public int getPassCnt() {
		return passCnt;
	}
	public void setPassCnt(int passCnt) {
		this.passCnt = passCnt;
	}
	public int getCheckCnt() {
		return checkCnt;
	}
	public void setCheckCnt(int checkCnt) {
		this.checkCnt = checkCnt;
	}
	public String getEduDegreeCd() {
		return eduDegreeCd;
	}
	public void setEduDegreeCd(String eduDegreeCd) {
		this.eduDegreeCd = eduDegreeCd;
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
	public int getPaperCnt() {
		return paperCnt;
	}
	public void setPaperCnt(int paperCnt) {
		this.paperCnt = paperCnt;
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
	public String getGenderCd() {
		return genderCd;
	}
	public void setGenderCd(String genderCd) {
		this.genderCd = genderCd;
	}
	public String getVacancyCloseYn() {
		return vacancyCloseYn;
	}
	public void setVacancyCloseYn(String vacancyCloseYn) {
		this.vacancyCloseYn = vacancyCloseYn;
	}
	public Integer getVacancyDaysLeft() {
		return vacancyDaysLeft;
	}
	public void setVacancyDaysLeft(Integer vacancyDaysLeft) {
		this.vacancyDaysLeft = vacancyDaysLeft;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public int getIntvwCnt() {
		return intvwCnt;
	}
	public void setIntvwCnt(int intvwCnt) {
		this.intvwCnt = intvwCnt;
	}
	public String getFailReason() {
		return failReason;
	}
	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}
	public String getDisplayYn() {
		return displayYn;
	}
	public void setDisplayYn(String displayYn) {
		this.displayYn = displayYn;
	}


}
