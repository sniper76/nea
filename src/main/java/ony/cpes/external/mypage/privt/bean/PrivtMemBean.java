package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;


/**
 * bean 개인회원정보 bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.04
 */
public class PrivtMemBean extends CommonBean{
	private String userAuthCd;//사용자_권한_코드(USER_AUTH_CD)
	private String userEmail;//사용자_이메일(로그인계정)
	private String userNmKh;//사용자_명
	private String userPwdOld;//사용자_비밀번호_OLD(MD5)
	private String pwdCreatDt;//비밀번호_생성_날짜
	private String pwdFailCnt;//비밀번호_실패_카운트
	private String userStsCd;//사용자_상태_코드(USER_STS_CD)
	private String wthdrReason;//탈퇴_사유
	private String lastLoginDt;//마지막_로그인_날짜
	private String lastLoginIp;//마지막_로그인_아이피
	private String userCell;//사용자_연락처(로그인계정)
	private String userId;//사용자_아이디
	private String userSeq;//사용자_시퀀스
	private String jcCd;//JOB_CENTER_코드(JC_CD)
	private String userPwd;//사용자_비밀번호_NEW(SHA512)
	private String newPwdApplyYn;//신규_비밀번호_적용_여부_YN
	private String regUserSeq;//등록_사용자_시퀀스
	private String modUserSeq;//수정_사용자_시퀀스
	private String wthdrReasonCd;//탈퇴_사유_코드(WTHDR_REASON_CD)
	private String accntLockStsCd;//계정_잠김_상태_코드(USER_STS_CD)
	private String privateInfoUseAgreeYn;//개인_정보_사용_동의_여부_YN
	private String smsNtceAgreeYn;//SMS문자_알림_동의_여부_YN
	private String emailNtceAgreeYn;//이메일_알림_동의_여부_YN
	private String emailUserAuthValue;//이메일_사용자_인증_값
	private String nid;//NID
	private String userGrpCd;//사용자_그룹_코드(USER_GRP_CD)
	private String fileGrpSeq;//파일_그룹_시퀀스
	private String birth;//생년월일
	private String addrCd;//주소_코드(ADDR_CD)
	private String addrDtl;//주소_상세
	private String infoOpenYn;//정보_공개_여부_YN
	private String concilReqYn;//알선_신청_여부_YN
	private String membTacAgreeYn;//회원_약관_동의_여부_YN
	private String privateInfoCollctAgreeYn;//개인_정보_수집_동의_여부_YN
	private String infoProvdInfoAgreeYn;//정보_제공_안내_동의_여부_YN
	private String mngId;//관리자_아이디
	private String mngYn;//관리자_여부
	private String useYn;//사용_여부
	private String userNmEn;//사용자_명_영어
	private String jobskStsCd;//구직_상태_코드
	private String dormancyYn;//휴면계정 여부
	private String smsEmailAuthDivCd;//이메일_SMS_인증구분코드
	private String authCmpltYn;//인증완료 여부
	private String joinRouteDivCd;//
	private String delYn;//삭제여부
	private String genderCd;//성별_코드(GENDER_CD)
	private String jcNm;//잡센터명
	private String userAuthNm;//잡센터명
	private String addrCdNm;
	private String userNm;
	private String genderNm;
	private String addrFullCd;
	private String addrFullNm;
	private String birthDay;
	private String birthMonth;
	private String birthYear;
	private String curPwd;
	private String newPwd;
	public String getUserAuthCd() {
		return userAuthCd;
	}
	public void setUserAuthCd(String userAuthCd) {
		this.userAuthCd = userAuthCd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserNmKh() {
		return userNmKh;
	}
	public void setUserNmKh(String userNmKh) {
		this.userNmKh = userNmKh;
	}
	public String getUserPwdOld() {
		return userPwdOld;
	}
	public void setUserPwdOld(String userPwdOld) {
		this.userPwdOld = userPwdOld;
	}
	public String getPwdCreatDt() {
		return pwdCreatDt;
	}
	public void setPwdCreatDt(String pwdCreatDt) {
		this.pwdCreatDt = pwdCreatDt;
	}
	public String getPwdFailCnt() {
		return pwdFailCnt;
	}
	public void setPwdFailCnt(String pwdFailCnt) {
		this.pwdFailCnt = pwdFailCnt;
	}
	public String getUserStsCd() {
		return userStsCd;
	}
	public void setUserStsCd(String userStsCd) {
		this.userStsCd = userStsCd;
	}
	public String getWthdrReason() {
		return wthdrReason;
	}
	public void setWthdrReason(String wthdrReason) {
		this.wthdrReason = wthdrReason;
	}
	public String getLastLoginDt() {
		return lastLoginDt;
	}
	public void setLastLoginDt(String lastLoginDt) {
		this.lastLoginDt = lastLoginDt;
	}
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	public String getUserCell() {
		return userCell;
	}
	public void setUserCell(String userCell) {
		this.userCell = userCell;
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
	public String getJcCd() {
		return jcCd;
	}
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getNewPwdApplyYn() {
		return newPwdApplyYn;
	}
	public void setNewPwdApplyYn(String newPwdApplyYn) {
		this.newPwdApplyYn = newPwdApplyYn;
	}
	public String getRegUserSeq() {
		return regUserSeq;
	}
	public void setRegUserSeq(String regUserSeq) {
		this.regUserSeq = regUserSeq;
	}
	public String getModUserSeq() {
		return modUserSeq;
	}
	public void setModUserSeq(String modUserSeq) {
		this.modUserSeq = modUserSeq;
	}
	public String getWthdrReasonCd() {
		return wthdrReasonCd;
	}
	public void setWthdrReasonCd(String wthdrReasonCd) {
		this.wthdrReasonCd = wthdrReasonCd;
	}
	public String getAccntLockStsCd() {
		return accntLockStsCd;
	}
	public void setAccntLockStsCd(String accntLockStsCd) {
		this.accntLockStsCd = accntLockStsCd;
	}
	public String getPrivateInfoUseAgreeYn() {
		return privateInfoUseAgreeYn;
	}
	public void setPrivateInfoUseAgreeYn(String privateInfoUseAgreeYn) {
		this.privateInfoUseAgreeYn = privateInfoUseAgreeYn;
	}
	public String getSmsNtceAgreeYn() {
		return smsNtceAgreeYn;
	}
	public void setSmsNtceAgreeYn(String smsNtceAgreeYn) {
		this.smsNtceAgreeYn = smsNtceAgreeYn;
	}
	public String getEmailNtceAgreeYn() {
		return emailNtceAgreeYn;
	}
	public void setEmailNtceAgreeYn(String emailNtceAgreeYn) {
		this.emailNtceAgreeYn = emailNtceAgreeYn;
	}
	public String getEmailUserAuthValue() {
		return emailUserAuthValue;
	}
	public void setEmailUserAuthValue(String emailUserAuthValue) {
		this.emailUserAuthValue = emailUserAuthValue;
	}
	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public String getUserGrpCd() {
		return userGrpCd;
	}
	public void setUserGrpCd(String userGrpCd) {
		this.userGrpCd = userGrpCd;
	}
	public String getFileGrpSeq() {
		return fileGrpSeq;
	}
	public void setFileGrpSeq(String fileGrpSeq) {
		this.fileGrpSeq = fileGrpSeq;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
	public String getInfoOpenYn() {
		return infoOpenYn;
	}
	public void setInfoOpenYn(String infoOpenYn) {
		this.infoOpenYn = infoOpenYn;
	}
	public String getConcilReqYn() {
		return concilReqYn;
	}
	public void setConcilReqYn(String concilReqYn) {
		this.concilReqYn = concilReqYn;
	}
	public String getMembTacAgreeYn() {
		return membTacAgreeYn;
	}
	public void setMembTacAgreeYn(String membTacAgreeYn) {
		this.membTacAgreeYn = membTacAgreeYn;
	}
	public String getPrivateInfoCollctAgreeYn() {
		return privateInfoCollctAgreeYn;
	}
	public void setPrivateInfoCollctAgreeYn(String privateInfoCollctAgreeYn) {
		this.privateInfoCollctAgreeYn = privateInfoCollctAgreeYn;
	}
	public String getInfoProvdInfoAgreeYn() {
		return infoProvdInfoAgreeYn;
	}
	public void setInfoProvdInfoAgreeYn(String infoProvdInfoAgreeYn) {
		this.infoProvdInfoAgreeYn = infoProvdInfoAgreeYn;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getMngYn() {
		return mngYn;
	}
	public void setMngYn(String mngYn) {
		this.mngYn = mngYn;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getUserNmEn() {
		return userNmEn;
	}
	public void setUserNmEn(String userNmEn) {
		this.userNmEn = userNmEn;
	}
	public String getJobskStsCd() {
		return jobskStsCd;
	}
	public void setJobskStsCd(String jobskStsCd) {
		this.jobskStsCd = jobskStsCd;
	}
	public String getDormancyYn() {
		return dormancyYn;
	}
	public void setDormancyYn(String dormancyYn) {
		this.dormancyYn = dormancyYn;
	}
	public String getSmsEmailAuthDivCd() {
		return smsEmailAuthDivCd;
	}
	public void setSmsEmailAuthDivCd(String smsEmailAuthDivCd) {
		this.smsEmailAuthDivCd = smsEmailAuthDivCd;
	}
	public String getAuthCmpltYn() {
		return authCmpltYn;
	}
	public void setAuthCmpltYn(String authCmpltYn) {
		this.authCmpltYn = authCmpltYn;
	}
	public String getJoinRouteDivCd() {
		return joinRouteDivCd;
	}
	public void setJoinRouteDivCd(String joinRouteDivCd) {
		this.joinRouteDivCd = joinRouteDivCd;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getGenderCd() {
		return genderCd;
	}
	public void setGenderCd(String genderCd) {
		this.genderCd = genderCd;
	}
	public String getJcNm() {
		return jcNm;
	}
	public void setJcNm(String jcNm) {
		this.jcNm = jcNm;
	}
	public String getUserAuthNm() {
		return userAuthNm;
	}
	public void setUserAuthNm(String userAuthNm) {
		this.userAuthNm = userAuthNm;
	}
	public String getAddrCdNm() {
		return addrCdNm;
	}
	public void setAddrCdNm(String addrCdNm) {
		this.addrCdNm = addrCdNm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getGenderNm() {
		return genderNm;
	}
	public void setGenderNm(String genderNm) {
		this.genderNm = genderNm;
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
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getBirthMonth() {
		return birthMonth;
	}
	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}
	public String getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}
	public String getCurPwd() {
		return curPwd;
	}
	public void setCurPwd(String curPwd) {
		this.curPwd = curPwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}



}
