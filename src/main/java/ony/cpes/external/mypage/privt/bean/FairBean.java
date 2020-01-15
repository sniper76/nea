package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class FairBean extends CommonBean{

	private String fairSeq;//채용행사_시퀀스
	private String jcAgreeDt;//JOB_CENTER_승인일
	private String jcAgreeStsCd;//JOB_CENTER_승인_상태_코드
	private String jcAgreeStsNm;//
	private String jcAgreeUserSeq;//JOB_CENTER_승인_사용자_시퀀스
	private String patcptnYn;//참여_여부_YN
	private String userSeq;//사용자_시퀀스
	private String cancelYn;//취소_여부
	private String delYn;//삭제_여부
	private String fairNm;
	private String fairStsNm;
	private String fairStsCd;
	private String fairDivNm;
	private String fairBgnDt;
	private String fairEndDt;
	private String tel1;
	private String tel2;
	private String email;
	private String addrNm;
	private String compnySeq;
	private String compnyRespYn;
	private String inviteDt;
	private String inviteYn;
	private String boothFee;
	private String boothNm;
	private String boothSeq;
	private String resvStsCd;
	private String resvStsNm;
	private String insttSeq;
	private String insttRespYn;
	private String fairDivCd;
	private String imagePath;
	private String addrDtl;
	private String boothResvHistSeq;
	private String boothStsCd;
	private String userResvStsNm;

	public String getFairSeq() {
		return fairSeq;
	}
	public void setFairSeq(String fairSeq) {
		this.fairSeq = fairSeq;
	}
	public String getJcAgreeDt() {
		return jcAgreeDt;
	}
	public void setJcAgreeDt(String jcAgreeDt) {
		this.jcAgreeDt = jcAgreeDt;
	}
	public String getJcAgreeStsCd() {
		return jcAgreeStsCd;
	}
	public void setJcAgreeStsCd(String jcAgreeStsCd) {
		this.jcAgreeStsCd = jcAgreeStsCd;
	}
	public String getJcAgreeStsNm() {
		return jcAgreeStsNm;
	}
	public void setJcAgreeStsNm(String jcAgreeStsNm) {
		this.jcAgreeStsNm = jcAgreeStsNm;
	}
	public String getJcAgreeUserSeq() {
		return jcAgreeUserSeq;
	}
	public void setJcAgreeUserSeq(String jcAgreeUserSeq) {
		this.jcAgreeUserSeq = jcAgreeUserSeq;
	}
	public String getPatcptnYn() {
		return patcptnYn;
	}
	public void setPatcptnYn(String patcptnYn) {
		this.patcptnYn = patcptnYn;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getCancelYn() {
		return cancelYn;
	}
	public void setCancelYn(String cancelYn) {
		this.cancelYn = cancelYn;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getFairNm() {
		return fairNm;
	}
	public void setFairNm(String fairNm) {
		this.fairNm = fairNm;
	}
	public String getFairStsNm() {
		return fairStsNm;
	}
	public void setFairStsNm(String fairStsNm) {
		this.fairStsNm = fairStsNm;
	}
	public String getFairStsCd() {
		return fairStsCd;
	}
	public void setFairStsCd(String fairStsCd) {
		this.fairStsCd = fairStsCd;
	}
	public String getFairDivNm() {
		return fairDivNm;
	}
	public void setFairDivNm(String fairDivNm) {
		this.fairDivNm = fairDivNm;
	}
	public String getFairBgnDt() {
		return fairBgnDt;
	}
	public void setFairBgnDt(String fairBgnDt) {
		this.fairBgnDt = fairBgnDt;
	}
	public String getFairEndDt() {
		return fairEndDt;
	}
	public void setFairEndDt(String fairEndDt) {
		this.fairEndDt = fairEndDt;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddrNm() {
		return addrNm;
	}
	public void setAddrNm(String addrNm) {
		this.addrNm = addrNm;
	}
	public String getCompnySeq() {
		return compnySeq;
	}
	public void setCompnySeq(String compnySeq) {
		this.compnySeq = compnySeq;
	}
	public String getCompnyRespYn() {
		return compnyRespYn;
	}
	public void setCompnyRespYn(String compnyRespYn) {
		this.compnyRespYn = compnyRespYn;
	}
	public String getInviteDt() {
		return inviteDt;
	}
	public void setInviteDt(String inviteDt) {
		this.inviteDt = inviteDt;
	}
	public String getInviteYn() {
		return inviteYn;
	}
	public void setInviteYn(String inviteYn) {
		this.inviteYn = inviteYn;
	}
	public String getBoothFee() {
		return boothFee;
	}
	public void setBoothFee(String boothFee) {
		this.boothFee = boothFee;
	}
	public String getBoothNm() {
		return boothNm;
	}
	public void setBoothNm(String boothNm) {
		this.boothNm = boothNm;
	}
	public String getBoothSeq() {
		return boothSeq;
	}
	public void setBoothSeq(String boothSeq) {
		this.boothSeq = boothSeq;
	}
	public String getResvStsCd() {
		return resvStsCd;
	}
	public void setResvStsCd(String resvStsCd) {
		this.resvStsCd = resvStsCd;
	}
	public String getResvStsNm() {
		return resvStsNm;
	}
	public void setResvStsNm(String resvStsNm) {
		this.resvStsNm = resvStsNm;
	}
	public String getInsttSeq() {
		return insttSeq;
	}
	public void setInsttSeq(String insttSeq) {
		this.insttSeq = insttSeq;
	}
	public String getInsttRespYn() {
		return insttRespYn;
	}
	public void setInsttRespYn(String insttRespYn) {
		this.insttRespYn = insttRespYn;
	}
	public String getFairDivCd() {
		return fairDivCd;
	}
	public void setFairDivCd(String fairDivCd) {
		this.fairDivCd = fairDivCd;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getBoothResvHistSeq() {
		return boothResvHistSeq;
	}
	public void setBoothResvHistSeq(String boothResvHistSeq) {
		this.boothResvHistSeq = boothResvHistSeq;
	}
	public String getBoothStsCd() {
		return boothStsCd;
	}
	public void setBoothStsCd(String boothStsCd) {
		this.boothStsCd = boothStsCd;
	}
	public String getUserResvStsNm() {
		return userResvStsNm;
	}
	public void setUserResvStsNm(String userResvStsNm) {
		this.userResvStsNm = userResvStsNm;
	}




}
