package ony.cmm.common.bean;



/**
 * bean 공통정보를 담는 bean
 *
 * @author 우성택
 * @version 1.0
 * @since 2019.01.02
 */
public class ConditionBean extends CommonBean{
	private String condUserEmail;
	private String condGrpCd;
	private String condSeq;
	private String condUserSeq;
	private String condLvl;
	private String condUpperCd;
	private String condInstr;
	private String condCntryId;
	private String condSeq2;

	// 지역 및 직종 코드 조회시 사용
	private String depth;
	private String cdLength;
	private String cd;

	private String flag;

	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
	}
	public String getCdLength() {
		return cdLength;
	}
	public void setCdLength(String cdLength) {
		this.cdLength = cdLength;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getCondUserEmail() {
		return condUserEmail;
	}
	public void setCondUserEmail(String condUserEmail) {
		this.condUserEmail = condUserEmail;
	}
	public String getCondGrpCd() {
		return condGrpCd;
	}
	public void setCondGrpCd(String condGrpCd) {
		this.condGrpCd = condGrpCd;
	}
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
	public String getCondLvl() {
		return condLvl;
	}
	public void setCondLvl(String condLvl) {
		this.condLvl = condLvl;
	}
	public String getCondUpperCd() {
		return condUpperCd;
	}
	public void setCondUpperCd(String condUpperCd) {
		this.condUpperCd = condUpperCd;
	}
	public String getCondInstr() {
		return condInstr;
	}
	public void setCondInstr(String condInstr) {
		this.condInstr = condInstr;
	}
	public String getCondCntryId() {
		return condCntryId;
	}
	public void setCondCntryId(String condCntryId) {
		this.condCntryId = condCntryId;
	}
	public String getCondSeq2() {
		return condSeq2;
	}
	public void setCondSeq2(String condSeq2) {
		this.condSeq2 = condSeq2;
	}







}
