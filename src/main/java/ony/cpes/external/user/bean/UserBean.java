package ony.cpes.external.user.bean;

import java.util.List;

import ony.cmm.common.bean.CommonBean;

/**
 * user bean
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
 *  2019.10.07 Joo
 *
 * </pre>
 */
public class UserBean extends CommonBean{

	private static final long serialVersionUID = 4979179976898050104L;

	/* Data Variable */
	//1.
	private String userSeq					= "";
	private String userId					= "";
	private String userAuthCd				= "";
	private String userEmail				= "";
	private String userCell;

	//2.
	private String userNmKh					= "";
	private String userNmEn					= "";
	private String userNm					= "";
	private String birth					= "";
	private String genderCd					= "";
	private String birthLocCd				= "";
	private String addrCd					= "";

	//3.
	private String addrDtl					= "";
	private String nationCd					= "";
	private String marriCd					= "";
	private String familyCnt				= "";
	private String nid						= "";

	//4.
	private String jcCd						= "";
	private String userPwdOld				= "";
	private String userPwd					= "";
	private String newPwdApplyYn			= "";
	private String pwdCreatDt				= "";

	//5.
	private String pwdFailCnt				= "";
	private String privateInfoUseAgreeYn	= "";
	private String smsNtceAgreeYn			= "";
	private String emailNtceAgreeYn			= "";
	private String emailUserAuthValue		= "";

	//6.
	private String userGrpCd				= "";
	private String userStsCd				= "";
	private String accntLockStsCd			= "";
	private String wthdrReasonCd			= "";
	private String wthdrReason				= "";

	//7.
	private String fileGrpSeq				= "";
	private String lastLoginDt				= "";
	private String lastLoginIp				= "";
	private String regUserSeq				= "";
	private String regDt					= "";

	//8.
	private String modUserSeq				= "";
	private String modDt					= "";

	private List<UserBean> list;

	private String mngId					= "";
	private String mngYn					= "";

    private String userNewPwd;
	private String pwdChgYn					= "";

	private String jcNm						= "";

	private String dormancyYn				= "";

	private String userAuthNm				= "";

	private String jcTel				= "";

	/**
	 * @return the jcNm
	 */
	public String getJcNm() {
		return jcNm;
	}
	/**
	 * @param jcNm the jcNm to set
	 */
	public void setJcNm(String jcNm) {
		this.jcNm = jcNm;
	}

	public String getPwdChgYn() {
		return pwdChgYn;
	}
	public void setPwdChgYn(String pwdChgYn) {
		this.pwdChgYn = pwdChgYn;
	}
	public String getUserNewPwd() {
		return userNewPwd;
	}
	public void setUserNewPwd(String userNewPwd) {
		this.userNewPwd = userNewPwd;
	}

	/**
	 * @return the userSeq
	 */
	public String getUserSeq() {
		return userSeq;
	}
	/**
	 * @param userSeq the userSeq to set
	 */
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @return the userAuthCd
	 */
	public String getUserAuthCd() {
		return userAuthCd;
	}
	/**
	 * @param userAuthCd the userAuthCd to set
	 */
	public void setUserAuthCd(String userAuthCd) {
		this.userAuthCd = userAuthCd;
	}
	/**
	 * @return the userEmail
	 */
	public String getUserEmail() {
		return userEmail;
	}
	/**
	 * @param userEmail the userEmail to set
	 */
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	/**
	 * @return the userCell
	 */
	public String getUserCell() {
		return userCell;
	}
	/**
	 * @param userCell the userCell to set
	 */
	public void setUserCell(String userCell) {
		this.userCell = userCell;
	}
	/**
	 * @return the userNmKh
	 */
	public String getUserNmKh() {
		return userNmKh;
	}
	/**
	 * @param userNmKh the userNm to set
	 */
	public void setUserNmKh(String userNm) {
		this.userNmKh = userNm;
	}
	/**
	 * @return the userNm
	 */
	public String getUserNm() {
		return userNm;
	}
	/**
	 * @param userNm the userNm to set
	 */
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	/**
	 * @return the birth
	 */
	public String getBirth() {
		return birth;
	}
	/**
	 * @param birth the birth to set
	 */
	public void setBirth(String birth) {
		this.birth = birth;
	}
	/**
	 * @return the genderCd
	 */
	public String getGenderCd() {
		return genderCd;
	}
	/**
	 * @param genderCd the genderCd to set
	 */
	public void setGenderCd(String genderCd) {
		this.genderCd = genderCd;
	}
	/**
	 * @return the birthLocCd
	 */
	public String getBirthLocCd() {
		return birthLocCd;
	}
	/**
	 * @param birthLocCd the birthLocCd to set
	 */
	public void setBirthLocCd(String birthLocCd) {
		this.birthLocCd = birthLocCd;
	}
	/**
	 * @return the addrCd
	 */
	public String getAddrCd() {
		return addrCd;
	}
	/**
	 * @param addrCd the addrCd to set
	 */
	public void setAddrCd(String addrCd) {
		this.addrCd = addrCd;
	}
	/**
	 * @return the addrDtl
	 */
	public String getAddrDtl() {
		return addrDtl;
	}
	/**
	 * @param addrDtl the addrDtl to set
	 */
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	/**
	 * @return the nationCd
	 */
	public String getNationCd() {
		return nationCd;
	}
	/**
	 * @param nationCd the nationCd to set
	 */
	public void setNationCd(String nationCd) {
		this.nationCd = nationCd;
	}
	/**
	 * @return the marriCd
	 */
	public String getMarriCd() {
		return marriCd;
	}
	/**
	 * @param marriCd the marriCd to set
	 */
	public void setMarriCd(String marriCd) {
		this.marriCd = marriCd;
	}
	/**
	 * @return the familyCnt
	 */
	public String getFamilyCnt() {
		return familyCnt;
	}
	/**
	 * @param familyCnt the familyCnt to set
	 */
	public void setFamilyCnt(String familyCnt) {
		this.familyCnt = familyCnt;
	}
	/**
	 * @return the nid
	 */
	public String getNid() {
		return nid;
	}
	/**
	 * @param nid the nid to set
	 */
	public void setNid(String nid) {
		this.nid = nid;
	}
	/**
	 * @return the jcCd
	 */
	public String getJcCd() {
		return jcCd;
	}
	/**
	 * @param jcCd the jcCd to set
	 */
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	/**
	 * @return the userPwdOld
	 */
	public String getUserPwdOld() {
		return userPwdOld;
	}
	/**
	 * @param userPwdOld the userPwdOld to set
	 */
	public void setUserPwdOld(String userPwdOld) {
		this.userPwdOld = userPwdOld;
	}
	/**
	 * @return the userPwd
	 */
	public String getUserPwd() {
		return userPwd;
	}
	/**
	 * @param userPwd the userPwd to set
	 */
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	/**
	 * @return the newPwdApplyYn
	 */
	public String getNewPwdApplyYn() {
		return newPwdApplyYn;
	}
	/**
	 * @param newPwdApplyYn the newPwdApplyYn to set
	 */
	public void setNewPwdApplyYn(String newPwdApplyYn) {
		this.newPwdApplyYn = newPwdApplyYn;
	}
	/**
	 * @return the pwdCreatDt
	 */
	public String getPwdCreatDt() {
		return pwdCreatDt;
	}
	/**
	 * @param pwdCreatDt the pwdCreatDt to set
	 */
	public void setPwdCreatDt(String pwdCreatDt) {
		this.pwdCreatDt = pwdCreatDt;
	}
	/**
	 * @return the pwdFailCnt
	 */
	public String getPwdFailCnt() {
		return pwdFailCnt;
	}
	/**
	 * @param pwdFailCnt the pwdFailCnt to set
	 */
	public void setPwdFailCnt(String pwdFailCnt) {
		this.pwdFailCnt = pwdFailCnt;
	}
	/**
	 * @return the privateInfoUseAgreeYn
	 */
	public String getPrivateInfoUseAgreeYn() {
		return privateInfoUseAgreeYn;
	}
	/**
	 * @param privateInfoUseAgreeYn the privateInfoUseAgreeYn to set
	 */
	public void setPrivateInfoUseAgreeYn(String privateInfoUseAgreeYn) {
		this.privateInfoUseAgreeYn = privateInfoUseAgreeYn;
	}
	/**
	 * @return the smsNtceAgreeYn
	 */
	public String getSmsNtceAgreeYn() {
		return smsNtceAgreeYn;
	}
	/**
	 * @param smsNtceAgreeYn the smsNtceAgreeYn to set
	 */
	public void setSmsNtceAgreeYn(String smsNtceAgreeYn) {
		this.smsNtceAgreeYn = smsNtceAgreeYn;
	}
	/**
	 * @return the emailNtceAgreeYn
	 */
	public String getEmailNtceAgreeYn() {
		return emailNtceAgreeYn;
	}
	/**
	 * @param emailNtceAgreeYn the emailNtceAgreeYn to set
	 */
	public void setEmailNtceAgreeYn(String emailNtceAgreeYn) {
		this.emailNtceAgreeYn = emailNtceAgreeYn;
	}
	/**
	 * @return the emailUserAuthValue
	 */
	public String getEmailUserAuthValue() {
		return emailUserAuthValue;
	}
	/**
	 * @param emailUserAuthValue the emailUserAuthValue to set
	 */
	public void setEmailUserAuthValue(String emailUserAuthValue) {
		this.emailUserAuthValue = emailUserAuthValue;
	}
	/**
	 * @return the userGrpCd
	 */
	public String getUserGrpCd() {
		return userGrpCd;
	}
	/**
	 * @param userGrpCd the userGrpCd to set
	 */
	public void setUserGrpCd(String userGrpCd) {
		this.userGrpCd = userGrpCd;
	}
	/**
	 * @return the userStsCd
	 */
	public String getUserStsCd() {
		return userStsCd;
	}
	/**
	 * @param userStsCd the userStsCd to set
	 */
	public void setUserStsCd(String userStsCd) {
		this.userStsCd = userStsCd;
	}
	/**
	 * @return the accntLockStsCd
	 */
	public String getAccntLockStsCd() {
		return accntLockStsCd;
	}
	/**
	 * @param accntLockStsCd the accntLockStsCd to set
	 */
	public void setAccntLockStsCd(String accntLockStsCd) {
		this.accntLockStsCd = accntLockStsCd;
	}
	/**
	 * @return the wthdrReasonCd
	 */
	public String getWthdrReasonCd() {
		return wthdrReasonCd;
	}
	/**
	 * @param wthdrReasonCd the wthdrReasonCd to set
	 */
	public void setWthdrReasonCd(String wthdrReasonCd) {
		this.wthdrReasonCd = wthdrReasonCd;
	}
	/**
	 * @return the wthdrReason
	 */
	public String getWthdrReason() {
		return wthdrReason;
	}
	/**
	 * @param wthdrReason the wthdrReason to set
	 */
	public void setWthdrReason(String wthdrReason) {
		this.wthdrReason = wthdrReason;
	}
	/**
	 * @return the fileGrpSeq
	 */
	public String getFileGrpSeq() {
		return fileGrpSeq;
	}
	/**
	 * @param fileGrpSeq the fileGrpSeq to set
	 */
	public void setFileGrpSeq(String fileGrpSeq) {
		this.fileGrpSeq = fileGrpSeq;
	}
	/**
	 * @return the lastLoginDt
	 */
	public String getLastLoginDt() {
		return lastLoginDt;
	}
	/**
	 * @param lastLoginDt the lastLoginDt to set
	 */
	public void setLastLoginDt(String lastLoginDt) {
		this.lastLoginDt = lastLoginDt;
	}
	/**
	 * @return the lastLoginIp
	 */
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	/**
	 * @param lastLoginIp the lastLoginIp to set
	 */
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	/**
	 * @return the regUserSeq
	 */
	public String getRegUserSeq() {
		return regUserSeq;
	}
	/**
	 * @param regUserSeq the regUserSeq to set
	 */
	public void setRegUserSeq(String regUserSeq) {
		this.regUserSeq = regUserSeq;
	}
	/**
	 * @return the regDt
	 */
	public String getRegDt() {
		return regDt;
	}
	/**
	 * @param regDt the regDt to set
	 */
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	/**
	 * @return the modUserSeq
	 */
	public String getModUserSeq() {
		return modUserSeq;
	}
	/**
	 * @param modUserSeq the modUserSeq to set
	 */
	public void setModUserSeq(String modUserSeq) {
		this.modUserSeq = modUserSeq;
	}
	/**
	 * @return the modDt
	 */
	public String getModDt() {
		return modDt;
	}
	/**
	 * @param modDt the modDt to set
	 */
	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	/**
	 * @return the list
	 */
	public List<UserBean> getList() {
		return list;
	}
	/**
	 * @param list the list to set
	 */
	public void setList(List<UserBean> list) {
		this.list = list;
	}
	/**
	 * @return the mngId
	 */
	public String getMngId() {
		return mngId;
	}
	/**
	 * @param mngId the mngId to set
	 */
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	/**
	 * @return the mngYn
	 */
	public String getMngYn() {
		return mngYn;
	}
	/**
	 * @param mngYn the mngYn to set
	 */
	public void setMngYn(String mngYn) {
		this.mngYn = mngYn;
	}
	/**
	 * @return the draw
	 */
	public String getDormancyYn() {
		return dormancyYn;
	}

	public void setDormancyYn(String dormancyYn) {
		this.dormancyYn = dormancyYn;
	}
	public String getUserNmEn() {
		return userNmEn;
	}
	public void setUserNmEn(String userNmEn) {
		this.userNmEn = userNmEn;
	}
	public String getUserAuthNm() {
		return userAuthNm;
	}
	public void setUserAuthNm(String userAuthNm) {
		this.userAuthNm = userAuthNm;
	}
	public String getJcTel() {
		return jcTel;
	}
	public void setJcTel(String jcTel) {
		this.jcTel = jcTel;
	}



}
