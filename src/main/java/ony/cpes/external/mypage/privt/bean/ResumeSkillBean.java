package ony.cpes.external.mypage.privt.bean;

import ony.cmm.common.bean.CommonBean;
/**
 * bean 이력서 추천인 정보를 담는 Bean
 *
 * @author 박호진
 * @version 1.0
 * @since 2019.11.06
 */
public class ResumeSkillBean extends CommonBean {

	private String resumeSkillSeq;
	private String resumeSkillId;
	private String skillCd;
	private String resumeSeq;

	public String getResumeSkillSeq() {
		return resumeSkillSeq;
	}
	public void setResumeSkillSeq(String resumeSkillSeq) {
		this.resumeSkillSeq = resumeSkillSeq;
	}
	public String getResumeSkillId() {
		return resumeSkillId;
	}
	public void setResumeSkillId(String resumeSkillId) {
		this.resumeSkillId = resumeSkillId;
	}
	public String getSkillCd() {
		return skillCd;
	}
	public void setSkillCd(String skillCd) {
		this.skillCd = skillCd;
	}
	public String getResumeSeq() {
		return resumeSeq;
	}
	public void setResumeSeq(String resumeSeq) {
		this.resumeSeq = resumeSeq;
	}
}
