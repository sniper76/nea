package ony.cpes.external.jobfair.bean;

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
public class CondJobFairCenterBean extends CommonBean {

	private String condSeq;
	private String condType;
	private String condText;
	private String condSort;
	private String condFairDivCd;
	private String condAreaCd;
	private String returnUrl;

	public String getReturnUrl() {
		return returnUrl;
	}
	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}
	public String getCondSeq() {
		return condSeq;
	}
	public void setCondSeq(String condSeq) {
		this.condSeq = condSeq;
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
	public String getCondFairDivCd() {
		return condFairDivCd;
	}
	public void setCondFairDivCd(String condFairDivCd) {
		this.condFairDivCd = condFairDivCd;
	}
	public String getCondAreaCd() {
		return condAreaCd;
	}
	public void setCondAreaCd(String condAreaCd) {
		this.condAreaCd = condAreaCd;
	}
}
