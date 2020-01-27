package ony.cpes.external.mypage.compny.bean;

import ony.cmm.common.bean.CommonBean;

/**
 * Company Vacancy Interview Bean
 * @author kj.park
 * @since
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일           수정자     수정내용
 *  ------------- -------- ---------------------------
 *  2020.01.21 KJ.PARK
 *
 * </pre>
 */
public class VacancyIntvwBean extends CommonBean {

	private String videoIntvwPatcptnSeq;
	private String intvwSeq;
	private String userSeq;
	private String userNm;
	private String userCell;
	private String jcCd;
	private String jcNm;
	private String intvwDt;
	private String regDt;
	private String resumeSeq;

	private String ableDelYn;

	public String getVideoIntvwPatcptnSeq() {
		return videoIntvwPatcptnSeq;
	}
	public void setVideoIntvwPatcptnSeq(String videoIntvwPatcptnSeq) {
		this.videoIntvwPatcptnSeq = videoIntvwPatcptnSeq;
	}
	public String getIntvwSeq() {
		return intvwSeq;
	}
	public void setIntvwSeq(String intvwSeq) {
		this.intvwSeq = intvwSeq;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserCell() {
		return userCell;
	}
	public void setUserCell(String userCell) {
		this.userCell = userCell;
	}
	public String getJcCd() {
		return jcCd;
	}
	public void setJcCd(String jcCd) {
		this.jcCd = jcCd;
	}
	public String getJcNm() {
		return jcNm;
	}
	public void setJcNm(String jcNm) {
		this.jcNm = jcNm;
	}
	public String getIntvwDt() {
		return intvwDt;
	}
	public void setIntvwDt(String intvwDt) {
		this.intvwDt = intvwDt;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
	public String getAbleDelYn() {
		return ableDelYn;
	}
	public void setAbleDelYn(String ableDelYn) {
		this.ableDelYn = ableDelYn;
	}

}
