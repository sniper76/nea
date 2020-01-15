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
public class CommentBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String bulletinSeq;//게시판_시퀀스
	private String commentSeq;//댓글_시퀀스
	private String content;//내용
	private String delYn;//삭제_여부
	private String depth;//깊이
	private String sort;//정렬
	private String upperCommentSeq;//상위_댓글_시쿼스
	private String writeDt;//작성_날짜
	private String writerNm;//작성자_명
	private int commentCnt;//작성자_명
	private String modifyYn;//작성자_명
	private String commentDelYn;//작성자_명
	private String banYn;//


	public String getBanYn() {
		return banYn;
	}
	public void setBanYn(String banYn) {
		this.banYn = banYn;
	}
	public String getBulletinSeq() {
		return bulletinSeq;
	}
	public void setBulletinSeq(String bulletinSeq) {
		this.bulletinSeq = bulletinSeq;
	}
	public String getCommentSeq() {
		return commentSeq;
	}
	public void setCommentSeq(String commentSeq) {
		this.commentSeq = commentSeq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getUpperCommentSeq() {
		return upperCommentSeq;
	}
	public void setUpperCommentSeq(String upperCommentSeq) {
		this.upperCommentSeq = upperCommentSeq;
	}
	public String getWriteDt() {
		return writeDt;
	}
	public void setWriteDt(String writeDt) {
		this.writeDt = writeDt;
	}
	public String getWriterNm() {
		return writerNm;
	}
	public void setWriterNm(String writerNm) {
		this.writerNm = writerNm;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public String getModifyYn() {
		return modifyYn;
	}
	public void setModifyYn(String modifyYn) {
		this.modifyYn = modifyYn;
	}
	public String getCommentDelYn() {
		return commentDelYn;
	}
	public void setCommentDelYn(String commentDelYn) {
		this.commentDelYn = commentDelYn;
	}




}
