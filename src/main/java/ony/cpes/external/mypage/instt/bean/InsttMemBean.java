package ony.cpes.external.mypage.instt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class InsttMemBean extends CommonBean{

	private String delYn;//삭제_여부
	private String fileGrpSeq;//파일_그룹_시퀀스
	private String insttAddrCd;//기관_주소 코드
	private String insttAddrDtl;//기관_주소 상세
	private String insttAddrFullCd;
	private String insttAddrFullNm;
	private String insttCell;//기관_핸드폰_번호
	private String insttContent;//기관_내용
	private String insttEmail;//기관_이메일
	private String insttFax;//기관_팩스_번호
	private String insttMngerNm;//기관_담당자_명
	private String insttNmEn;//기관명 영문
	private String insttNmKh;//기관명 크메르어
	private String insttOfficeTel;//기관_사무실_전화_번호
	private String insttOwnerCd;//기관_소유_코드
	private String insttOwnerNm;//기관_대표자_명
	private String insttRegNum;//기관_등록_번호
	private String insttSeq;//기관_시퀀스
	private String insttStsCd;//기관_상태_코드
	private String insttStsNm;//
	private String insttTypeCd;//기관_형태_코드(INSTT_TYPE_CD)
	private String insttWebsite;//기관_웹사이트
	private String userSeq;//사용자_시퀀스
	private String insttNm;//사용자_시퀀스
	private String googleMapLink;
	private String insttProfile;
	private String insttLogoFileGrpSeq;
	private String eduProgramIdStr;
	private String trnngDtStr;
	private String trnngNmStr;
	private String bkmkSeq;
	private int bkmkCnt;
	private String insttTypeNm;
	private String insttDivClass;
	private String addrNm;

	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getFileGrpSeq() {
		return fileGrpSeq;
	}
	public void setFileGrpSeq(String fileGrpSeq) {
		this.fileGrpSeq = fileGrpSeq;
	}
	public String getInsttAddrCd() {
		return insttAddrCd;
	}
	public void setInsttAddrCd(String insttAddrCd) {
		this.insttAddrCd = insttAddrCd;
	}
	public String getInsttAddrDtl() {
		return insttAddrDtl;
	}
	public void setInsttAddrDtl(String insttAddrDtl) {
		this.insttAddrDtl = insttAddrDtl;
	}
	public String getInsttAddrFullCd() {
		return insttAddrFullCd;
	}
	public void setInsttAddrFullCd(String insttAddrFullCd) {
		this.insttAddrFullCd = insttAddrFullCd;
	}
	public String getInsttAddrFullNm() {
		return insttAddrFullNm;
	}
	public void setInsttAddrFullNm(String insttAddrFullNm) {
		this.insttAddrFullNm = insttAddrFullNm;
	}
	public String getInsttCell() {
		return insttCell;
	}
	public void setInsttCell(String insttCell) {
		this.insttCell = insttCell;
	}
	public String getInsttContent() {
		return insttContent;
	}
	public void setInsttContent(String insttContent) {
		this.insttContent = insttContent;
	}
	public String getInsttEmail() {
		return insttEmail;
	}
	public void setInsttEmail(String insttEmail) {
		this.insttEmail = insttEmail;
	}
	public String getInsttFax() {
		return insttFax;
	}
	public void setInsttFax(String insttFax) {
		this.insttFax = insttFax;
	}
	public String getInsttMngerNm() {
		return insttMngerNm;
	}
	public void setInsttMngerNm(String insttMngerNm) {
		this.insttMngerNm = insttMngerNm;
	}
	public String getInsttNmEn() {
		return insttNmEn;
	}
	public void setInsttNmEn(String insttNmEn) {
		this.insttNmEn = insttNmEn;
	}
	public String getInsttNmKh() {
		return insttNmKh;
	}
	public void setInsttNmKh(String insttNmKh) {
		this.insttNmKh = insttNmKh;
	}
	public String getInsttOfficeTel() {
		return insttOfficeTel;
	}
	public void setInsttOfficeTel(String insttOfficeTel) {
		this.insttOfficeTel = insttOfficeTel;
	}
	public String getInsttOwnerCd() {
		return insttOwnerCd;
	}
	public void setInsttOwnerCd(String insttOwnerCd) {
		this.insttOwnerCd = insttOwnerCd;
	}
	public String getInsttOwnerNm() {
		return insttOwnerNm;
	}
	public void setInsttOwnerNm(String insttOwnerNm) {
		this.insttOwnerNm = insttOwnerNm;
	}
	public String getInsttRegNum() {
		return insttRegNum;
	}
	public void setInsttRegNum(String insttRegNum) {
		this.insttRegNum = insttRegNum;
	}
	public String getInsttSeq() {
		return insttSeq;
	}
	public void setInsttSeq(String insttSeq) {
		this.insttSeq = insttSeq;
	}
	public String getInsttStsCd() {
		return insttStsCd;
	}
	public void setInsttStsCd(String insttStsCd) {
		this.insttStsCd = insttStsCd;
	}
	public String getInsttStsNm() {
		return insttStsNm;
	}
	public void setInsttStsNm(String insttStsNm) {
		this.insttStsNm = insttStsNm;
	}
	public String getInsttTypeCd() {
		return insttTypeCd;
	}
	public void setInsttTypeCd(String insttTypeCd) {
		this.insttTypeCd = insttTypeCd;
	}
	public String getInsttWebsite() {
		return insttWebsite;
	}
	public void setInsttWebsite(String insttWebsite) {
		this.insttWebsite = insttWebsite;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getInsttNm() {
		return insttNm;
	}
	public void setInsttNm(String insttNm) {
		this.insttNm = insttNm;
	}
	public String getGoogleMapLink() {
		return googleMapLink;
	}
	public void setGoogleMapLink(String googleMapLink) {
		this.googleMapLink = googleMapLink;
	}
	public String getInsttProfile() {
		return insttProfile;
	}
	public void setInsttProfile(String insttProfile) {
		this.insttProfile = insttProfile;
	}
	public String getInsttLogoFileGrpSeq() {
		return insttLogoFileGrpSeq;
	}
	public void setInsttLogoFileGrpSeq(String insttLogoFileGrpSeq) {
		this.insttLogoFileGrpSeq = insttLogoFileGrpSeq;
	}
	public String getEduProgramIdStr() {
		return eduProgramIdStr;
	}
	public void setEduProgramIdStr(String eduProgramIdStr) {
		this.eduProgramIdStr = eduProgramIdStr;
	}
	public String getTrnngDtStr() {
		return trnngDtStr;
	}
	public void setTrnngDtStr(String trnngDtStr) {
		this.trnngDtStr = trnngDtStr;
	}
	public String getTrnngNmStr() {
		return trnngNmStr;
	}
	public void setTrnngNmStr(String trnngNmStr) {
		this.trnngNmStr = trnngNmStr;
	}
	public String getBkmkSeq() {
		return bkmkSeq;
	}
	public void setBkmkSeq(String bkmkSeq) {
		this.bkmkSeq = bkmkSeq;
	}
	public int getBkmkCnt() {
		return bkmkCnt;
	}
	public void setBkmkCnt(int bkmkCnt) {
		this.bkmkCnt = bkmkCnt;
	}
	public String getInsttTypeNm() {
		return insttTypeNm;
	}
	public void setInsttTypeNm(String insttTypeNm) {
		this.insttTypeNm = insttTypeNm;
	}
	public String getInsttDivClass() {
		return insttDivClass;
	}
	public void setInsttDivClass(String insttDivClass) {
		this.insttDivClass = insttDivClass;
	}
	public String getAddrNm() {
		return addrNm;
	}
	public void setAddrNm(String addrNm) {
		this.addrNm = addrNm;
	}


}
