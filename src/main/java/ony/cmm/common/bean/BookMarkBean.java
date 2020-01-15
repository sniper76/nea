package ony.cmm.common.bean;



/**
 * bean 공통정보를 담는 bean
 *
 * @author 우성택
 * @version 1.0
 * @since 2019.01.02
 */
public class BookMarkBean extends CommonBean{
	private String bkmkSeq;//BKMK_SEQ
	private String cateCd;//카테고리_코드(CATE_CD)
	private String tableKeySeq;//테이블_키_시퀀스
	private String userSeq;//사용자_시퀀스
	private String regUserSeq;//등록_사용자_시퀀스
	private String div;
	private String bkmkSeqStr;

	public String getBkmkSeq() {
		return bkmkSeq;
	}
	public void setBkmkSeq(String bkmkSeq) {
		this.bkmkSeq = bkmkSeq;
	}
	public String getCateCd() {
		return cateCd;
	}
	public void setCateCd(String cateCd) {
		this.cateCd = cateCd;
	}
	public String getTableKeySeq() {
		return tableKeySeq;
	}
	public void setTableKeySeq(String tableKeySeq) {
		this.tableKeySeq = tableKeySeq;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getRegUserSeq() {
		return regUserSeq;
	}
	public void setRegUserSeq(String regUserSeq) {
		this.regUserSeq = regUserSeq;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public String getBkmkSeqStr() {
		return bkmkSeqStr;
	}
	public void setBkmkSeqStr(String bkmkSeqStr) {
		this.bkmkSeqStr = bkmkSeqStr;
	}








}
