package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class CondJobskBean extends CommonBean{
	private String condUserSeq;//사용자_권한_코드(USER_AUTH_CD)
	private String condSeq;//사용자_권한_코드(USER_AUTH_CD)
	private String condStatCd;//사용자_권한_코드(USER_AUTH_CD)
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

}
