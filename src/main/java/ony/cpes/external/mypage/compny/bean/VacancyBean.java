package ony.cpes.external.mypage.compny.bean;//


import java.util.List;

import ony.cmm.common.bean.CommonBean;
import ony.cmm.common.bean.FileBean;//


/**
 * board bean
 * @author kwon
 * @since
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일           수정자     수정내용
 *  ------------- -------- ---------------------------
 *  2019.10.17 KWON
 *
 * </pre>
 */
public class VacancyBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;//

	private String iscedCd;//ISCED_코드(ISCED_CD)
	private String iscedNm;//ISCED_코드(ISCED_CD)
	private String iscoCd;//ISCO_코드(ISCO_CD)
	private String iscoNm;//ISCO_코드(ISCO_CD)
	private String isicCd;//ISIC_코드
	private String isicNm;//ISIC_코드
	private String jcUserSeq;//JOB_CENTER_사용자_시퀀스
	private String jcModDt;//JOB_CENTER_수정_날짜
	private String jcModUserSeq;//JOB_CENTER_수정_사용자_시퀀스
	private String jcAgreeYn;//JOB_CENTER_승인_여부_YN
	private String jcCd;//JOB_CENTER_코드(JC_CD)
	private String jcNm;//JOB_CENTER_코드(JC_CD)
	private String nssfYn;//NSSF_YN
	private String probtDura;//견습_기간
	private String probtYn;//견습_여부_YN
	private String employCtrctDura;//고용_계약_기간
	private String employCtrctTypeCd;//고용_계약_유형_코드(EMPLOY_CRTCT_TYPE_CD)
	private String employCtrctTypeNm;//고용_계약_유형_코드(EMPLOY_CRTCT_TYPE_CD)
	private String employCtrctCd;//고용_계약_코드(EMPLOY_CRTCT_CD)
	private String employCtrctNm;//고용_계약_코드(EMPLOY_CRTCT_CD)
	private String employFormCd;//고용_형태_코드(EMPLOY_FROM_CD)
	private String employFormNm;//고용_형태_코드(EMPLOY_FROM_CD)
	private String employerSign;//고용주_서명
	private String hldayWorkYn;//공휴일_근무_여부_YN
	private String vacancyStsCd;//구인_상태_코드(VACANCY_STS_CD)
	private String vacancyStsNm;//구인_상태_코드(VACANCY_STS_CD)
	private String vacancySeq;//구인_시퀀스
	private String vacancyId;//구인_아이디
	private String vacancyCertNo;//구인_인증_번호
	private String vacancyTitle;//구인_제목
	private String workHourCd;//근무_시간_코드(WORK_TIME_CD)
	private String workHourNm;//근무_시간_코드(WORK_TIME_CD)
	private String workBgnDt;//근무_시작_날짜
	private String workNightBgnTime;//근무_야간_시작_시간
	private String workNightEndTime;//근무_야간_종료_시간
	private String workMornBgnTime;//근무_오전_시작_시간
	private String workMornEndTime;//근무_오전_종료_시간
	private String workAfternnBgnTime;//근무_오후_시작_시간
	private String workAfternnEndTime;//근무_오후_종료_시간
	private String salaryUnitCd;//급여_단위_코드(SALARY_UNIT_CD)
	private String salaryUnitNm;//급여_단위_코드(SALARY_UNIT_CD)
	private String compnySeq;//기업_시퀀스
	private String compnyId;//기업_아이디
	private String etcWorkExp;//기타_근무_경험
	private String etcSkillReq;//기타_능력_요구
	private String etcInsuSpec;//기타_보험_사양
	private String etcInsuYn;//기타_보험_여부_YN
	private String etcPref;//기타_우대

	private String recrumtDiffcltYn;//모집_어려움_여부_YN
	private String recrumtMemb;//모집_인원
	private String bkmkCnt;//북마크_카운트
	private String useYn;//사용_여부

	private String bgnDt;//시작_날짜
	private String nightWorkSpec;//야간_근무_사양
	private String nightWorkYn;//야간_근무_여부_YN
	private String diffcltReason;//어려움_사유
	private String langCd;//언어_코드(업무설명LANG_CD)
	private String langNm;//언어_코드(업무설명LANG_CD)
	private String workExpln;//업무설명
	private String videoIntvwYn;//영상_면접_여부_YN
	private String duty;//의무
	private String internYn;//인턴_여부_YN
	private String proLicnsNm;//전문_자격증_명
	private String proLicnsYn;//전문_자격증_여부_YN
	private String recptMethod;//접수_방법
	private String endDt;//종료_날짜
	private String weekWorkDay;//주간_근무_하루
	private String jobDesc;//직업_기술
	private String spot;//직위
	private String rspnsb;//책임
	private String overWorkYn;//초과_근무_여부_YN
	private String maxSalaryAmt;//최고_급여_금액
	private String minEduDegreeCd;//최소_교육_정도_코드(EDU_DEGREE_CD)
	private String minEduDegreeNm;//최소_교육_정도_코드(EDU_DEGREE_CD)
	private String minWorkExp;//최소_근무_경험
	private String minSalaryAmt;//최저_급여_금액
	private String flexWorkYn;//탄력_근무_여부_YN
	private String dayWorkTime;//하루_근무_시간
	private String trnngDura;//훈련_기간
	private String trnngYn;//훈련_여부_YN
	private String likeYn;//좋아요_YN
	private String bkmkYn;//북마크_YN
	private String preferEmploymtTypeCd;//고용_형태_코드
	private String preferEmploymtTypeNm;//고용_형태_코드
	private String expctSalaryCd;//급여형태코드

	private String recrumtJobRefKnow;//모집_직종_관련_지식
	private String recrumtJobRefBasicSkill;//모집_직정_관련_기본_기술
	private String recrumtJobRefWorkNeedItem;//모집_직종_관련_업무_필요_항목
	private String etc;//기타
	private String preferntCondCd;//우대조건
	private String preferntCondNm;//우대조건
	private String mngerNm;//담당자_명
	private String mngerEmail;//담당자_이메일
	private String mngerCell;//담당자_연락
	private String imgFileGrpSeq;//이미지_파일_그룹_시퀀스
	private String resumeFileGrpSeq;//이력서_파일_그룹_시퀀스
	private String vacancyCloseDt;//
	private String vacancyKeyword;//
	private String vacancyTypeCd;//
	private String vacancyTypeNm;//
	private String nssfSpec;//
	private String jcAgreeDt;//
	private String jcAgreeStsCd;//
	private String jcAgreeStsNm;//
	private String minEduDegreeYn;//최소_교육_정도_여부
	private String minWorkExpYn;
	private String tempSeq;//임시저장번호
	private int jobTotCnt;//
	private int notOpenCnt;//
	private int checkCnt;//
	private int docCnt;//
	private int yesCnt;//


	private String remainDt;//
	private String compnyTypeNm;//
	private String compnyNm;//
	private String compnyIscoNm;//
	private String addrFullNm;//
	private String compnyWebsite;//
	private int compnyBmkCnt;//
	private String modifyYn;
	private String copyYn;
	private String tempYn;
	private int continueCnt;
	private int endCnt;
	private int waitCnt;
	private int tempCnt;
	private int totCnt;
	private int intvwCnt;
	private String statNm;
	private String addrNm;
	private String fairSeq;
	private String bkmkSeq;//임시저장번호
	private String iscedCdLvlOne;
	private String isicCdLvlOne;
	private String remainDiv;
	private String failReason;


	private String originalNm;

	private VacancyLangBean vacancyLangBean;
	private VacancyPreferntBean vacancyPreferntBean;
	private VacancyLocBean vacancyLocBean;


	private List<VacancyLangBean> vacancyLangBeanList;
	private List<VacancyPreferntBean> vacancyPreferntBeanList;
	private List<VacancyLocBean> vacancyLocBeanList;
	private List<FileBean> fileList;

	public String getOriginalNm() {
		return originalNm;
	}
	public void setOriginalNm(String originalNm) {
		this.originalNm = originalNm;
	}
	public List<FileBean> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileBean> fileList) {
		this.fileList = fileList;
	}
	private String addrCd;

	public String getAddrCd() {
		return addrCd;
	}
	public void setAddrCd(String addrCd) {
		this.addrCd = addrCd;
	}
	public String getIscedCd() {
		return iscedCd;
	}
	public void setIscedCd(String iscedCd) {
		this.iscedCd = iscedCd;
	}
	public String getIscedNm() {
		return iscedNm;
	}
	public void setIscedNm(String iscedNm) {
		this.iscedNm = iscedNm;
	}
	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
	}
	public String getIscoNm() {
		return iscoNm;
	}
	public void setIscoNm(String iscoNm) {
		this.iscoNm = iscoNm;
	}
	public String getIsicCd() {
		return isicCd;
	}
	public void setIsicCd(String isicCd) {
		this.isicCd = isicCd;
	}
	public String getIsicNm() {
		return isicNm;
	}
	public void setIsicNm(String isicNm) {
		this.isicNm = isicNm;
	}
	public String getJcUserSeq() {
		return jcUserSeq;
	}
	public void setJcUserSeq(String jcUserSeq) {
		this.jcUserSeq = jcUserSeq;
	}
	public String getJcModDt() {
		return jcModDt;
	}
	public void setJcModDt(String jcModDt) {
		this.jcModDt = jcModDt;
	}
	public String getJcModUserSeq() {
		return jcModUserSeq;
	}
	public void setJcModUserSeq(String jcModUserSeq) {
		this.jcModUserSeq = jcModUserSeq;
	}
	public String getJcAgreeYn() {
		return jcAgreeYn;
	}
	public void setJcAgreeYn(String jcAgreeYn) {
		this.jcAgreeYn = jcAgreeYn;
	}
	public String getJcCd() {
		return jcCd;
	}
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	public String getJcNm() {
		return jcNm;
	}
	public void setJcNm(String jcNm) {
		this.jcNm = jcNm;
	}
	public String getNssfYn() {
		return nssfYn;
	}
	public void setNssfYn(String nssfYn) {
		this.nssfYn = nssfYn;
	}
	public String getProbtDura() {
		return probtDura;
	}
	public void setProbtDura(String probtDura) {
		this.probtDura = probtDura;
	}
	public String getProbtYn() {
		return probtYn;
	}
	public void setProbtYn(String probtYn) {
		this.probtYn = probtYn;
	}
	public String getEmployCtrctDura() {
		return employCtrctDura;
	}
	public void setEmployCtrctDura(String employCtrctDura) {
		this.employCtrctDura = employCtrctDura;
	}
	public String getEmployCtrctTypeCd() {
		return employCtrctTypeCd;
	}
	public void setEmployCtrctTypeCd(String employCtrctTypeCd) {
		this.employCtrctTypeCd = employCtrctTypeCd;
	}
	public String getEmployCtrctTypeNm() {
		return employCtrctTypeNm;
	}
	public void setEmployCtrctTypeNm(String employCtrctTypeNm) {
		this.employCtrctTypeNm = employCtrctTypeNm;
	}
	public String getEmployCtrctCd() {
		return employCtrctCd;
	}
	public void setEmployCtrctCd(String employCtrctCd) {
		this.employCtrctCd = employCtrctCd;
	}
	public String getEmployCtrctNm() {
		return employCtrctNm;
	}
	public void setEmployCtrctNm(String employCtrctNm) {
		this.employCtrctNm = employCtrctNm;
	}
	public String getEmployFormCd() {
		return employFormCd;
	}
	public void setEmployFormCd(String employFormCd) {
		this.employFormCd = employFormCd;
	}
	public String getEmployFormNm() {
		return employFormNm;
	}
	public void setEmployFormNm(String employFormNm) {
		this.employFormNm = employFormNm;
	}
	public String getEmployerSign() {
		return employerSign;
	}
	public void setEmployerSign(String employerSign) {
		this.employerSign = employerSign;
	}
	public String getHldayWorkYn() {
		return hldayWorkYn;
	}
	public void setHldayWorkYn(String hldayWorkYn) {
		this.hldayWorkYn = hldayWorkYn;
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
	public String getVacancySeq() {
		return vacancySeq;
	}
	public void setVacancySeq(String vacancySeq) {
		this.vacancySeq = vacancySeq;
	}
	public String getVacancyId() {
		return vacancyId;
	}
	public void setVacancyId(String vacancyId) {
		this.vacancyId = vacancyId;
	}
	public String getVacancyCertNo() {
		return vacancyCertNo;
	}
	public void setVacancyCertNo(String vacancyCertNo) {
		this.vacancyCertNo = vacancyCertNo;
	}
	public String getVacancyTitle() {
		return vacancyTitle;
	}
	public void setVacancyTitle(String vacancyTitle) {
		this.vacancyTitle = vacancyTitle;
	}
	public String getWorkHourCd() {
		return workHourCd;
	}
	public void setWorkHourCd(String workHourCd) {
		this.workHourCd = workHourCd;
	}
	public String getWorkHourNm() {
		return workHourNm;
	}
	public void setWorkHourNm(String workHourNm) {
		this.workHourNm = workHourNm;
	}
	public String getWorkBgnDt() {
		return workBgnDt;
	}
	public void setWorkBgnDt(String workBgnDt) {
		this.workBgnDt = workBgnDt;
	}
	public String getWorkNightBgnTime() {
		return workNightBgnTime;
	}
	public void setWorkNightBgnTime(String workNightBgnTime) {
		this.workNightBgnTime = workNightBgnTime;
	}
	public String getWorkNightEndTime() {
		return workNightEndTime;
	}
	public void setWorkNightEndTime(String workNightEndTime) {
		this.workNightEndTime = workNightEndTime;
	}
	public String getWorkMornBgnTime() {
		return workMornBgnTime;
	}
	public void setWorkMornBgnTime(String workMornBgnTime) {
		this.workMornBgnTime = workMornBgnTime;
	}
	public String getWorkMornEndTime() {
		return workMornEndTime;
	}
	public void setWorkMornEndTime(String workMornEndTime) {
		this.workMornEndTime = workMornEndTime;
	}
	public String getWorkAfternnBgnTime() {
		return workAfternnBgnTime;
	}
	public void setWorkAfternnBgnTime(String workAfternnBgnTime) {
		this.workAfternnBgnTime = workAfternnBgnTime;
	}
	public String getWorkAfternnEndTime() {
		return workAfternnEndTime;
	}
	public void setWorkAfternnEndTime(String workAfternnEndTime) {
		this.workAfternnEndTime = workAfternnEndTime;
	}
	public String getSalaryUnitCd() {
		return salaryUnitCd;
	}
	public void setSalaryUnitCd(String salaryUnitCd) {
		this.salaryUnitCd = salaryUnitCd;
	}
	public String getSalaryUnitNm() {
		return salaryUnitNm;
	}
	public void setSalaryUnitNm(String salaryUnitNm) {
		this.salaryUnitNm = salaryUnitNm;
	}
	public String getCompnySeq() {
		return compnySeq;
	}
	public void setCompnySeq(String compnySeq) {
		this.compnySeq = compnySeq;
	}
	public String getCompnyId() {
		return compnyId;
	}
	public void setCompnyId(String compnyId) {
		this.compnyId = compnyId;
	}
	public String getEtcWorkExp() {
		return etcWorkExp;
	}
	public void setEtcWorkExp(String etcWorkExp) {
		this.etcWorkExp = etcWorkExp;
	}
	public String getEtcSkillReq() {
		return etcSkillReq;
	}
	public void setEtcSkillReq(String etcSkillReq) {
		this.etcSkillReq = etcSkillReq;
	}
	public String getEtcInsuSpec() {
		return etcInsuSpec;
	}
	public void setEtcInsuSpec(String etcInsuSpec) {
		this.etcInsuSpec = etcInsuSpec;
	}
	public String getEtcInsuYn() {
		return etcInsuYn;
	}
	public void setEtcInsuYn(String etcInsuYn) {
		this.etcInsuYn = etcInsuYn;
	}
	public String getEtcPref() {
		return etcPref;
	}
	public void setEtcPref(String etcPref) {
		this.etcPref = etcPref;
	}
	public String getRecrumtDiffcltYn() {
		return recrumtDiffcltYn;
	}
	public void setRecrumtDiffcltYn(String recrumtDiffcltYn) {
		this.recrumtDiffcltYn = recrumtDiffcltYn;
	}
	public String getRecrumtMemb() {
		return recrumtMemb;
	}
	public void setRecrumtMemb(String recrumtMemb) {
		this.recrumtMemb = recrumtMemb;
	}
	public String getBkmkCnt() {
		return bkmkCnt;
	}
	public void setBkmkCnt(String bkmkCnt) {
		this.bkmkCnt = bkmkCnt;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getBgnDt() {
		return bgnDt;
	}
	public void setBgnDt(String bgnDt) {
		this.bgnDt = bgnDt;
	}
	public String getNightWorkSpec() {
		return nightWorkSpec;
	}
	public void setNightWorkSpec(String nightWorkSpec) {
		this.nightWorkSpec = nightWorkSpec;
	}
	public String getNightWorkYn() {
		return nightWorkYn;
	}
	public void setNightWorkYn(String nightWorkYn) {
		this.nightWorkYn = nightWorkYn;
	}
	public String getDiffcltReason() {
		return diffcltReason;
	}
	public void setDiffcltReason(String diffcltReason) {
		this.diffcltReason = diffcltReason;
	}
	public String getLangCd() {
		return langCd;
	}
	public void setLangCd(String langCd) {
		this.langCd = langCd;
	}
	public String getLangNm() {
		return langNm;
	}
	public void setLangNm(String langNm) {
		this.langNm = langNm;
	}
	public String getWorkExpln() {
		return workExpln;
	}
	public void setWorkExpln(String workExpln) {
		this.workExpln = workExpln;
	}
	public String getVideoIntvwYn() {
		return videoIntvwYn;
	}
	public void setVideoIntvwYn(String videoIntvwYn) {
		this.videoIntvwYn = videoIntvwYn;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getInternYn() {
		return internYn;
	}
	public void setInternYn(String internYn) {
		this.internYn = internYn;
	}
	public String getProLicnsNm() {
		return proLicnsNm;
	}
	public void setProLicnsNm(String proLicnsNm) {
		this.proLicnsNm = proLicnsNm;
	}
	public String getProLicnsYn() {
		return proLicnsYn;
	}
	public void setProLicnsYn(String proLicnsYn) {
		this.proLicnsYn = proLicnsYn;
	}
	public String getRecptMethod() {
		return recptMethod;
	}
	public void setRecptMethod(String recptMethod) {
		this.recptMethod = recptMethod;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public String getWeekWorkDay() {
		return weekWorkDay;
	}
	public void setWeekWorkDay(String weekWorkDay) {
		this.weekWorkDay = weekWorkDay;
	}
	public String getJobDesc() {
		return jobDesc;
	}
	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}
	public String getSpot() {
		return spot;
	}
	public void setSpot(String spot) {
		this.spot = spot;
	}
	public String getRspnsb() {
		return rspnsb;
	}
	public void setRspnsb(String rspnsb) {
		this.rspnsb = rspnsb;
	}
	public String getOverWorkYn() {
		return overWorkYn;
	}
	public void setOverWorkYn(String overWorkYn) {
		this.overWorkYn = overWorkYn;
	}
	public String getMaxSalaryAmt() {
		return maxSalaryAmt;
	}
	public void setMaxSalaryAmt(String maxSalaryAmt) {
		this.maxSalaryAmt = maxSalaryAmt;
	}
	public String getMinEduDegreeCd() {
		return minEduDegreeCd;
	}
	public void setMinEduDegreeCd(String minEduDegreeCd) {
		this.minEduDegreeCd = minEduDegreeCd;
	}
	public String getMinEduDegreeNm() {
		return minEduDegreeNm;
	}
	public void setMinEduDegreeNm(String minEduDegreeNm) {
		this.minEduDegreeNm = minEduDegreeNm;
	}
	public String getMinWorkExp() {
		return minWorkExp;
	}
	public void setMinWorkExp(String minWorkExp) {
		this.minWorkExp = minWorkExp;
	}
	public String getMinSalaryAmt() {
		return minSalaryAmt;
	}
	public void setMinSalaryAmt(String minSalaryAmt) {
		this.minSalaryAmt = minSalaryAmt;
	}
	public String getFlexWorkYn() {
		return flexWorkYn;
	}
	public void setFlexWorkYn(String flexWorkYn) {
		this.flexWorkYn = flexWorkYn;
	}
	public String getDayWorkTime() {
		return dayWorkTime;
	}
	public void setDayWorkTime(String dayWorkTime) {
		this.dayWorkTime = dayWorkTime;
	}
	public String getTrnngDura() {
		return trnngDura;
	}
	public void setTrnngDura(String trnngDura) {
		this.trnngDura = trnngDura;
	}
	public String getTrnngYn() {
		return trnngYn;
	}
	public void setTrnngYn(String trnngYn) {
		this.trnngYn = trnngYn;
	}
	public String getLikeYn() {
		return likeYn;
	}
	public void setLikeYn(String likeYn) {
		this.likeYn = likeYn;
	}
	public String getBkmkYn() {
		return bkmkYn;
	}
	public void setBkmkYn(String bkmkYn) {
		this.bkmkYn = bkmkYn;
	}
	public String getPreferEmploymtTypeCd() {
		return preferEmploymtTypeCd;
	}
	public void setPreferEmploymtTypeCd(String preferEmploymtTypeCd) {
		this.preferEmploymtTypeCd = preferEmploymtTypeCd;
	}
	public String getPreferEmploymtTypeNm() {
		return preferEmploymtTypeNm;
	}
	public void setPreferEmploymtTypeNm(String preferEmploymtTypeNm) {
		this.preferEmploymtTypeNm = preferEmploymtTypeNm;
	}
	public String getExpctSalaryCd() {
		return expctSalaryCd;
	}
	public void setExpctSalaryCd(String expctSalaryCd) {
		this.expctSalaryCd = expctSalaryCd;
	}
	public String getRecrumtJobRefKnow() {
		return recrumtJobRefKnow;
	}
	public void setRecrumtJobRefKnow(String recrumtJobRefKnow) {
		this.recrumtJobRefKnow = recrumtJobRefKnow;
	}
	public String getRecrumtJobRefBasicSkill() {
		return recrumtJobRefBasicSkill;
	}
	public void setRecrumtJobRefBasicSkill(String recrumtJobRefBasicSkill) {
		this.recrumtJobRefBasicSkill = recrumtJobRefBasicSkill;
	}
	public String getRecrumtJobRefWorkNeedItem() {
		return recrumtJobRefWorkNeedItem;
	}
	public void setRecrumtJobRefWorkNeedItem(String recrumtJobRefWorkNeedItem) {
		this.recrumtJobRefWorkNeedItem = recrumtJobRefWorkNeedItem;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getPreferntCondCd() {
		return preferntCondCd;
	}
	public void setPreferntCondCd(String preferntCondCd) {
		this.preferntCondCd = preferntCondCd;
	}
	public String getPreferntCondNm() {
		return preferntCondNm;
	}
	public void setPreferntCondNm(String preferntCondNm) {
		this.preferntCondNm = preferntCondNm;
	}
	public String getMngerNm() {
		return mngerNm;
	}
	public void setMngerNm(String mngerNm) {
		this.mngerNm = mngerNm;
	}
	public String getMngerEmail() {
		return mngerEmail;
	}
	public void setMngerEmail(String mngerEmail) {
		this.mngerEmail = mngerEmail;
	}
	public String getMngerCell() {
		return mngerCell;
	}
	public void setMngerCell(String mngerCell) {
		this.mngerCell = mngerCell;
	}
	public String getImgFileGrpSeq() {
		return imgFileGrpSeq;
	}
	public void setImgFileGrpSeq(String imgFileGrpSeq) {
		this.imgFileGrpSeq = imgFileGrpSeq;
	}
	public String getResumeFileGrpSeq() {
		return resumeFileGrpSeq;
	}
	public void setResumeFileGrpSeq(String resumeFileGrpSeq) {
		this.resumeFileGrpSeq = resumeFileGrpSeq;
	}
	public String getVacancyCloseDt() {
		return vacancyCloseDt;
	}
	public void setVacancyCloseDt(String vacancyCloseDt) {
		this.vacancyCloseDt = vacancyCloseDt;
	}
	public String getVacancyKeyword() {
		return vacancyKeyword;
	}
	public void setVacancyKeyword(String vacancyKeyword) {
		this.vacancyKeyword = vacancyKeyword;
	}
	public String getVacancyTypeCd() {
		return vacancyTypeCd;
	}
	public void setVacancyTypeCd(String vacancyTypeCd) {
		this.vacancyTypeCd = vacancyTypeCd;
	}
	public String getVacancyTypeNm() {
		return vacancyTypeNm;
	}
	public void setVacancyTypeNm(String vacancyTypeNm) {
		this.vacancyTypeNm = vacancyTypeNm;
	}
	public String getNssfSpec() {
		return nssfSpec;
	}
	public void setNssfSpec(String nssfSpec) {
		this.nssfSpec = nssfSpec;
	}
	public String getJcAgreeDt() {
		return jcAgreeDt;
	}
	public void setJcAgreeDt(String jcAgreeDt) {
		this.jcAgreeDt = jcAgreeDt;
	}
	public String getJcAgreeStsCd() {
		return jcAgreeStsCd;
	}
	public void setJcAgreeStsCd(String jcAgreeStsCd) {
		this.jcAgreeStsCd = jcAgreeStsCd;
	}
	public String getJcAgreeStsNm() {
		return jcAgreeStsNm;
	}
	public void setJcAgreeStsNm(String jcAgreeStsNm) {
		this.jcAgreeStsNm = jcAgreeStsNm;
	}
	public String getMinEduDegreeYn() {
		return minEduDegreeYn;
	}
	public void setMinEduDegreeYn(String minEduDegreeYn) {
		this.minEduDegreeYn = minEduDegreeYn;
	}
	public String getMinWorkExpYn() {
		return minWorkExpYn;
	}
	public void setMinWorkExpYn(String minWorkExpYn) {
		this.minWorkExpYn = minWorkExpYn;
	}
	public String getTempSeq() {
		return tempSeq;
	}
	public void setTempSeq(String tempSeq) {
		this.tempSeq = tempSeq;
	}
	public String getCompnyNm() {
		return compnyNm;
	}
	public void setCompnyNm(String compnyNm) {
		this.compnyNm = compnyNm;
	}
	public int getJobTotCnt() {
		return jobTotCnt;
	}
	public void setJobTotCnt(int jobTotCnt) {
		this.jobTotCnt = jobTotCnt;
	}
	public int getNotOpenCnt() {
		return notOpenCnt;
	}
	public void setNotOpenCnt(int notOpenCnt) {
		this.notOpenCnt = notOpenCnt;
	}
	public int getCheckCnt() {
		return checkCnt;
	}
	public void setCheckCnt(int checkCnt) {
		this.checkCnt = checkCnt;
	}
	public int getDocCnt() {
		return docCnt;
	}
	public void setDocCnt(int docCnt) {
		this.docCnt = docCnt;
	}
	public int getYesCnt() {
		return yesCnt;
	}
	public void setYesCnt(int yesCnt) {
		this.yesCnt = yesCnt;
	}
	public VacancyLangBean getVacancyLangBean() {
		return vacancyLangBean;
	}
	public void setVacancyLangBean(VacancyLangBean vacancyLangBean) {
		this.vacancyLangBean = vacancyLangBean;
	}
	public VacancyPreferntBean getVacancyPreferntBean() {
		return vacancyPreferntBean;
	}
	public void setVacancyPreferntBean(VacancyPreferntBean vacancyPreferntBean) {
		this.vacancyPreferntBean = vacancyPreferntBean;
	}
	public VacancyLocBean getVacancyLocBean() {
		return vacancyLocBean;
	}
	public void setVacancyLocBean(VacancyLocBean vacancyLocBean) {
		this.vacancyLocBean = vacancyLocBean;
	}
	public List<VacancyLangBean> getVacancyLangBeanList() {
		return vacancyLangBeanList;
	}
	public void setVacancyLangBeanList(List<VacancyLangBean> vacancyLangBeanList) {
		this.vacancyLangBeanList = vacancyLangBeanList;
	}
	public List<VacancyPreferntBean> getVacancyPreferntBeanList() {
		return vacancyPreferntBeanList;
	}
	public void setVacancyPreferntBeanList(List<VacancyPreferntBean> vacancyPreferntBeanList) {
		this.vacancyPreferntBeanList = vacancyPreferntBeanList;
	}
	public List<VacancyLocBean> getVacancyLocBeanList() {
		return vacancyLocBeanList;
	}
	public void setVacancyLocBeanList(List<VacancyLocBean> vacancyLocBeanList) {
		this.vacancyLocBeanList = vacancyLocBeanList;
	}
	public String getRemainDt() {
		return remainDt;
	}
	public void setRemainDt(String remainDt) {
		this.remainDt = remainDt;
	}
	public String getCompnyTypeNm() {
		return compnyTypeNm;
	}
	public void setCompnyTypeNm(String compnyTypeNm) {
		this.compnyTypeNm = compnyTypeNm;
	}
	public String getCompnyIscoNm() {
		return compnyIscoNm;
	}
	public void setCompnyIscoNm(String compnyIscoNm) {
		this.compnyIscoNm = compnyIscoNm;
	}
	public String getAddrFullNm() {
		return addrFullNm;
	}
	public void setAddrFullNm(String addrFullNm) {
		this.addrFullNm = addrFullNm;
	}
	public String getCompnyWebsite() {
		return compnyWebsite;
	}
	public void setCompnyWebsite(String compnyWebsite) {
		this.compnyWebsite = compnyWebsite;
	}
	public int getCompnyBmkCnt() {
		return compnyBmkCnt;
	}
	public void setCompnyBmkCnt(int compnyBmkCnt) {
		this.compnyBmkCnt = compnyBmkCnt;
	}
	public String getModifyYn() {
		return modifyYn;
	}
	public void setModifyYn(String modifyYn) {
		this.modifyYn = modifyYn;
	}
	public String getCopyYn() {
		return copyYn;
	}
	public void setCopyYn(String copyYn) {
		this.copyYn = copyYn;
	}
	public String getTempYn() {
		return tempYn;
	}
	public void setTempYn(String tempYn) {
		this.tempYn = tempYn;
	}
	public int getContinueCnt() {
		return continueCnt;
	}
	public void setContinueCnt(int continueCnt) {
		this.continueCnt = continueCnt;
	}
	public int getEndCnt() {
		return endCnt;
	}
	public void setEndCnt(int endCnt) {
		this.endCnt = endCnt;
	}
	public int getWaitCnt() {
		return waitCnt;
	}
	public void setWaitCnt(int waitCnt) {
		this.waitCnt = waitCnt;
	}
	public int getTempCnt() {
		return tempCnt;
	}
	public void setTempCnt(int tempCnt) {
		this.tempCnt = tempCnt;
	}
	public int getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	public String getStatNm() {
		return statNm;
	}
	public void setStatNm(String statNm) {
		this.statNm = statNm;
	}
	public String getAddrNm() {
		return addrNm;
	}
	public void setAddrNm(String addrNm) {
		this.addrNm = addrNm;
	}
	public String getFairSeq() {
		return fairSeq;
	}
	public void setFairSeq(String fairSeq) {
		this.fairSeq = fairSeq;
	}
	public String getBkmkSeq() {
		return bkmkSeq;
	}
	public void setBkmkSeq(String bkmkSeq) {
		this.bkmkSeq = bkmkSeq;
	}
	public String getIscedCdLvlOne() {
		return iscedCdLvlOne;
	}
	public void setIscedCdLvlOne(String iscedCdLvlOne) {
		this.iscedCdLvlOne = iscedCdLvlOne;
	}
	public String getIsicCdLvlOne() {
		return isicCdLvlOne;
	}
	public void setIsicCdLvlOne(String isicCdLvlOne) {
		this.isicCdLvlOne = isicCdLvlOne;
	}
	public String getRemainDiv() {
		return remainDiv;
	}
	public void setRemainDiv(String remainDiv) {
		this.remainDiv = remainDiv;
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





}
