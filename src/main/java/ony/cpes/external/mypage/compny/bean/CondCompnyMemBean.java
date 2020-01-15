package ony.cpes.external.mypage.compny.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class CondCompnyMemBean extends CommonBean{
	private String condUserSeq;//사용자_권한_코드(USER_AUTH_CD)
	private String condCertNo;//사용자_권한_코드(USER_AUTH_CD)
	private String condSeq;//사용자_권한_코드(USER_AUTH_CD)
	private String condDiv;//사용자_권한_코드(USER_AUTH_CD)


	public String getCondUserSeq() {
		return condUserSeq;
	}
	public void setCondUserSeq(String condUserSeq) {
		this.condUserSeq = condUserSeq;
	}
	public String getCondCertNo() {
		return condCertNo;
	}
	public void setCondCertNo(String condCertNo) {
		this.condCertNo = condCertNo;
	}
	public String getCondSeq() {
		return condSeq;
	}
	public void setCondSeq(String condSeq) {
		this.condSeq = condSeq;
	}
	public String getCondDiv() {
		return condDiv;
	}
	public void setCondDiv(String condDiv) {
		this.condDiv = condDiv;
	}


}
