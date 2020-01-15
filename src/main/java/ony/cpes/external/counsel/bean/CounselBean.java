package ony.cpes.external.counsel.bean;



import ony.cmm.common.bean.CommonBean;

/**
 * LOGIN CONDITION bean
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
public class CounselBean extends CommonBean{

	private static final long serialVersionUID = 4979179976898050104L;


	private String ansContent;//답변_내용
	private String ansFileGrpSeq;//답변_파일_그룹_시퀀스
	private String ansModDt;//답변_수정_날짜
	private String ansModUserSeq;//답변_수정_사용자_시퀀스
	private String ansRegDt;//답변_등록_날짜
	private String ansRegUserSeq;//답변_등록_사용자_시퀀스
	private String ansTitle;//답변_제목
	private String counselAmpm;//상담_오전오후
	private String counselCateDivCd;//상담_카테고리_구분_코드(학생/인턴/일반)(COUNSEL_CATE_DIV_CD)
	private String counselCateDivNm;//상담_카테고리_구분_코드(학생/인턴/일반)(COUNSEL_CATE_DIV_CD)
	private String counselDt;//상담_날짜
	private String counselHour;//상담_시간
	private String counselMethodDivCd;//상담_방법_구분_코드(온/오프)(COUNSEL_METHOD_DIV_CD)
	private String counselMethodDivNm;//상담_방법_구분_코드(온/오프)(COUNSEL_METHOD_DIV_CD)
	private String counselMinute;//상담_분
	private String counselNtce;//상담_알림
	private String counselSeq;//상담_시퀀스
	private String counselStsCd;//상담_진행_상태
	private String counselStsNm;//상담_진행_상태
	private String counselTargetCd;//상담_대상_코드
	private String delYn;//삭제_여부
	private String hopeCounselBgnAmpm;//
	private String hopeCounselBgnTime;//
	private String hopeCounselDt;//희망_상담_날짜
	private String hopeCounselEndAmpm;//
	private String hopeCounselEndTime;//
	private String iscoCd;//ISCO_코드(ISCO_CD)
	private String jcCd;//JOB_CENTER_코드(JC_CD)
	private String jcUserSeq;//JOB_CENTER_사용자_시퀀스
	private String likeCnt;//좋아요_카운트
	private String qustContent;//문의_내용
	private String qustEtcReq;//문의_기타_당부
	private String qustFileGrpSeq;//문의_파일_그룹_시퀀스
	private String qustJcCd;//문의_파일_그룹_시퀀스
	private String qustJcNm;//문의_파일_그룹_시퀀스
	private String qustModDt;//문의_등록_사용자_시퀀스
	private String qustModUserSeq;//문의_등록_사용자_시퀀스
	private String qustRegDt;//문의_등록_날짜
	private String qustRegUserSeq;//문의_등록_사용자_시퀀스
	private String qustTitle;//문의_제목
	private String secretYn;//비밀_여부
	private String userSeq;//사용자_시퀀스
	private String viewCnt;//조회_수
	private String likeYn;//조회_수
	private String viewYn;//상세화면 접근가능여부
	private String newYn;//신규글인지
	private String modifyYn;//수정가능한지
	private String ansRegNm;//상담자명
	private String userTel;//상담자연락처

	// 조회 관련
	private String likeSeq;

	public String getLikeSeq() {
		return likeSeq;
	}
	public void setLikeSeq(String likeSeq) {
		this.likeSeq = likeSeq;
	}
	public String getAnsContent() {
		return ansContent;
	}
	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}
	public String getAnsFileGrpSeq() {
		return ansFileGrpSeq;
	}
	public void setAnsFileGrpSeq(String ansFileGrpSeq) {
		this.ansFileGrpSeq = ansFileGrpSeq;
	}
	public String getAnsModDt() {
		return ansModDt;
	}
	public void setAnsModDt(String ansModDt) {
		this.ansModDt = ansModDt;
	}
	public String getAnsModUserSeq() {
		return ansModUserSeq;
	}
	public void setAnsModUserSeq(String ansModUserSeq) {
		this.ansModUserSeq = ansModUserSeq;
	}
	public String getAnsRegDt() {
		return ansRegDt;
	}
	public void setAnsRegDt(String ansRegDt) {
		this.ansRegDt = ansRegDt;
	}
	public String getAnsRegUserSeq() {
		return ansRegUserSeq;
	}
	public void setAnsRegUserSeq(String ansRegUserSeq) {
		this.ansRegUserSeq = ansRegUserSeq;
	}
	public String getAnsTitle() {
		return ansTitle;
	}
	public void setAnsTitle(String ansTitle) {
		this.ansTitle = ansTitle;
	}
	public String getCounselAmpm() {
		return counselAmpm;
	}
	public void setCounselAmpm(String counselAmpm) {
		this.counselAmpm = counselAmpm;
	}
	public String getCounselCateDivCd() {
		return counselCateDivCd;
	}
	public String getCounselCateDivNm() {
		return counselCateDivNm;
	}
	public void setCounselCateDivNm(String counselCateDivNm) {
		this.counselCateDivNm = counselCateDivNm;
	}
	public void setCounselCateDivCd(String counselCateDivCd) {
		this.counselCateDivCd = counselCateDivCd;
	}
	public String getCounselDt() {
		return counselDt;
	}
	public void setCounselDt(String counselDt) {
		this.counselDt = counselDt;
	}
	public String getCounselHour() {
		return counselHour;
	}
	public void setCounselHour(String counselHour) {
		this.counselHour = counselHour;
	}
	public String getCounselMethodDivCd() {
		return counselMethodDivCd;
	}
	public String getCounselMethodDivNm() {
		return counselMethodDivNm;
	}
	public void setCounselMethodDivNm(String counselMethodDivNm) {
		this.counselMethodDivNm = counselMethodDivNm;
	}
	public void setCounselMethodDivCd(String counselMethodDivCd) {
		this.counselMethodDivCd = counselMethodDivCd;
	}
	public String getCounselMinute() {
		return counselMinute;
	}
	public void setCounselMinute(String counselMinute) {
		this.counselMinute = counselMinute;
	}
	public String getCounselNtce() {
		return counselNtce;
	}
	public void setCounselNtce(String counselNtce) {
		this.counselNtce = counselNtce;
	}
	public String getCounselSeq() {
		return counselSeq;
	}
	public void setCounselSeq(String counselSeq) {
		this.counselSeq = counselSeq;
	}
	public String getCounselStsCd() {
		return counselStsCd;
	}
	public void setCounselStsCd(String counselStsCd) {
		this.counselStsCd = counselStsCd;
	}
	public String getCounselStsNm() {
		return counselStsNm;
	}
	public void setCounselStsNm(String counselStsNm) {
		this.counselStsNm = counselStsNm;
	}
	public String getCounselTargetCd() {
		return counselTargetCd;
	}
	public void setCounselTargetCd(String counselTargetCd) {
		this.counselTargetCd = counselTargetCd;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getHopeCounselDt() {
		return hopeCounselDt;
	}
	public void setHopeCounselDt(String hopeCounselDt) {
		this.hopeCounselDt = hopeCounselDt;
	}
	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
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
	public String getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(String likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getQustContent() {
		return qustContent;
	}
	public void setQustContent(String qustContent) {
		this.qustContent = qustContent;
	}
	public String getQustEtcReq() {
		return qustEtcReq;
	}
	public void setQustEtcReq(String qustEtcReq) {
		this.qustEtcReq = qustEtcReq;
	}
	public String getQustFileGrpSeq() {
		return qustFileGrpSeq;
	}
	public String getQustJcCd() {
		return qustJcCd;
	}
	public void setQustJcCd(String qustJcCd) {
		this.qustJcCd = qustJcCd;
	}
	public String getQustJcNm() {
		return qustJcNm;
	}
	public void setQustJcNm(String qustJcNm) {
		this.qustJcNm = qustJcNm;
	}
	public void setQustFileGrpSeq(String qustFileGrpSeq) {
		this.qustFileGrpSeq = qustFileGrpSeq;
	}
	public String getQustRegDt() {
		return qustRegDt;
	}
	public void setQustRegDt(String qustRegDt) {
		this.qustRegDt = qustRegDt;
	}
	public String getQustRegUserSeq() {
		return qustRegUserSeq;
	}
	public void setQustRegUserSeq(String qustRegUserSeq) {
		this.qustRegUserSeq = qustRegUserSeq;
	}
	public String getQustTitle() {
		return qustTitle;
	}
	public void setQustTitle(String qustTitle) {
		this.qustTitle = qustTitle;
	}
	public String getSecretYn() {
		return secretYn;
	}
	public void setSecretYn(String secretYn) {
		this.secretYn = secretYn;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(String viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getHopeCounselBgnAmpm() {
		return hopeCounselBgnAmpm;
	}
	public void setHopeCounselBgnAmpm(String hopeCounselBgnAmpm) {
		this.hopeCounselBgnAmpm = hopeCounselBgnAmpm;
	}
	public String getHopeCounselBgnTime() {
		return hopeCounselBgnTime;
	}
	public void setHopeCounselBgnTime(String hopeCounselBgnTime) {
		this.hopeCounselBgnTime = hopeCounselBgnTime;
	}
	public String getHopeCounselEndAmpm() {
		return hopeCounselEndAmpm;
	}
	public void setHopeCounselEndAmpm(String hopeCounselEndAmpm) {
		this.hopeCounselEndAmpm = hopeCounselEndAmpm;
	}
	public String getHopeCounselEndTime() {
		return hopeCounselEndTime;
	}
	public void setHopeCounselEndTime(String hopeCounselEndTime) {
		this.hopeCounselEndTime = hopeCounselEndTime;
	}
	public String getQustModDt() {
		return qustModDt;
	}
	public void setQustModDt(String qustModDt) {
		this.qustModDt = qustModDt;
	}
	public String getQustModUserSeq() {
		return qustModUserSeq;
	}
	public void setQustModUserSeq(String qustModUserSeq) {
		this.qustModUserSeq = qustModUserSeq;
	}
	public String getLikeYn() {
		return likeYn;
	}
	public void setLikeYn(String likeYn) {
		this.likeYn = likeYn;
	}
	public String getViewYn() {
		return viewYn;
	}
	public void setViewYn(String viewYn) {
		this.viewYn = viewYn;
	}
	public String getNewYn() {
		return newYn;
	}
	public void setNewYn(String newYn) {
		this.newYn = newYn;
	}
	public String getModifyYn() {
		return modifyYn;
	}
	public void setModifyYn(String modifyYn) {
		this.modifyYn = modifyYn;
	}
	public String getAnsRegNm() {
		return ansRegNm;
	}
	public void setAnsRegNm(String ansRegNm) {
		this.ansRegNm = ansRegNm;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}




}
