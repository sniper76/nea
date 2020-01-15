package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class CondApplicBean extends CommonBean{
	private String condSeq;//검색seq
	private String condSeq2;//검색seq
	private String condSeq3;//검색seq
	private String condTypeCd;//검색타입
	private String condText;//검색어
	private String condBgnDt;//검색 시작일자
	private String condEndDt;//검색 종료일자
	private String condOpenTypeCd;//열람여부
	private String condStatTypeCd;//진행여부
	private String condStatTypeCd2;//채요상태
	private String condUserSeq;//검색 사용자 seq
	private String condStr;//검색 사용자 seq
	private String condSort;//검색 사용자 seq
	private String condApplicProcCd;


	public String getCondSeq() {
		return condSeq;
	}
	public void setCondSeq(String condSeq) {
		this.condSeq = condSeq;
	}
	public String getCondSeq2() {
		return condSeq2;
	}
	public void setCondSeq2(String condSeq2) {
		this.condSeq2 = condSeq2;
	}
	public String getCondTypeCd() {
		return condTypeCd;
	}
	public void setCondTypeCd(String condTypeCd) {
		this.condTypeCd = condTypeCd;
	}
	public String getCondText() {
		return condText;
	}
	public void setCondText(String condText) {
		this.condText = condText;
	}
	public String getCondBgnDt() {
		return condBgnDt;
	}
	public void setCondBgnDt(String condBgnDt) {
		this.condBgnDt = condBgnDt;
	}
	public String getCondEndDt() {
		return condEndDt;
	}
	public void setCondEndDt(String condEndDt) {
		this.condEndDt = condEndDt;
	}
	public String getCondOpenTypeCd() {
		return condOpenTypeCd;
	}
	public void setCondOpenTypeCd(String condOpenTypeCd) {
		this.condOpenTypeCd = condOpenTypeCd;
	}
	public String getCondStatTypeCd() {
		return condStatTypeCd;
	}
	public void setCondStatTypeCd(String condStatTypeCd) {
		this.condStatTypeCd = condStatTypeCd;
	}
	public String getCondStatTypeCd2() {
		return condStatTypeCd2;
	}
	public void setCondStatTypeCd2(String condStatTypeCd2) {
		this.condStatTypeCd2 = condStatTypeCd2;
	}
	public String getCondUserSeq() {
		return condUserSeq;
	}
	public void setCondUserSeq(String condUserSeq) {
		this.condUserSeq = condUserSeq;
	}
	public String getCondSeq3() {
		return condSeq3;
	}
	public void setCondSeq3(String condSeq3) {
		this.condSeq3 = condSeq3;
	}
	public String getCondStr() {
		return condStr;
	}
	public void setCondStr(String condStr) {
		this.condStr = condStr;
	}
	public String getCondSort() {
		return condSort;
	}
	public void setCondSort(String condSort) {
		this.condSort = condSort;
	}
	public String getCondApplicProcCd() {
		return condApplicProcCd;
	}
	public void setCondApplicProcCd(String condApplicProcCd) {
		this.condApplicProcCd = condApplicProcCd;
	}


}
