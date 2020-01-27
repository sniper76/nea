package ony.cpes.external.mypage.privt.bean;

import java.util.List;

import ony.cmm.common.bean.CommonBean;

/**
 * bean 이력서정보를 담는 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class ResumeBean extends CommonBean {

	private String resumeSeq;
	private String resumeId;
	private String userSeq;
	private String userId;
	private String jcCd;
	private String cmpltUserNmKh;
	private String cmpltUserNmEn;
	private String genderCd;
	private String nationCd;
	private String birth;
	private String identiNo;
	private String birthLocCd;
	private String marriCd;
	private String familyCnt;
	private String underAge15FamilyCnt;
	private String overAge64FamilyCnt;
	private String addrDtl;
	private String addrCd;
	private String frstimeJobSeekerYn;
	private String studyingYn;
	private String retMigratYn;
	private String ruralLaboYn;
	private String srvcYn;
	private String ethnicMinorYn;
	private String disablYn;
	private String disablOptionCd;
	private String disablEtc;
	private String nowWorkYn;
	private String beforeWorkDura;
	private String selfempYn;
	private String selfempClassCd;
	private String urgentJobseekYn;
	private String jobseekWaitDura;
	private String fileGrpSeq;
	private String proLicnsYn;
	private String proLicnsSpec;
	private String careerYn;
	private String totCareerTermYearCnt;
	private String totCareerTermMonthCnt;
	private String jcUserModDt;
	private String jcVerityUserSeq;
	private String jcNote;
	private String uploadCv;
	private String stepInput;
	private String mobileId;
	private String resumeStsCd;
	private String lastModDt;
	private String jcUserSeq;
	private String langUseCd;
	private String resumeTitle;
	private String priResumeYn;
	private String resumeKeyword;
	private String preferJobTitle;
	private String iscoCd;
	private String isicCd;
	private String employFormCd;
	private String preferEmployTypeCd;
	private String typeEmployHourDay;
	private String typeEmployDayWeek;
	private String preferCrtctTerms;
	private String preferCrtctTermsDura;
	private String preferCrtctType;
	private String nightWorkYn;
	private String overTimeWorkYn;
	private String hldayWorkYn;
	private String expctMinSalaryAmt;
	private String expctMaxSalaryAmt;
	private String expctSalaryTypeCd;
	private String diffProvcWorkYn;
	private String workBgnAbleYn;
	private String workBgnAbleWithin;
	private String jobskReqYn;
	private String useYn;
	private String birthAddrDtl;
	private String preferDayMon;
	private String preferDayTue;
	private String preferDayWed;
	private String preferDayThu;
	private String preferDayFri;
	private String preferDaySat;
	private String preferDaySun;
	private String preferPosition;
	private String addrFullCd;
	private String addrFullNm;
	private String addrNm;

	private String hopeWorkLocListStr;
	private String specialStudyListStr;
	private String otherTrnngListStr;
	private String langListStr;
	private String workExpListStr;
	private String skillListStr;
	private String refManListStr;
	private String disableListStr;
	private String genrlEduListStr;
	private String hopeWorkDay;
	private String iscoCdListStr;

	private String[] resumeKeywordList;

	private String tempCheck;
	private String updateFlag;

	// 조회 관련
	private String marriCdNm;
	private String employFormCdNm;
	private String preferEmployTypeCdNm;
	private String preferCrtctTypeNm;
	private String bkmkSeq;


	private String[] proLicnsSpecList;

	private String vacancySeq;
	private String userNm;
	private String genderNm;
	private Integer age;
	private String eduDegreeNm;
	private String displayYn;

	public String getVacancySeq() {
		return vacancySeq;
	}
	public void setVacancySeq(String vacancySeq) {
		this.vacancySeq = vacancySeq;
	}
	public String[] getProLicnsSpecList() {
		return proLicnsSpecList;
	}
	public void setProLicnsSpecList(String[] proLicnsSpecList) {
		this.proLicnsSpecList = proLicnsSpecList;
	}
	public String getIscoCdListStr() {
		return iscoCdListStr;
	}
	public void setIscoCdListStr(String iscoCdListStr) {
		this.iscoCdListStr = iscoCdListStr;
	}
	public String getBkmkSeq() {
		return bkmkSeq;
	}
	public void setBkmkSeq(String bkmkSeq) {
		this.bkmkSeq = bkmkSeq;
	}
	public String getHopeWorkDay() {
		return hopeWorkDay;
	}
	public void setHopeWorkDay(String hopeWorkDay) {
		this.hopeWorkDay = hopeWorkDay;
	}
	public String[] getResumeKeywordList() {
		return resumeKeywordList;
	}
	public void setResumeKeywordList(String[] resumeKeywordList) {
		this.resumeKeywordList = resumeKeywordList;
	}
	public String getUpdateFlag() {
		return updateFlag;
	}
	public void setUpdateFlag(String updateFlag) {
		this.updateFlag = updateFlag;
	}
	public String getPreferCrtctTypeNm() {
		return preferCrtctTypeNm;
	}
	public void setPreferCrtctTypeNm(String preferCrtctTypeNm) {
		this.preferCrtctTypeNm = preferCrtctTypeNm;
	}
	public String getPreferEmployTypeCdNm() {
		return preferEmployTypeCdNm;
	}
	public void setPreferEmployTypeCdNm(String preferEmployTypeCdNm) {
		this.preferEmployTypeCdNm = preferEmployTypeCdNm;
	}
	public String getEmployFormCdNm() {
		return employFormCdNm;
	}
	public void setEmployFormCdNm(String employFormCdNm) {
		this.employFormCdNm = employFormCdNm;
	}
	public String getMarriCdNm() {
		return marriCdNm;
	}
	public void setMarriCdNm(String marriCdNm) {
		this.marriCdNm = marriCdNm;
	}
	public String getTempCheck() {
		return tempCheck;
	}
	public void setTempCheck(String tempCheck) {
		this.tempCheck = tempCheck;
	}
	public String getDisableListStr() {
		return disableListStr;
	}
	public void setDisableListStr(String disableListStr) {
		this.disableListStr = disableListStr;
	}
	public String getGenrlEduListStr() {
		return genrlEduListStr;
	}
	public void setGenrlEduListStr(String genrlEduListStr) {
		this.genrlEduListStr = genrlEduListStr;
	}
	public String getHopeWorkLocListStr() {
		return hopeWorkLocListStr;
	}
	public void setHopeWorkLocListStr(String hopeWorkLocListStr) {
		this.hopeWorkLocListStr = hopeWorkLocListStr;
	}
	public String getSpecialStudyListStr() {
		return specialStudyListStr;
	}
	public void setSpecialStudyListStr(String specialStudyListStr) {
		this.specialStudyListStr = specialStudyListStr;
	}
	public String getOtherTrnngListStr() {
		return otherTrnngListStr;
	}
	public void setOtherTrnngListStr(String otherTrnngListStr) {
		this.otherTrnngListStr = otherTrnngListStr;
	}
	public String getLangListStr() {
		return langListStr;
	}
	public void setLangListStr(String langListStr) {
		this.langListStr = langListStr;
	}
	public String getWorkExpListStr() {
		return workExpListStr;
	}
	public void setWorkExpListStr(String workExpListStr) {
		this.workExpListStr = workExpListStr;
	}
	public String getSkillListStr() {
		return skillListStr;
	}
	public void setSkillListStr(String skillListStr) {
		this.skillListStr = skillListStr;
	}
	public String getRefManListStr() {
		return refManListStr;
	}
	public void setRefManListStr(String refManListStr) {
		this.refManListStr = refManListStr;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getResumeId() {
		return resumeId;
	}
	public void setResumeId(String resumeId) {
		this.resumeId = resumeId;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getJcCd() {
		return jcCd;
	}
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	public String getCmpltUserNmKh() {
		return cmpltUserNmKh;
	}
	public void setCmpltUserNmKh(String cmpltUserNmKh) {
		this.cmpltUserNmKh = cmpltUserNmKh;
	}
	public String getCmpltUserNmEn() {
		return cmpltUserNmEn;
	}
	public void setCmpltUserNmEn(String cmpltUserNmEn) {
		this.cmpltUserNmEn = cmpltUserNmEn;
	}
	public String getGenderCd() {
		return genderCd;
	}
	public void setGenderCd(String genderCd) {
		this.genderCd = genderCd;
	}
	public String getNationCd() {
		return nationCd;
	}
	public void setNationCd(String nationCd) {
		this.nationCd = nationCd;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getIdentiNo() {
		return identiNo;
	}
	public void setIdentiNo(String identiNo) {
		this.identiNo = identiNo;
	}
	public String getBirthLocCd() {
		return birthLocCd;
	}
	public void setBirthLocCd(String birthLocCd) {
		this.birthLocCd = birthLocCd;
	}
	public String getMarriCd() {
		return marriCd;
	}
	public void setMarriCd(String marriCd) {
		this.marriCd = marriCd;
	}
	public String getFamilyCnt() {
		return familyCnt;
	}
	public void setFamilyCnt(String familyCnt) {
		this.familyCnt = familyCnt;
	}
	public String getUnderAge15FamilyCnt() {
		return underAge15FamilyCnt;
	}
	public void setUnderAge15FamilyCnt(String underAge15FamilyCnt) {
		this.underAge15FamilyCnt = underAge15FamilyCnt;
	}
	public String getOverAge64FamilyCnt() {
		return overAge64FamilyCnt;
	}
	public void setOverAge64FamilyCnt(String overAge64FamilyCnt) {
		this.overAge64FamilyCnt = overAge64FamilyCnt;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getAddrCd() {
		return addrCd;
	}
	public void setAddrCd(String addrCd) {
		this.addrCd = addrCd;
	}
	public String getFrstimeJobSeekerYn() {
		return frstimeJobSeekerYn;
	}
	public void setFrstimeJobSeekerYn(String frstimeJobSeekerYn) {
		this.frstimeJobSeekerYn = frstimeJobSeekerYn;
	}
	public String getStudyingYn() {
		return studyingYn;
	}
	public void setStudyingYn(String studyingYn) {
		this.studyingYn = studyingYn;
	}
	public String getRetMigratYn() {
		return retMigratYn;
	}
	public void setRetMigratYn(String retMigratYn) {
		this.retMigratYn = retMigratYn;
	}
	public String getRuralLaboYn() {
		return ruralLaboYn;
	}
	public void setRuralLaboYn(String ruralLaboYn) {
		this.ruralLaboYn = ruralLaboYn;
	}
	public String getSrvcYn() {
		return srvcYn;
	}
	public void setSrvcYn(String srvcYn) {
		this.srvcYn = srvcYn;
	}
	public String getEthnicMinorYn() {
		return ethnicMinorYn;
	}
	public void setEthnicMinorYn(String ethnicMinorYn) {
		this.ethnicMinorYn = ethnicMinorYn;
	}
	public String getDisablYn() {
		return disablYn;
	}
	public void setDisablYn(String disablYn) {
		this.disablYn = disablYn;
	}
	public String getDisablOptionCd() {
		return disablOptionCd;
	}
	public void setDisablOptionCd(String disablOptionCd) {
		this.disablOptionCd = disablOptionCd;
	}
	public String getDisablEtc() {
		return disablEtc;
	}
	public void setDisablEtc(String disablEtc) {
		this.disablEtc = disablEtc;
	}
	public String getNowWorkYn() {
		return nowWorkYn;
	}
	public void setNowWorkYn(String nowWorkYn) {
		this.nowWorkYn = nowWorkYn;
	}
	public String getBeforeWorkDura() {
		return beforeWorkDura;
	}
	public void setBeforeWorkDura(String beforeWorkDura) {
		this.beforeWorkDura = beforeWorkDura;
	}
	public String getSelfempYn() {
		return selfempYn;
	}
	public void setSelfempYn(String selfempYn) {
		this.selfempYn = selfempYn;
	}
	public String getSelfempClassCd() {
		return selfempClassCd;
	}
	public void setSelfempClassCd(String selfempClassCd) {
		this.selfempClassCd = selfempClassCd;
	}
	public String getUrgentJobseekYn() {
		return urgentJobseekYn;
	}
	public void setUrgentJobseekYn(String urgentJobseekYn) {
		this.urgentJobseekYn = urgentJobseekYn;
	}
	public String getJobseekWaitDura() {
		return jobseekWaitDura;
	}
	public void setJobseekWaitDura(String jobseekWaitDura) {
		this.jobseekWaitDura = jobseekWaitDura;
	}
	public String getFileGrpSeq() {
		return fileGrpSeq;
	}
	public void setFileGrpSeq(String fileGrpSeq) {
		this.fileGrpSeq = fileGrpSeq;
	}
	public String getProLicnsYn() {
		return proLicnsYn;
	}
	public void setProLicnsYn(String proLicnsYn) {
		this.proLicnsYn = proLicnsYn;
	}
	public String getProLicnsSpec() {
		return proLicnsSpec;
	}
	public void setProLicnsSpec(String proLicnsSpec) {
		this.proLicnsSpec = proLicnsSpec;
	}
	public String getCareerYn() {
		return careerYn;
	}
	public void setCareerYn(String careerYn) {
		this.careerYn = careerYn;
	}
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
	public String getJcUserModDt() {
		return jcUserModDt;
	}
	public void setJcUserModDt(String jcUserModDt) {
		this.jcUserModDt = jcUserModDt;
	}
	public String getJcVerityUserSeq() {
		return jcVerityUserSeq;
	}
	public void setJcVerityUserSeq(String jcVerityUserSeq) {
		this.jcVerityUserSeq = jcVerityUserSeq;
	}
	public String getJcNote() {
		return jcNote;
	}
	public void setJcNote(String jcNote) {
		this.jcNote = jcNote;
	}
	public String getUploadCv() {
		return uploadCv;
	}
	public void setUploadCv(String uploadCv) {
		this.uploadCv = uploadCv;
	}
	public String getStepInput() {
		return stepInput;
	}
	public void setStepInput(String stepInput) {
		this.stepInput = stepInput;
	}
	public String getMobileId() {
		return mobileId;
	}
	public void setMobileId(String mobileId) {
		this.mobileId = mobileId;
	}
	public String getResumeStsCd() {
		return resumeStsCd;
	}
	public void setResumeStsCd(String resumeStsCd) {
		this.resumeStsCd = resumeStsCd;
	}
	public String getLastModDt() {
		return lastModDt;
	}
	public void setLastModDt(String lastModDt) {
		this.lastModDt = lastModDt;
	}
	public String getJcUserSeq() {
		return jcUserSeq;
	}
	public void setJcUserSeq(String jcUserSeq) {
		this.jcUserSeq = jcUserSeq;
	}
	public String getLangUseCd() {
		return langUseCd;
	}
	public void setLangUseCd(String langUseCd) {
		this.langUseCd = langUseCd;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getPriResumeYn() {
		return priResumeYn;
	}
	public void setPriResumeYn(String priResumeYn) {
		this.priResumeYn = priResumeYn;
	}
	public String getResumeKeyword() {
		return resumeKeyword;
	}
	public void setResumeKeyword(String resumeKeyword) {
		this.resumeKeyword = resumeKeyword;
	}
	public String getPreferJobTitle() {
		return preferJobTitle;
	}
	public void setPreferJobTitle(String preferJobTitle) {
		this.preferJobTitle = preferJobTitle;
	}
	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
	}
	public String getIsicCd() {
		return isicCd;
	}
	public void setIsicCd(String isicCd) {
		this.isicCd = isicCd;
	}
	public String getEmployFormCd() {
		return employFormCd;
	}
	public void setEmployFormCd(String employFormCd) {
		this.employFormCd = employFormCd;
	}
	public String getPreferEmployTypeCd() {
		return preferEmployTypeCd;
	}
	public void setPreferEmployTypeCd(String preferEmployTypeCd) {
		this.preferEmployTypeCd = preferEmployTypeCd;
	}
	public String getTypeEmployHourDay() {
		return typeEmployHourDay;
	}
	public void setTypeEmployHourDay(String typeEmployHourDay) {
		this.typeEmployHourDay = typeEmployHourDay;
	}
	public String getTypeEmployDayWeek() {
		return typeEmployDayWeek;
	}
	public void setTypeEmployDayWeek(String typeEmployDayWeek) {
		this.typeEmployDayWeek = typeEmployDayWeek;
	}
	public String getPreferCrtctTerms() {
		return preferCrtctTerms;
	}
	public void setPreferCrtctTerms(String preferCrtctTerms) {
		this.preferCrtctTerms = preferCrtctTerms;
	}
	public String getPreferCrtctTermsDura() {
		return preferCrtctTermsDura;
	}
	public void setPreferCrtctTermsDura(String preferCrtctTermsDura) {
		this.preferCrtctTermsDura = preferCrtctTermsDura;
	}
	public String getPreferCrtctType() {
		return preferCrtctType;
	}
	public void setPreferCrtctType(String preferCrtctType) {
		this.preferCrtctType = preferCrtctType;
	}
	public String getNightWorkYn() {
		return nightWorkYn;
	}
	public void setNightWorkYn(String nightWorkYn) {
		this.nightWorkYn = nightWorkYn;
	}
	public String getOverTimeWorkYn() {
		return overTimeWorkYn;
	}
	public void setOverTimeWorkYn(String overTimeWorkYn) {
		this.overTimeWorkYn = overTimeWorkYn;
	}
	public String getHldayWorkYn() {
		return hldayWorkYn;
	}
	public void setHldayWorkYn(String hldayWorkYn) {
		this.hldayWorkYn = hldayWorkYn;
	}
	public String getExpctMinSalaryAmt() {
		return expctMinSalaryAmt;
	}
	public void setExpctMinSalaryAmt(String expctMinSalaryAmt) {
		this.expctMinSalaryAmt = expctMinSalaryAmt;
	}
	public String getExpctMaxSalaryAmt() {
		return expctMaxSalaryAmt;
	}
	public void setExpctMaxSalaryAmt(String expctMaxSalaryAmt) {
		this.expctMaxSalaryAmt = expctMaxSalaryAmt;
	}
	public String getExpctSalaryTypeCd() {
		return expctSalaryTypeCd;
	}
	public void setExpctSalaryTypeCd(String expctSalaryTypeCd) {
		this.expctSalaryTypeCd = expctSalaryTypeCd;
	}
	public String getDiffProvcWorkYn() {
		return diffProvcWorkYn;
	}
	public void setDiffProvcWorkYn(String diffProvcWorkYn) {
		this.diffProvcWorkYn = diffProvcWorkYn;
	}
	public String getWorkBgnAbleYn() {
		return workBgnAbleYn;
	}
	public void setWorkBgnAbleYn(String workBgnAbleYn) {
		this.workBgnAbleYn = workBgnAbleYn;
	}
	public String getWorkBgnAbleWithin() {
		return workBgnAbleWithin;
	}
	public void setWorkBgnAbleWithin(String workBgnAbleWithin) {
		this.workBgnAbleWithin = workBgnAbleWithin;
	}
	public String getJobskReqYn() {
		return jobskReqYn;
	}
	public void setJobskReqYn(String jobskReqYn) {
		this.jobskReqYn = jobskReqYn;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getBirthAddrDtl() {
		return birthAddrDtl;
	}
	public void setBirthAddrDtl(String birthAddrDtl) {
		this.birthAddrDtl = birthAddrDtl;
	}
	public String getPreferDayMon() {
		return preferDayMon;
	}
	public void setPreferDayMon(String preferDayMon) {
		this.preferDayMon = preferDayMon;
	}
	public String getPreferDayTue() {
		return preferDayTue;
	}
	public void setPreferDayTue(String preferDayTue) {
		this.preferDayTue = preferDayTue;
	}
	public String getPreferDayWed() {
		return preferDayWed;
	}
	public void setPreferDayWed(String preferDayWed) {
		this.preferDayWed = preferDayWed;
	}
	public String getPreferDayThu() {
		return preferDayThu;
	}
	public void setPreferDayThu(String preferDayThu) {
		this.preferDayThu = preferDayThu;
	}
	public String getPreferDayFri() {
		return preferDayFri;
	}
	public void setPreferDayFri(String preferDayFri) {
		this.preferDayFri = preferDayFri;
	}
	public String getPreferDaySat() {
		return preferDaySat;
	}
	public void setPreferDaySat(String preferDaySat) {
		this.preferDaySat = preferDaySat;
	}
	public String getPreferDaySun() {
		return preferDaySun;
	}
	public void setPreferDaySun(String preferDaySun) {
		this.preferDaySun = preferDaySun;
	}
	public String getPreferPosition() {
		return preferPosition;
	}
	public void setPreferPosition(String preferPosition) {
		this.preferPosition = preferPosition;
	}
	public String getAddrFullCd() {
		return addrFullCd;
	}
	public void setAddrFullCd(String addrFullCd) {
		this.addrFullCd = addrFullCd;
	}
	public String getAddrFullNm() {
		return addrFullNm;
	}
	public void setAddrFullNm(String addrFullNm) {
		this.addrFullNm = addrFullNm;
	}
	public String getAddrNm() {
		return addrNm;
	}
	public void setAddrNm(String addrNm) {
		this.addrNm = addrNm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getGenderNm() {
		return genderNm;
	}
	public void setGenderNm(String genderNm) {
		this.genderNm = genderNm;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getEduDegreeNm() {
		return eduDegreeNm;
	}
	public void setEduDegreeNm(String eduDegreeNm) {
		this.eduDegreeNm = eduDegreeNm;
	}
	public String getDisplayYn() {
		return displayYn;
	}
	public void setDisplayYn(String displayYn) {
		this.displayYn = displayYn;
	}

}
