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
public class BulletinCateBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String bulletinMngSeq;//게시판_관리_시퀀스
	private String bulletinCateNm;//게시판_카테고리_명
	private String bulletinCateSeq;//게시판_카테고리_시퀀스
	private String sort;//정렬


	public String getBulletinMngSeq() {
		return bulletinMngSeq;
	}
	public void setBulletinMngSeq(String bulletinMngSeq) {
		this.bulletinMngSeq = bulletinMngSeq;
	}
	public String getBulletinCateNm() {
		return bulletinCateNm;
	}
	public void setBulletinCateNm(String bulletinCateNm) {
		this.bulletinCateNm = bulletinCateNm;
	}
	public String getBulletinCateSeq() {
		return bulletinCateSeq;
	}
	public void setBulletinCateSeq(String bulletinCateSeq) {
		this.bulletinCateSeq = bulletinCateSeq;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}

}
