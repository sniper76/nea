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
public class BulletinBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String agreeYn;//승인_여부
	private String bulletinMngSeq;//게시판_관리_시퀀스
	private String bulletinSeq;//게시판_시퀀스
	private String bulletinTypeCd;//
	private String commentCnt;//댓글_수
	private String content;//내용_영어
	private String contentEn;//내용_영어
	private String contentKh;//내용_크메르
	private String delYn;//삭제_여부
	private String depth;//깊이
	private String fileGrpSeq;//파일_그룹_시퀀스
	private String jcCd;//JOB_CENTER_코드
	private String likeCnt;//좋아요_수
	private String ntcYn;//공지_여부
	private String photoFileGrpSeq;//사진_파일_그룹_시퀀스
	private String sort;//순서
	private String title;//제목_영어
	private String titleEn;//제목_영어
	private String titleKh;//제목_크메르
	private String bulletinCateSeq;//카테고리_시퀀스
	private String viewCnt;//조회_수
	private String viewYn;//노출_여부
	private String writeDt;//작성_날짜
	private String writerNm;//작성자_명
	private String newYn;//신규글인지
	private String likeYn;//신규글인지
	private String bulletinId;//id
	private String nextYn;//이전글다음글,pre or next
	private String emptyYn;//이전글다음글 없는지  체크
	private String modifyYn;//수정,삭제 가능여부
	private String banYn;//금칙어 여부

	// 조회 관련
	private String likeSeq;

	public String getBanYn() {
		return banYn;
	}
	public void setBanYn(String banYn) {
		this.banYn = banYn;
	}
	public String getLikeSeq() {
		return likeSeq;
	}
	public void setLikeSeq(String likeSeq) {
		this.likeSeq = likeSeq;
	}
	public String getAgreeYn() {
		return agreeYn;
	}
	public void setAgreeYn(String agreeYn) {
		this.agreeYn = agreeYn;
	}
	public String getBulletinMngSeq() {
		return bulletinMngSeq;
	}
	public void setBulletinMngSeq(String bulletinMngSeq) {
		this.bulletinMngSeq = bulletinMngSeq;
	}
	public String getBulletinSeq() {
		return bulletinSeq;
	}
	public void setBulletinSeq(String bulletinSeq) {
		this.bulletinSeq = bulletinSeq;
	}
	public String getBulletinTypeCd() {
		return bulletinTypeCd;
	}
	public void setBulletinTypeCd(String bulletinTypeCd) {
		this.bulletinTypeCd = bulletinTypeCd;
	}
	public String getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(String commentCnt) {
		this.commentCnt = commentCnt;
	}
	public String getContentEn() {
		return contentEn;
	}
	public void setContentEn(String contentEn) {
		this.contentEn = contentEn;
	}
	public String getContentKh() {
		return contentKh;
	}
	public void setContentKh(String contentKh) {
		this.contentKh = contentKh;
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
	public String getFileGrpSeq() {
		return fileGrpSeq;
	}
	public void setFileGrpSeq(String fileGrpSeq) {
		this.fileGrpSeq = fileGrpSeq;
	}
	public String getJcCd() {
		return jcCd;
	}
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	public String getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(String likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getNtcYn() {
		return ntcYn;
	}
	public void setNtcYn(String ntcYn) {
		this.ntcYn = ntcYn;
	}
	public String getPhotoFileGrpSeq() {
		return photoFileGrpSeq;
	}
	public void setPhotoFileGrpSeq(String photoFileGrpSeq) {
		this.photoFileGrpSeq = photoFileGrpSeq;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getTitleEn() {
		return titleEn;
	}
	public void setTitleEn(String titleEn) {
		this.titleEn = titleEn;
	}
	public String getTitleKh() {
		return titleKh;
	}
	public void setTitleKh(String titleKh) {
		this.titleKh = titleKh;
	}

	public String getBulletinCateSeq() {
		return bulletinCateSeq;
	}
	public void setBulletinCateSeq(String bulletinCateSeq) {
		this.bulletinCateSeq = bulletinCateSeq;
	}
	public String getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(String viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getViewYn() {
		return viewYn;
	}
	public void setViewYn(String viewYn) {
		this.viewYn = viewYn;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNewYn() {
		return newYn;
	}
	public void setNewYn(String newYn) {
		this.newYn = newYn;
	}
	public String getLikeYn() {
		return likeYn;
	}
	public void setLikeYn(String likeYn) {
		this.likeYn = likeYn;
	}
	public String getBulletinId() {
		return bulletinId;
	}
	public void setBulletinId(String bulletinId) {
		this.bulletinId = bulletinId;
	}
	public String getNextYn() {
		return nextYn;
	}
	public void setNextYn(String nextYn) {
		this.nextYn = nextYn;
	}
	public String getEmptyYn() {
		return emptyYn;
	}
	public void setEmptyYn(String emptyYn) {
		this.emptyYn = emptyYn;
	}
	public String getModifyYn() {
		return modifyYn;
	}
	public void setModifyYn(String modifyYn) {
		this.modifyYn = modifyYn;
	}


}
