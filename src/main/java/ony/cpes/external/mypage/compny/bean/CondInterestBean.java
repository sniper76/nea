package ony.cpes.external.mypage.compny.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class CondInterestBean extends CommonBean{
	private String condSeq;//검색seq
	private String condUserSeq;//검색 사용자 seq
	private String condSort;//검색 사용자 seq

	public String getCondSeq() {
		return condSeq;
	}
	public void setCondSeq(String condSeq) {
		this.condSeq = condSeq;
	}
	public String getCondUserSeq() {
		return condUserSeq;
	}
	public void setCondUserSeq(String condUserSeq) {
		this.condUserSeq = condUserSeq;
	}
	public String getCondSort() {
		return condSort;
	}
	public void setCondSort(String condSort) {
		this.condSort = condSort;
	}


}
