package ony.cpes.external.bulletin.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * board config bean
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
public class BulletinConfigBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;


	private String bannerUseYn;//배너_사용_여부_YN
	private String bulletinMngSeq;//게시판_관리_시퀀스
	private String bulletinNm;//게시판_명
	private String bulletinRangeCd;//게시판_범위_코드
	private String bulletinTypeCd;//게시판_형태_코드
	private String cateUseYn;//카테고리_사용_여부
	private String commentYn;//댓글_여부
	private String content;//내용
	private String createDt;//생성_날짜
	private String delYn;//삭제_여부
	private String employYn;//고용인_여부(기업여부)
	private String fileGrpCd;//파일_그룹_코드
	private String fileQty;//파일_개수
	private String fileSize;//파일_크기
	private String fileYn;//파일_여부
	private String jobskYn;//구직자_여부(일반사용자여부)
	private String likeYn;//좋아요_여부
	private String menuCd;//메뉴_코드
	private String menuCdDiv;//메뉴_코드_구분
	private String stdtYn;//학생_여부
	private String trnngInsttYn;//훈련_기관_여부
	private String useYn;//사용_여부
	private String usreAuthCd;//사용자_권한_코드(USER_AUTH_CD)


	public String getBannerUseYn() {
		return bannerUseYn;
	}
	public void setBannerUseYn(String bannerUseYn) {
		this.bannerUseYn = bannerUseYn;
	}
	public String getBulletinMngSeq() {
		return bulletinMngSeq;
	}
	public void setBulletinMngSeq(String bulletinMngSeq) {
		this.bulletinMngSeq = bulletinMngSeq;
	}
	public String getBulletinNm() {
		return bulletinNm;
	}
	public void setBulletinNm(String bulletinNm) {
		this.bulletinNm = bulletinNm;
	}
	public String getBulletinRangeCd() {
		return bulletinRangeCd;
	}
	public void setBulletinRangeCd(String bulletinRangeCd) {
		this.bulletinRangeCd = bulletinRangeCd;
	}
	public String getBulletinTypeCd() {
		return bulletinTypeCd;
	}
	public void setBulletinTypeCd(String bulletinTypeCd) {
		this.bulletinTypeCd = bulletinTypeCd;
	}
	public String getCateUseYn() {
		return cateUseYn;
	}
	public void setCateUseYn(String cateUseYn) {
		this.cateUseYn = cateUseYn;
	}
	public String getCommentYn() {
		return commentYn;
	}
	public void setCommentYn(String commentYn) {
		this.commentYn = commentYn;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateDt() {
		return createDt;
	}
	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getEmployYn() {
		return employYn;
	}
	public void setEmployYn(String employYn) {
		this.employYn = employYn;
	}
	public String getFileGrpCd() {
		return fileGrpCd;
	}
	public void setFileGrpCd(String fileGrpCd) {
		this.fileGrpCd = fileGrpCd;
	}
	public String getFileQty() {
		return fileQty;
	}
	public void setFileQty(String fileQty) {
		this.fileQty = fileQty;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileYn() {
		return fileYn;
	}
	public void setFileYn(String fileYn) {
		this.fileYn = fileYn;
	}
	public String getJobskYn() {
		return jobskYn;
	}
	public void setJobskYn(String jobskYn) {
		this.jobskYn = jobskYn;
	}
	public String getLikeYn() {
		return likeYn;
	}
	public void setLikeYn(String likeYn) {
		this.likeYn = likeYn;
	}
	public String getMenuCd() {
		return menuCd;
	}
	public void setMenuCd(String menuCd) {
		this.menuCd = menuCd;
	}
	public String getMenuCdDiv() {
		return menuCdDiv;
	}
	public void setMenuCdDiv(String menuCdDiv) {
		this.menuCdDiv = menuCdDiv;
	}
	public String getStdtYn() {
		return stdtYn;
	}
	public void setStdtYn(String stdtYn) {
		this.stdtYn = stdtYn;
	}
	public String getTrnngInsttYn() {
		return trnngInsttYn;
	}
	public void setTrnngInsttYn(String trnngInsttYn) {
		this.trnngInsttYn = trnngInsttYn;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getUsreAuthCd() {
		return usreAuthCd;
	}
	public void setUsreAuthCd(String usreAuthCd) {
		this.usreAuthCd = usreAuthCd;
	}



}
