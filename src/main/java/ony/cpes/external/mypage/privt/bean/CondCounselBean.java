package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class CondCounselBean extends CommonBean{
	private String condSeq;//검색seq
	private String condUserSeq;//검색seq
	private String condType;//검색seq
	private String condText;//검색seq
	private String condSeqStr;//검색seq

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

	public String getCondType() {
		return condType;
	}

	public void setCondType(String condType) {
		this.condType = condType;
	}

	public String getCondText() {
		return condText;
	}

	public void setCondText(String condText) {
		this.condText = condText;
	}

	public String getCondSeqStr() {
		return condSeqStr;
	}

	public void setCondSeqStr(String condSeqStr) {
		this.condSeqStr = condSeqStr;
	}


}
