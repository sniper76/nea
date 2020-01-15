package ony.cpes.external.mypage.instt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class CondEduTrnngBean extends CommonBean{
	private String condUserSeq;//사용자_권한_코드(USER_AUTH_CD)
	private String condSeq;//사용자_권한_코드(USER_AUTH_CD)
	private String condStatCd;
	private String condSort;
	private String condText;
	private String condCateCd;
	private String condDivCd;
	private String condType;
	private String condAreaCd;

	public String getCondUserSeq() {
		return condUserSeq;
	}
	public void setCondUserSeq(String condUserSeq) {
		this.condUserSeq = condUserSeq;
	}
	public String getCondSeq() {
		return condSeq;
	}
	public void setCondSeq(String condSeq) {
		this.condSeq = condSeq;
	}
	public String getCondStatCd() {
		return condStatCd;
	}
	public void setCondStatCd(String condStatCd) {
		this.condStatCd = condStatCd;
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
	public String getCondCateCd() {
		return condCateCd;
	}
	public void setCondCateCd(String condCateCd) {
		this.condCateCd = condCateCd;
	}
	public String getCondDivCd() {
		return condDivCd;
	}
	public void setCondDivCd(String condDivCd) {
		this.condDivCd = condDivCd;
	}
	public String getCondType() {
		return condType;
	}
	public void setCondType(String condType) {
		this.condType = condType;
	}
	public String getCondAreaCd() {
		return condAreaCd;
	}
	public void setCondAreaCd(String condAreaCd) {
		this.condAreaCd = condAreaCd;
	}



}
