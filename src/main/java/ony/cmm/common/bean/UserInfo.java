package ony.cmm.common.bean;


/**
 * 회원정보를 관리하기 위한 모델 클래스
 * @author (주)한신정보기술 연구개발팀 최관형
 * @since 2015.04.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일           수정자     수정내용
 *  ------------- -------- ---------------------------
 *  2015.04.22 최관형     최초 생성
 *
 * </pre>
 */
public class UserInfo {

	private static final long serialVersionUID = 4979179976898050104L;

	/** 사용자 구분 */
	private String userSe;

	private String seq;
	private String usrId;
	private String nm;
	private String mngrYn;
	private String mberCd;
	private String regDt;
	private String regUsr;
	private String updDt;
	private String updUsr;
	private String drmtYn;
	private String useYn;
	private String delYn;
	private String lgnFailCnt;
	private String mberSeq;
	private String authorCd;
	private String pswd;
	private String brtd;
	private String jobNm;
	private String sexdstCd;
	private String telno;
	private String zip;
	private String rdnmad;
	private String rdnmadDtl;
	private String adres;
	private String adresDtl;
	private String legalCd;
	private String smsSndYn;
	private String emailSndYn;
	private String pushSndYn;
	private String usestpltionAgreYn;
	private String indifClctionAgreYn;
	private String placeInfoAgreYn;
	private String infrmAgreYn;
	private String eventAgreYn;
	private String snsSeCd;
	private String snsInnb;
	private String mbirfwSeCd;
	private String epmtCd;
	private String invtId;
	private String cnsltCd;
	private String cnsltDt;
	private String unsubscribeEmailYn;

	private String age;
	private String oldPswd;


	private String smsAuthNo;
	
	
	public String getSmsAuthNo() {
		return smsAuthNo;
	}

	public void setSmsAuthNo(String smsAuthNo) {
		this.smsAuthNo = smsAuthNo;
	}

	public String getUserSe() {
		return userSe;
	}

	public void setUserSe(String userSe) {
		this.userSe = userSe;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	public String getMngrYn() {
		return mngrYn;
	}

	public void setMngrYn(String mngrYn) {
		this.mngrYn = mngrYn;
	}

	public String getMberCd() {
		return mberCd;
	}

	public void setMberCd(String mberCd) {
		this.mberCd = mberCd;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegUsr() {
		return regUsr;
	}

	public void setRegUsr(String regUsr) {
		this.regUsr = regUsr;
	}

	public String getUpdDt() {
		return updDt;
	}

	public void setUpdDt(String updDt) {
		this.updDt = updDt;
	}

	public String getUpdUsr() {
		return updUsr;
	}

	public void setUpdUsr(String updUsr) {
		this.updUsr = updUsr;
	}

	public String getDrmtYn() {
		return drmtYn;
	}

	public void setDrmtYn(String drmtYn) {
		this.drmtYn = drmtYn;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getLgnFailCnt() {
		return lgnFailCnt;
	}

	public void setLgnFailCnt(String lgnFailCnt) {
		this.lgnFailCnt = lgnFailCnt;
	}

	public String getMberSeq() {
		return mberSeq;
	}

	public void setMberSeq(String mberSeq) {
		this.mberSeq = mberSeq;
	}

	public String getAuthorCd() {
		return authorCd;
	}

	public void setAuthorCd(String authorCd) {
		this.authorCd = authorCd;
	}

	public String getPswd() {
		return pswd;
	}

	public void setPswd(String pswd) {
		this.pswd = pswd;
	}

	public String getBrtd() {
		return brtd;
	}

	public void setBrtd(String brtd) {
		this.brtd = brtd;
	}

	public String getJobNm() {
		return jobNm;
	}

	public void setJobNm(String jobNm) {
		this.jobNm = jobNm;
	}

	public String getSexdstCd() {
		return sexdstCd;
	}

	public void setSexdstCd(String sexdstCd) {
		this.sexdstCd = sexdstCd;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getRdnmad() {
		return rdnmad;
	}

	public void setRdnmad(String rdnmad) {
		this.rdnmad = rdnmad;
	}

	public String getRdnmadDtl() {
		return rdnmadDtl;
	}

	public void setRdnmadDtl(String rdnmadDtl) {
		this.rdnmadDtl = rdnmadDtl;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getAdresDtl() {
		return adresDtl;
	}

	public void setAdresDtl(String adresDtl) {
		this.adresDtl = adresDtl;
	}

	public String getLegalCd() {
		return legalCd;
	}

	public void setLegalCd(String legalCd) {
		this.legalCd = legalCd;
	}

	public String getSmsSndYn() {
		return smsSndYn;
	}

	public void setSmsSndYn(String smsSndYn) {
		this.smsSndYn = smsSndYn;
	}

	public String getEmailSndYn() {
		return emailSndYn;
	}

	public void setEmailSndYn(String emailSndYn) {
		this.emailSndYn = emailSndYn;
	}

	public String getPushSndYn() {
		return pushSndYn;
	}

	public void setPushSndYn(String pushSndYn) {
		this.pushSndYn = pushSndYn;
	}

	public String getUsestpltionAgreYn() {
		return usestpltionAgreYn;
	}

	public void setUsestpltionAgreYn(String usestpltionAgreYn) {
		this.usestpltionAgreYn = usestpltionAgreYn;
	}

	public String getIndifClctionAgreYn() {
		return indifClctionAgreYn;
	}

	public void setIndifClctionAgreYn(String indifClctionAgreYn) {
		this.indifClctionAgreYn = indifClctionAgreYn;
	}

	public String getPlaceInfoAgreYn() {
		return placeInfoAgreYn;
	}

	public void setPlaceInfoAgreYn(String placeInfoAgreYn) {
		this.placeInfoAgreYn = placeInfoAgreYn;
	}

	public String getInfrmAgreYn() {
		return infrmAgreYn;
	}

	public void setInfrmAgreYn(String infrmAgreYn) {
		this.infrmAgreYn = infrmAgreYn;
	}

	public String getEventAgreYn() {
		return eventAgreYn;
	}

	public void setEventAgreYn(String eventAgreYn) {
		this.eventAgreYn = eventAgreYn;
	}

	public String getSnsSeCd() {
		return snsSeCd;
	}

	public void setSnsSeCd(String snsSeCd) {
		this.snsSeCd = snsSeCd;
	}

	public String getSnsInnb() {
		return snsInnb;
	}

	public void setSnsInnb(String snsInnb) {
		this.snsInnb = snsInnb;
	}

	public String getMbirfwSeCd() {
		return mbirfwSeCd;
	}

	public void setMbirfwSeCd(String mbirfwSeCd) {
		this.mbirfwSeCd = mbirfwSeCd;
	}

	public String getEpmtCd() {
		return epmtCd;
	}

	public void setEpmtCd(String epmtCd) {
		this.epmtCd = epmtCd;
	}

	public String getInvtId() {
		return invtId;
	}

	public void setInvtId(String invtId) {
		this.invtId = invtId;
	}

	public String getCnsltCd() {
		return cnsltCd;
	}

	public void setCnsltCd(String cnsltCd) {
		this.cnsltCd = cnsltCd;
	}

	public String getCnsltDt() {
		return cnsltDt;
	}

	public void setCnsltDt(String cnsltDt) {
		this.cnsltDt = cnsltDt;
	}

	public String getUnsubscribeEmailYn() {
		return unsubscribeEmailYn;
	}

	public void setUnsubscribeEmailYn(String unsubscribeEmailYn) {
		this.unsubscribeEmailYn = unsubscribeEmailYn;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getOldPswd() {
		return oldPswd;
	}

	public void setOldPswd(String oldPswd) {
		this.oldPswd = oldPswd;
	}

}
