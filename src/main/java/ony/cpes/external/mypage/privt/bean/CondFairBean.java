package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class CondFairBean extends CommonBean{
	private String condSeq;//검색seq
	private String condSeq2;//검색seq
	private String condUserSeq;//검색seq
	private String condTypeCd;//검색seq
	private String condSeqStr;//검색seq
	private String condSort;//검색seq
	private String condText;//검색seq

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
	public String getCondUserSeq() {
		return condUserSeq;
	}
	public void setCondUserSeq(String condUserSeq) {
		this.condUserSeq = condUserSeq;
	}
	public String getCondTypeCd() {
		return condTypeCd;
	}
	public void setCondTypeCd(String condTypeCd) {
		this.condTypeCd = condTypeCd;
	}
	public String getCondSeqStr() {
		return condSeqStr;
	}
	public void setCondSeqStr(String condSeqStr) {
		this.condSeqStr = condSeqStr;
	}
	public String getCondSort() {
		return condSort;
	}
	public void setCondSort(String condSort) {
		this.condSort = condSort;
	}
	public String getCondText() {
		return condText;
	}
	public void setCondText(String condText) {
		this.condText = condText;
	}



}
