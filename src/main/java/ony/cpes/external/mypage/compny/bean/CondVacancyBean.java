package ony.cpes.external.mypage.compny.bean;

import java.util.ArrayList;

import ony.cmm.common.bean.CommonBean;


/**
 * board bean
 * @author kwon
 * @since
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일           수정자     수정내용
 *  ------------- -------- ---------------------------
 *  2019.10.17 KWON
 *
 * </pre>
 */
public class CondVacancyBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String condSeq;
	private String condCopySeq;
	private String condUserSeq;
	private String condType;
	private String condText;
	private String condSort;
	private String condStatCd;
	private String condBkmkCateCd;
	private String condCopyYn;
	private String condTempYn;
	private String condVacancyStsCd;
	private String condApplicProcCd;
	private String condOfferFlag;

	public String getCondOfferFlag() {
		return condOfferFlag;
	}
	public void setCondOfferFlag(String condOfferFlag) {
		this.condOfferFlag = condOfferFlag;
	}
	public String getCondVacancyStsCd() {
		return condVacancyStsCd;
	}
	public void setCondVacancyStsCd(String condVacancyStsCd) {
		this.condVacancyStsCd = condVacancyStsCd;
	}
	public String getCondSeq() {
		return condSeq;
	}
	public void setCondSeq(String condSeq) {
		this.condSeq = condSeq;
	}
	public String getCondCopySeq() {
		return condCopySeq;
	}
	public void setCondCopySeq(String condCopySeq) {
		this.condCopySeq = condCopySeq;
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
	public String getCondSort() {
		return condSort;
	}
	public void setCondSort(String condSort) {
		this.condSort = condSort;
	}
	public String getCondStatCd() {
		return condStatCd;
	}
	public void setCondStatCd(String condStatCd) {
		this.condStatCd = condStatCd;
	}
	public String getCondBkmkCateCd() {
		return condBkmkCateCd;
	}
	public void setCondBkmkCateCd(String condBkmkCateCd) {
		this.condBkmkCateCd = condBkmkCateCd;
	}
	public String getCondCopyYn() {
		return condCopyYn;
	}
	public void setCondCopyYn(String condCopyYn) {
		this.condCopyYn = condCopyYn;
	}
	public String getCondTempYn() {
		return condTempYn;
	}
	public void setCondTempYn(String condTempYn) {
		this.condTempYn = condTempYn;
	}
	public String getCondApplicProcCd() {
		return condApplicProcCd;
	}
	public void setCondApplicProcCd(String condApplicProcCd) {
		this.condApplicProcCd = condApplicProcCd;
	}







}
