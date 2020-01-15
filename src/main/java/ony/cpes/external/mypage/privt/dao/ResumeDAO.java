package ony.cpes.external.mypage.privt.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.JobskReqBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.mypage.privt.bean.ResumeDisablBean;
import ony.cpes.external.mypage.privt.bean.ResumeGenrlEduBean;
import ony.cpes.external.mypage.privt.bean.ResumeHopeWorkLocBean;
import ony.cpes.external.mypage.privt.bean.ResumeIscoBean;
import ony.cpes.external.mypage.privt.bean.ResumeLangBean;
import ony.cpes.external.mypage.privt.bean.ResumeOtherTrnngBean;
import ony.cpes.external.mypage.privt.bean.ResumeRefManBean;
import ony.cpes.external.mypage.privt.bean.ResumeSkillBean;
import ony.cpes.external.mypage.privt.bean.ResumeSpecialStudyBean;
import ony.cpes.external.mypage.privt.bean.ResumeWorkExpBean;

@Repository("ResumeDAO")
public class ResumeDAO extends EgovAbstractMapper{

	public int insertResume(ResumeBean param) {
		return getSqlSession().insert("setResume.insertResume", param);
	}

	public int insertResumeHopeWorkLoc(ResumeHopeWorkLocBean param) {
		return getSqlSession().insert("setResume.insertResumeHopeWorkLoc", param);
	}

	public int insertResumeSpecialStudy(ResumeSpecialStudyBean param) {
		return getSqlSession().insert("setResume.insertResumeSpecialStudy", param);
	}

	public int insertResumeOtherTrnng(ResumeOtherTrnngBean param) {
		return getSqlSession().insert("setResume.insertResumeOtherTrnng", param);
	}

	public int insertResumeLang(ResumeLangBean param) {
		return getSqlSession().insert("setResume.insertResumeLang", param);
	}

	public int insertResumeWorkExp(ResumeWorkExpBean param) {
		return getSqlSession().insert("setResume.insertResumeWorkExp", param);
	}

	public int insertResumeSkill(ResumeSkillBean param) {
		return getSqlSession().insert("setResume.insertResumeSkill", param);
	}

	public int insertResumeRefMan(ResumeRefManBean param) {
		return getSqlSession().insert("setResume.insertResumeRefMan", param);
	}

	public int insertResumeDisable(ResumeDisablBean param) {
		return getSqlSession().insert("setResume.insertResumeDisable", param);
	}

	public int insertResumeGenrlEdu(ResumeGenrlEduBean param) {
		return getSqlSession().insert("setResume.insertResumeGenrlEdu", param);
	}

	public int selectResumeTotCnt(ResumeBean param) {
		return getSqlSession().selectOne("resume.selectResumeTotCnt", param);
	}

	public List<ResumeBean> selectMyResumeList(ResumeBean param){
		return getSqlSession().selectList("resume.selectMyResumeList", param);
	}

	public int updateResume(ResumeBean param) {
		return getSqlSession().update("setResume.updateResume", param);
	}

	public int resetPriResumeYn(ResumeBean param) {
		return getSqlSession().update("setResume.resetPriResumeYn", param);
	}

	public int deleteResume(ResumeBean param) {
		return getSqlSession().update("setResume.deleteResume", param);
	}

	public String selectDeleteValidation(ResumeBean param) {
		return getSqlSession().selectOne("resume.selectDeleteValidation", param);
	}

	public String selectTempResumeCheck(ResumeBean param) {
		return getSqlSession().selectOne("resume.selectTempResumeCheck", param);
	}

	public ResumeBean selectResumeDetail(ResumeBean param) {
		return getSqlSession().selectOne("resume.selectResumeDetail", param);
	}

	public List<ResumeHopeWorkLocBean> selectResumeHopeWorkLocDetail(ResumeBean param){
		return getSqlSession().selectList("resume.selectResumeHopeWorkLocDetail", param);
	}

	public List<ResumeSpecialStudyBean> selectResumeSpecialStudyDetail(ResumeBean param){
		return getSqlSession().selectList("resume.selectResumeSpecialStudyDetail", param);
	}

	public List<ResumeOtherTrnngBean> selectResumeOtherTrnngDetail(ResumeBean param){
		return getSqlSession().selectList("resume.selectResumeOtherTrnngDetail", param);
	}

	public List<ResumeLangBean> selectResumeLangDetail(ResumeBean param){
		return getSqlSession().selectList("resume.selectResumeLangDetail", param);
	}

	public List<ResumeWorkExpBean> selectResumeWorkExpDetail(ResumeBean param){
		return getSqlSession().selectList("resume.selectResumeWorkExpDetail", param);
	}

	public List<ResumeSkillBean> selectResumeSkillDetail(ResumeBean param){
		return getSqlSession().selectList("resume.selectResumeSkillDetail", param);
	}

	public List<ResumeRefManBean> selectResumeRefManDetail(ResumeBean param){
		return getSqlSession().selectList("resume.selectResumeRefManDetail", param);
	}

	public List<ResumeDisablBean> selectResumeDisableDetail(ResumeBean param){
		return getSqlSession().selectList("resume.selectResumeDisableDetail", param);
	}

	public ResumeGenrlEduBean selectResumeGenrlEduDetail(ResumeBean param){
		return getSqlSession().selectOne("resume.selectResumeGenrlEduDetail", param);
	}

	public int deleteResumeHopeWorkLoc(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeHopeWorkLoc", param);
	}

	public int deleteResumeGenrlEdu(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeGenrlEdu", param);
	}

	public int deleteResumeSpecialStudy(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeSpecialStudy", param);
	}

	public int deleteResumeOtherTrnng(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeOtherTrnng", param);
	}

	public int deleteResumeLang(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeLang", param);
	}

	public int deleteResumeWorkExp(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeWorkExp", param);
	}

	public int deleteResumeSkill(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeSkill", param);
	}

	public int deleteResumeRefMan(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeRefMan", param);
	}

	public int deleteResumeDisabl(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeDisabl", param);
	}

	public JobskReqBean selectJobskReqDetail(ResumeBean param) {
		return getSqlSession().selectOne("resume.selectJobskReqDetail", param);
	}

	public int updateJobskReq(ResumeBean param) {
		return getSqlSession().update("setResume.updateJobskReq", param);
	}

	public int insertResumeIsco(ResumeIscoBean param) {
		return getSqlSession().insert("setResume.insertResumeIsco", param);
	}

	public int deleteResumeIsco(ResumeBean param) {
		return getSqlSession().delete("setResume.deleteResumeIsco", param);
	}

	public List<ResumeIscoBean> selectResumeIsco(ResumeBean param){
		return getSqlSession().selectList("resume.selectResumeIsco", param);
	}

	public int selectPriResumeYnValidation(String param) {
		return getSqlSession().selectOne("resume.selectPriResumeYnValidation", param);
	}

	public int deleteJobskReq(String param) {
		return getSqlSession().update("setResume.deleteJobskReq", param);
	}

	public int deleteApplic(String param) {
		return getSqlSession().delete("setResume.deleteApplic", param);
	}

	public int deleteOffer(String param) {
		return getSqlSession().delete("setResume.deleteOffer", param);
	}

	public int deleteIntvw(String param) {
		return getSqlSession().delete("setResume.deleteIntvw", param);
	}

	public String selectPriResumeSeq(String param) {
		return getSqlSession().selectOne("resume.selectPriResumeSeq", param);
	}

}
