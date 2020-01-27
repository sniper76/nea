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
public class CondWorkShopBean extends CommonBean {

	private String condSeq;
	private String condSeqStr;
	private String condUserSeq;
	private String condFairSeq;
	private String condFairWorkshopSeq;
	private String condFairWorkshopPatcptnSeq;
	private String condSort;
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
	public String getCondFairSeq() {
		return condFairSeq;
	}
	public void setCondFairSeq(String condFairSeq) {
		this.condFairSeq = condFairSeq;
	}
	public String getCondFairWorkshopSeq() {
		return condFairWorkshopSeq;
	}
	public void setCondFairWorkshopSeq(String condFairWorkshopSeq) {
		this.condFairWorkshopSeq = condFairWorkshopSeq;
	}
	public String getCondFairWorkshopPatcptnSeq() {
		return condFairWorkshopPatcptnSeq;
	}
	public void setCondFairWorkshopPatcptnSeq(String condFairWorkshopPatcptnSeq) {
		this.condFairWorkshopPatcptnSeq = condFairWorkshopPatcptnSeq;
	}
}
