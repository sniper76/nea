package ony.cpes.external.mypage.compny.bean;

import java.util.List;

import ony.cmm.common.bean.CommonBean;

public class VacancyMatchSetBean extends CommonBean {

	private String vacancyMatchSetSeq;
	private String compnySeq;
	private String employCtrctDecidCd;
	private String employCtrctUndecidCd;
	private String hopeSalary;
	private String minWorkExp;
	private String workTimeFullCd;
	private String workTimePartCd;
	private String modDt;
	private String modUserSeq;
	private String regDt;
	private String regUserSeq;

	private String iscoCd;
	private String locCd;
	private String minEduDegreeCd;
	private String preferntCondCd;
	private String langCd;

	List<VacancyMatchSetIscoBean> vacancyMatchSetIscoList = null;
	List<VacancyMatchSetLocBean> vacancyMatchSetLocList = null;
	List<VacancyMatchSetEduDegreeBean> vacancyMatchSetEduDegreeList = null;
	List<VacancyMatchSetLangBean> vacancyMatchSetLangList = null;
	List<VacancyMatchSetPreferntCondBean> vacancyMatchSetPreferntCondList = null;

	public String getVacancyMatchSetSeq() {
		return vacancyMatchSetSeq;
	}
	public void setVacancyMatchSetSeq(String vacancyMatchSetSeq) {
		this.vacancyMatchSetSeq = vacancyMatchSetSeq;
	}
	public String getCompnySeq() {
		return compnySeq;
	}
	public void setCompnySeq(String compnySeq) {
		this.compnySeq = compnySeq;
	}
	public String getEmployCtrctDecidCd() {
		return employCtrctDecidCd;
	}
	public void setEmployCtrctDecidCd(String employCtrctDecidCd) {
		this.employCtrctDecidCd = employCtrctDecidCd;
	}
	public String getEmployCtrctUndecidCd() {
		return employCtrctUndecidCd;
	}
	public void setEmployCtrctUndecidCd(String employCtrctUndecidCd) {
		this.employCtrctUndecidCd = employCtrctUndecidCd;
	}
	public String getHopeSalary() {
		return hopeSalary;
	}
	public void setHopeSalary(String hopeSalary) {
		this.hopeSalary = hopeSalary;
	}
	public String getMinWorkExp() {
		return minWorkExp;
	}
	public void setMinWorkExp(String minWorkExp) {
		this.minWorkExp = minWorkExp;
	}
	public String getWorkTimeFullCd() {
		return workTimeFullCd;
	}
	public void setWorkTimeFullCd(String workTimeFullCd) {
		this.workTimeFullCd = workTimeFullCd;
	}
	public String getWorkTimePartCd() {
		return workTimePartCd;
	}
	public void setWorkTimePartCd(String workTimePartCd) {
		this.workTimePartCd = workTimePartCd;
	}
	public String getModDt() {
		return modDt;
	}
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	public String getModUserSeq() {
		return modUserSeq;
	}
	public void setModUserSeq(String modUserSeq) {
		this.modUserSeq = modUserSeq;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getRegUserSeq() {
		return regUserSeq;
	}
	public void setRegUserSeq(String regUserSeq) {
		this.regUserSeq = regUserSeq;
	}

	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
	}
	public String getLocCd() {
		return locCd;
	}
	public void setLocCd(String locCd) {
		this.locCd = locCd;
	}
	public String getMinEduDegreeCd() {
		return minEduDegreeCd;
	}
	public void setMinEduDegreeCd(String minEduDegreeCd) {
		this.minEduDegreeCd = minEduDegreeCd;
	}
	public String getPreferntCondCd() {
		return preferntCondCd;
	}
	public void setPreferntCondCd(String preferntCondCd) {
		this.preferntCondCd = preferntCondCd;
	}
	public String getLangCd() {
		return langCd;
	}
	public void setLangCd(String langCd) {
		this.langCd = langCd;
	}

	public List<VacancyMatchSetIscoBean> getVacancyMatchSetIscoList() {
		return vacancyMatchSetIscoList;
	}
	public void setVacancyMatchSetIscoList(List<VacancyMatchSetIscoBean> vacancyMatchSetIscoList) {
		this.vacancyMatchSetIscoList = vacancyMatchSetIscoList;
	}
	public List<VacancyMatchSetLocBean> getVacancyMatchSetLocList() {
		return vacancyMatchSetLocList;
	}
	public void setVacancyMatchSetLocList(List<VacancyMatchSetLocBean> vacancyMatchSetLocList) {
		this.vacancyMatchSetLocList = vacancyMatchSetLocList;
	}
	public List<VacancyMatchSetEduDegreeBean> getVacancyMatchSetEduDegreeList() {
		return vacancyMatchSetEduDegreeList;
	}
	public void setVacancyMatchSetEduDegreeList(List<VacancyMatchSetEduDegreeBean> vacancyMatchSetEduDegreeList) {
		this.vacancyMatchSetEduDegreeList = vacancyMatchSetEduDegreeList;
	}
	public List<VacancyMatchSetLangBean> getVacancyMatchSetLangList() {
		return vacancyMatchSetLangList;
	}
	public void setVacancyMatchSetLangList(List<VacancyMatchSetLangBean> vacancyMatchSetLangList) {
		this.vacancyMatchSetLangList = vacancyMatchSetLangList;
	}
	public List<VacancyMatchSetPreferntCondBean> getVacancyMatchSetPreferntCondList() {
		return vacancyMatchSetPreferntCondList;
	}
	public void setVacancyMatchSetPreferntCondList(List<VacancyMatchSetPreferntCondBean> vacancyMatchSetPreferntCondList) {
		this.vacancyMatchSetPreferntCondList = vacancyMatchSetPreferntCondList;
	}

}
