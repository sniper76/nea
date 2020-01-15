package ony.cpes.external.bulletin.bean;

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
public class CondBulletinBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String condBulletinMngSeq;
	private String condBulletinSeq;
	private String condType;
	private String condText;
	private String condSort;
	private String condUserSeq;
	private String condSeq;
	private String bulletinCateSeq;
	private String condBulletinId;
	private String condBulletinTypeCd;
	private String condLikeCateCd;
	private String condDepth;
	private String condUpperSeq;
	private String condViewCntYn;

	public String getBulletinCateSeq() {
		return bulletinCateSeq;
	}
	public void setBulletinCateSeq(String bulletinCateSeq) {
		this.bulletinCateSeq = bulletinCateSeq;
	}
	public String getCondBulletinMngSeq() {
		return condBulletinMngSeq;
	}
	public void setCondBulletinMngSeq(String condBulletinMngSeq) {
		this.condBulletinMngSeq = condBulletinMngSeq;
	}
	public String getCondBulletinSeq() {
		return condBulletinSeq;
	}
	public void setCondBulletinSeq(String condBulletinSeq) {
		this.condBulletinSeq = condBulletinSeq;
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
	public String getCondBulletinId() {
		return condBulletinId;
	}
	public void setCondBulletinId(String condBulletinId) {
		this.condBulletinId = condBulletinId;
	}
	public String getCondBulletinTypeCd() {
		return condBulletinTypeCd;
	}
	public void setCondBulletinTypeCd(String condBulletinTypeCd) {
		this.condBulletinTypeCd = condBulletinTypeCd;
	}
	public String getCondLikeCateCd() {
		return condLikeCateCd;
	}
	public void setCondLikeCateCd(String condLikeCateCd) {
		this.condLikeCateCd = condLikeCateCd;
	}
	public String getCondDepth() {
		return condDepth;
	}
	public void setCondDepth(String condDepth) {
		this.condDepth = condDepth;
	}
	public String getCondUpperSeq() {
		return condUpperSeq;
	}
	public void setCondUpperSeq(String condUpperSeq) {
		this.condUpperSeq = condUpperSeq;
	}
	public String getCondViewCntYn() {
		return condViewCntYn;
	}
	public void setCondViewCntYn(String condViewCntYn) {
		this.condViewCntYn = condViewCntYn;
	}




}
