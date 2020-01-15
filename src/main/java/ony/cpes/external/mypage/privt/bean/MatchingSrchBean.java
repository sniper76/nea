package ony.cpes.external.mypage.privt.bean;

import java.util.List;

import ony.cmm.common.bean.CommonBean;

/**
 * Matching Search bean
 * @author
 * @version 1.0
 * @since 2019.11.04
 */
public class MatchingSrchBean extends CommonBean {

	private String userSeq;
	private String iscoCdStr;
	private String locCdStr;
	private String langCdStr;
	private String eduDegreeCdStr;
	private String privilegeCdStr;
	private String workTimeFullCd;
	private String workTimePartCd;
	private String employCtrctDecidCd;
	private String employCtrctUndecidCd;
	private String minWorkExp;
	private String preferEmploymtTypeCd;
	private Integer hopeSalary;
	private List<String> langCds;
	private List<String> eduDegreeCds;
	private List<String> preferntCondCds;
	private String condSort;
	private String condAddrCd;

	public String getCondAddrCd() {
		return condAddrCd;
	}
	public void setCondAddrCd(String condAddrCd) {
		this.condAddrCd = condAddrCd;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getIscoCdStr() {
		return iscoCdStr;
	}
	public void setIscoCdStr(String iscoCdStr) {
		this.iscoCdStr = iscoCdStr;
	}
	public String getLocCdStr() {
		return locCdStr;
	}
	public void setLocCdStr(String locCdStr) {
		this.locCdStr = locCdStr;
	}
	public String getLangCdStr() {
		return langCdStr;
	}
	public void setLangCdStr(String langCdStr) {
		this.langCdStr = langCdStr;
	}
	public String getEduDegreeCdStr() {
		return eduDegreeCdStr;
	}
	public void setEduDegreeCdStr(String eduDegreeCdStr) {
		this.eduDegreeCdStr = eduDegreeCdStr;
	}
	public String getPrivilegeCdStr() {
		return privilegeCdStr;
	}
	public void setPrivilegeCdStr(String privilegeCdStr) {
		this.privilegeCdStr = privilegeCdStr;
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
	public String getMinWorkExp() {
		return minWorkExp;
	}
	public void setMinWorkExp(String minWorkExp) {
		this.minWorkExp = minWorkExp;
	}
	public String getPreferEmploymtTypeCd() {
		return preferEmploymtTypeCd;
	}
	public void setPreferEmploymtTypeCd(String preferEmploymtTypeCd) {
		this.preferEmploymtTypeCd = preferEmploymtTypeCd;
	}
	public Integer getHopeSalary() {
		return hopeSalary;
	}
	public void setHopeSalary(Integer hopeSalary) {
		this.hopeSalary = hopeSalary;
	}
	public List<String> getLangCds() {
		return langCds;
	}
	public void setLangCds(List<String> langCds) {
		this.langCds = langCds;
	}
	public List<String> getEduDegreeCds() {
		return eduDegreeCds;
	}
	public void setEduDegreeCds(List<String> eduDegreeCds) {
		this.eduDegreeCds = eduDegreeCds;
	}
	public List<String> getPreferntCondCds() {
		return preferntCondCds;
	}
	public void setPreferntCondCds(List<String> preferntCondCds) {
		this.preferntCondCds = preferntCondCds;
	}
	public String getCondSort() {
		return condSort;
	}
	public void setCondSort(String condSort) {
		this.condSort = condSort;
	}

}
