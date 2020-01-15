package ony.cpes.external.mypage.privt.service;

import java.util.List;

import ony.cmm.common.bean.CommDtlCdBean;
import ony.cmm.common.bean.ConditionBean;
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

public interface ResumeService {
	public List<CommDtlCdBean> selectSkillCdList(ConditionBean conditionBean) throws Exception;
	public int insertResume(ResumeBean param);
	public List<ResumeBean> selectMyResumeList(ResumeBean param);
	public int updateResume(ResumeBean param);
	public int resetPriResumeYn(ResumeBean param);
	public String deleteResume(ResumeBean param);
	public ResumeBean selectResumeDetail(ResumeBean param);
	public List<ResumeHopeWorkLocBean> selectResumeHopeWorkLocDetail(ResumeBean param);
	public List<ResumeSpecialStudyBean> selectResumeSpecialStudyDetail(ResumeBean param);
	public List<ResumeOtherTrnngBean> selectResumeOtherTrnngDetail(ResumeBean param);
	public ResumeLangBean selectResumeLangDetail(ResumeBean param);
	public List<ResumeWorkExpBean> selectResumeWorkExpDetail(ResumeBean param);
	public List<ResumeSkillBean> selectResumeSkillDetail(ResumeBean param);
	public List<ResumeRefManBean> selectResumeRefManDetail(ResumeBean param);
	public List<ResumeDisablBean> selectResumeDisableDetail(ResumeBean param);
	public ResumeGenrlEduBean selectResumeGenrlEduDetail(ResumeBean param);
	public String selectTempResumeCheck(ResumeBean param);
	public JobskReqBean selectJobskReqDetail(ResumeBean param);
	public int updateJobskReq(ResumeBean param);
	public List<CommDtlCdBean> selectResumeSkillForDetail(ResumeBean param) throws Exception;
	public List<ResumeIscoBean> selectResumeIsco(ResumeBean param);
	public int selectPriResumeYnValidation(String param);
	public int deleteJobskReq(String param);
	public int deleteApplic(String param);
	public int deleteOffer(String param);
	public int deleteIntvw(String param);
	public String selectPriResumeSeq(String param);
}
