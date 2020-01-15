package ony.cpes.external.mypage.compny.bean;

import java.util.List;

import ony.cmm.common.bean.CommonBean;
import ony.cmm.common.bean.FileBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class CompnyMemBean extends CommonBean{
	private String addrCd;//주소_코드(ADDR_CD)
	private String addrDtl;//주소_상세
	private String bkmkCnt;//북마크_카운트
	private String compnyFacebook;//기업_페이스북
	private String compnyFax;//기업_팩스
	private String compnyId;//기업_아이디
	private String compnyNmEn;//기업_명
	private String compnyNmKh;//기업_명
	private String compnySeq;//기업_시퀀스
	private String compnyTypeCd;//기업_타입_코드(COMPNY_TYPE_CD)
	private String compnyWebsite;//기업_웹사이트
	private String delYn;//삭제여부
	private String disablEmployeeTotCnt;//장애인_종업원_합계_계산
	private String employeeTotCnt;//종업원_총수
	private String femaleEmployeeTotCnt;//여성_종업원_합계_계산
	private String fileGrpSeq;//파일_그룹_시퀀스
	private String forgnerTotCnt;//외국인_합계_계산
	private String iscoCd;//주요_직종_ISCO_코드(ISCO_CD)
	private String isicCd;//ICIS_CD
	private String jcCd;//JOB_CENTER_코드(JC_CD)
	private String jcUserSeq;//JOB_CENTER_사용자_시퀀스
	private String lattd;//위도
	private String likeCnt;//좋아요_카운트
	private String lngtd;//경도
	private String mainJobNm;//주요_직종_명
	private String mainJobPercent;//주요_직종_퍼센트율
	private String mngerCell;//담당자_휴대전화
	private String mngerEmail;//담당자_이메일
	private String mngerNm;//담당자_명
	private String mngerPosition;//담당자_포지션
	private String mngerTel;//기업_전화
	private String modUserSeq;//수정_사용자_시퀀스
	private String ownerNationCd;//소유주_국가_코드(NATION_CD)
	private String patentNum;//특허_번호
	private String profile;//프로필
	private String regNum;//등록_번호
	private String regUserSeq;//등록_사용자_시퀀스
	private String useYn;//사용_여부
	private String userId;//사용자_아이디
	private String userSeq;//사용자_시퀀스
	private String addrFullCd;
	private String addrFullNm;
	private String compnyNm;
	private String googleMapLink;
	private String bkmkSeq;//북마크_카운트
	private String isicNm;
	private String compnyTypeNm;
	private String subMngerNm;
	private String subMngerPosition;
	private String subMngerCell;
	private String subMngerEmail;

	private String logoFileGrpSeq;

	public String getLogoFileGrpSeq() {
		return logoFileGrpSeq;
	}
	public void setLogoFileGrpSeq(String logoFileGrpSeq) {
		this.logoFileGrpSeq = logoFileGrpSeq;
	}
	public String getAddrCd() {
		return addrCd;
	}
	public void setAddrCd(String addrCd) {
		this.addrCd = addrCd;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getBkmkCnt() {
		return bkmkCnt;
	}
	public void setBkmkCnt(String bkmkCnt) {
		this.bkmkCnt = bkmkCnt;
	}
	public String getCompnyFacebook() {
		return compnyFacebook;
	}
	public void setCompnyFacebook(String compnyFacebook) {
		this.compnyFacebook = compnyFacebook;
	}
	public String getCompnyFax() {
		return compnyFax;
	}
	public void setCompnyFax(String compnyFax) {
		this.compnyFax = compnyFax;
	}
	public String getCompnyId() {
		return compnyId;
	}
	public void setCompnyId(String compnyId) {
		this.compnyId = compnyId;
	}
	public String getCompnyNmEn() {
		return compnyNmEn;
	}
	public void setCompnyNmEn(String compnyNmEn) {
		this.compnyNmEn = compnyNmEn;
	}
	public String getCompnyNmKh() {
		return compnyNmKh;
	}
	public void setCompnyNmKh(String compnyNmKh) {
		this.compnyNmKh = compnyNmKh;
	}
	public String getCompnySeq() {
		return compnySeq;
	}
	public void setCompnySeq(String compnySeq) {
		this.compnySeq = compnySeq;
	}
	public String getCompnyTypeCd() {
		return compnyTypeCd;
	}
	public void setCompnyTypeCd(String compnyTypeCd) {
		this.compnyTypeCd = compnyTypeCd;
	}
	public String getCompnyWebsite() {
		return compnyWebsite;
	}
	public void setCompnyWebsite(String compnyWebsite) {
		this.compnyWebsite = compnyWebsite;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getDisablEmployeeTotCnt() {
		return disablEmployeeTotCnt;
	}
	public void setDisablEmployeeTotCnt(String disablEmployeeTotCnt) {
		this.disablEmployeeTotCnt = disablEmployeeTotCnt;
	}
	public String getEmployeeTotCnt() {
		return employeeTotCnt;
	}
	public void setEmployeeTotCnt(String employeeTotCnt) {
		this.employeeTotCnt = employeeTotCnt;
	}
	public String getFemaleEmployeeTotCnt() {
		return femaleEmployeeTotCnt;
	}
	public void setFemaleEmployeeTotCnt(String femaleEmployeeTotCnt) {
		this.femaleEmployeeTotCnt = femaleEmployeeTotCnt;
	}
	public String getFileGrpSeq() {
		return fileGrpSeq;
	}
	public void setFileGrpSeq(String fileGrpSeq) {
		this.fileGrpSeq = fileGrpSeq;
	}
	public String getForgnerTotCnt() {
		return forgnerTotCnt;
	}
	public void setForgnerTotCnt(String forgnerTotCnt) {
		this.forgnerTotCnt = forgnerTotCnt;
	}
	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
	}
	public String getIsicCd() {
		return isicCd;
	}
	public void setIsicCd(String isicCd) {
		this.isicCd = isicCd;
	}
	public String getJcCd() {
		return jcCd;
	}
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	public String getJcUserSeq() {
		return jcUserSeq;
	}
	public void setJcUserSeq(String jcUserSeq) {
		this.jcUserSeq = jcUserSeq;
	}
	public String getLattd() {
		return lattd;
	}
	public void setLattd(String lattd) {
		this.lattd = lattd;
	}
	public String getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(String likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getLngtd() {
		return lngtd;
	}
	public void setLngtd(String lngtd) {
		this.lngtd = lngtd;
	}
	public String getMainJobNm() {
		return mainJobNm;
	}
	public void setMainJobNm(String mainJobNm) {
		this.mainJobNm = mainJobNm;
	}
	public String getMainJobPercent() {
		return mainJobPercent;
	}
	public void setMainJobPercent(String mainJobPercent) {
		this.mainJobPercent = mainJobPercent;
	}
	public String getMngerCell() {
		return mngerCell;
	}
	public void setMngerCell(String mngerCell) {
		this.mngerCell = mngerCell;
	}
	public String getMngerEmail() {
		return mngerEmail;
	}
	public void setMngerEmail(String mngerEmail) {
		this.mngerEmail = mngerEmail;
	}
	public String getMngerNm() {
		return mngerNm;
	}
	public void setMngerNm(String mngerNm) {
		this.mngerNm = mngerNm;
	}
	public String getMngerPosition() {
		return mngerPosition;
	}
	public void setMngerPosition(String mngerPosition) {
		this.mngerPosition = mngerPosition;
	}
	public String getMngerTel() {
		return mngerTel;
	}
	public void setMngerTel(String mngerTel) {
		this.mngerTel = mngerTel;
	}
	public String getModUserSeq() {
		return modUserSeq;
	}
	public void setModUserSeq(String modUserSeq) {
		this.modUserSeq = modUserSeq;
	}
	public String getOwnerNationCd() {
		return ownerNationCd;
	}
	public void setOwnerNationCd(String ownerNationCd) {
		this.ownerNationCd = ownerNationCd;
	}
	public String getPatentNum() {
		return patentNum;
	}
	public void setPatentNum(String patentNum) {
		this.patentNum = patentNum;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getRegNum() {
		return regNum;
	}
	public void setRegNum(String regNum) {
		this.regNum = regNum;
	}
	public String getRegUserSeq() {
		return regUserSeq;
	}
	public void setRegUserSeq(String regUserSeq) {
		this.regUserSeq = regUserSeq;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getAddrFullCd() {
		return addrFullCd;
	}
	public void setAddrFullCd(String addrFullCd) {
		this.addrFullCd = addrFullCd;
	}
	public String getAddrFullNm() {
		return addrFullNm;
	}
	public void setAddrFullNm(String addrFullNm) {
		this.addrFullNm = addrFullNm;
	}
	public String getCompnyNm() {
		return compnyNm;
	}
	public void setCompnyNm(String compnyNm) {
		this.compnyNm = compnyNm;
	}
	public String getGoogleMapLink() {
		return googleMapLink;
	}
	public void setGoogleMapLink(String googleMapLink) {
		this.googleMapLink = googleMapLink;
	}
	public String getBkmkSeq() {
		return bkmkSeq;
	}
	public void setBkmkSeq(String bkmkSeq) {
		this.bkmkSeq = bkmkSeq;
	}
	public String getIsicNm() {
		return isicNm;
	}
	public void setIsicNm(String isicNm) {
		this.isicNm = isicNm;
	}
	public String getCompnyTypeNm() {
		return compnyTypeNm;
	}
	public void setCompnyTypeNm(String compnyTypeNm) {
		this.compnyTypeNm = compnyTypeNm;
	}
	public String getSubMngerNm() {
		return subMngerNm;
	}
	public void setSubMngerNm(String subMngerNm) {
		this.subMngerNm = subMngerNm;
	}
	public String getSubMngerPosition() {
		return subMngerPosition;
	}
	public void setSubMngerPosition(String subMngerPosition) {
		this.subMngerPosition = subMngerPosition;
	}
	public String getSubMngerCell() {
		return subMngerCell;
	}
	public void setSubMngerCell(String subMngerCell) {
		this.subMngerCell = subMngerCell;
	}
	public String getSubMngerEmail() {
		return subMngerEmail;
	}
	public void setSubMngerEmail(String subMngerEmail) {
		this.subMngerEmail = subMngerEmail;
	}



}
