package ony.cpes.external.jobstudy.bean;

import java.util.List;

import ony.cmm.common.bean.CommonBean;


/**
 * board bean
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
public class JobStudyBean extends CommonBean {
	private static final long serialVersionUID = 4979179976898050104L;

	private String iscoId;//
	private String iscoCd;//
	private String enNm;//
	private String khNm;//
	private String upperCd;//
	private String cdLvl;//
	private String useYn;//
	private String lvl;//
	private String expln;//
	private String cateNm;//
	private String jobCateCd;//
	private String iscoNm;//
	private String fullPath;//
	private int lvlCnt;

	private String occupIncNm;
	private String occupExcNm;
	private String noteNm;
	private String defNm;
	private String taskNm;
	private String titleNm;
	private String dutiesNm;
	private String skillNm;
	private String responsibilitiesNm;
	private String eduTrnngNm;
	private String highEduNm;
	private String majorStudyNm;
	private String skillRelatedExpNm;
	private String jobCateNm;
	private String depthNm1;
	private String depthNm2;
	private String depthNm3;
	private String depthNm4;

	private List<JobStudyBean> list;
	private List<JobStudyBean> underList;
	private int underListCnt;
	private int totCnt;

	public String getDepthNm1() {
		return depthNm1;
	}
	public void setDepthNm1(String depthNm1) {
		this.depthNm1 = depthNm1;
	}
	public String getDepthNm2() {
		return depthNm2;
	}
	public void setDepthNm2(String depthNm2) {
		this.depthNm2 = depthNm2;
	}
	public String getDepthNm3() {
		return depthNm3;
	}
	public void setDepthNm3(String depthNm3) {
		this.depthNm3 = depthNm3;
	}
	public String getDepthNm4() {
		return depthNm4;
	}
	public void setDepthNm4(String depthNm4) {
		this.depthNm4 = depthNm4;
	}
	public int getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	public List<JobStudyBean> getList() {
		return list;
	}
	public void setList(List<JobStudyBean> list) {
		this.list = list;
	}
	public int getUnderListCnt() {
		return underListCnt;
	}
	public void setUnderListCnt(int underListCnt) {
		this.underListCnt = underListCnt;
	}
	public List<JobStudyBean> getUnderList() {
		return underList;
	}
	public void setUnderList(List<JobStudyBean> underList) {
		this.underList = underList;
	}
	public String getOccupIncNm() {
		return occupIncNm;
	}
	public void setOccupIncNm(String occupIncNm) {
		this.occupIncNm = occupIncNm;
	}
	public String getOccupExcNm() {
		return occupExcNm;
	}
	public void setOccupExcNm(String occupExcNm) {
		this.occupExcNm = occupExcNm;
	}
	public String getNoteNm() {
		return noteNm;
	}
	public void setNoteNm(String noteNm) {
		this.noteNm = noteNm;
	}
	public String getDefNm() {
		return defNm;
	}
	public void setDefNm(String defNm) {
		this.defNm = defNm;
	}
	public String getTaskNm() {
		return taskNm;
	}
	public void setTaskNm(String taskNm) {
		this.taskNm = taskNm;
	}
	public String getTitleNm() {
		return titleNm;
	}
	public void setTitleNm(String titleNm) {
		this.titleNm = titleNm;
	}
	public String getDutiesNm() {
		return dutiesNm;
	}
	public void setDutiesNm(String dutiesNm) {
		this.dutiesNm = dutiesNm;
	}
	public String getSkillNm() {
		return skillNm;
	}
	public void setSkillNm(String skillNm) {
		this.skillNm = skillNm;
	}
	public String getResponsibilitiesNm() {
		return responsibilitiesNm;
	}
	public void setResponsibilitiesNm(String responsibilitiesNm) {
		this.responsibilitiesNm = responsibilitiesNm;
	}
	public String getEduTrnngNm() {
		return eduTrnngNm;
	}
	public void setEduTrnngNm(String eduTrnngNm) {
		this.eduTrnngNm = eduTrnngNm;
	}
	public String getHighEduNm() {
		return highEduNm;
	}
	public void setHighEduNm(String highEduNm) {
		this.highEduNm = highEduNm;
	}
	public String getMajorStudyNm() {
		return majorStudyNm;
	}
	public void setMajorStudyNm(String majorStudyNm) {
		this.majorStudyNm = majorStudyNm;
	}
	public String getSkillRelatedExpNm() {
		return skillRelatedExpNm;
	}
	public void setSkillRelatedExpNm(String skillRelatedExpNm) {
		this.skillRelatedExpNm = skillRelatedExpNm;
	}
	public String getJobCateNm() {
		return jobCateNm;
	}
	public void setJobCateNm(String jobCateNm) {
		this.jobCateNm = jobCateNm;
	}
	public String getIscoId() {
		return iscoId;
	}
	public void setIscoId(String iscoId) {
		this.iscoId = iscoId;
	}
	public String getIscoCd() {
		return iscoCd;
	}
	public void setIscoCd(String iscoCd) {
		this.iscoCd = iscoCd;
	}
	public String getEnNm() {
		return enNm;
	}
	public void setEnNm(String enNm) {
		this.enNm = enNm;
	}
	public String getKhNm() {
		return khNm;
	}
	public void setKhNm(String khNm) {
		this.khNm = khNm;
	}
	public String getUpperCd() {
		return upperCd;
	}
	public void setUpperCd(String upperCd) {
		this.upperCd = upperCd;
	}
	public String getCdLvl() {
		return cdLvl;
	}
	public void setCdLvl(String cdLvl) {
		this.cdLvl = cdLvl;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getExpln() {
		return expln;
	}
	public void setExpln(String expln) {
		this.expln = expln;
	}
	public String getCateNm() {
		return cateNm;
	}
	public void setCateNm(String cateNm) {
		this.cateNm = cateNm;
	}
	public String getJobCateCd() {
		return jobCateCd;
	}
	public void setJobCateCd(String jobCateCd) {
		this.jobCateCd = jobCateCd;
	}
	public String getIscoNm() {
		return iscoNm;
	}
	public void setIscoNm(String iscoNm) {
		this.iscoNm = iscoNm;
	}
	public String getFullPath() {
		return fullPath;
	}
	public void setFullPath(String fullPath) {
		this.fullPath = fullPath;
	}
	public int getLvlCnt() {
		return lvlCnt;
	}
	public void setLvlCnt(int lvlCnt) {
		this.lvlCnt = lvlCnt;
	}




}
