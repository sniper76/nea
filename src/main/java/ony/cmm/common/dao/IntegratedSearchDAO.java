package ony.cmm.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.privt.bean.EduTrnngBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.vacancy.bean.VacancyBean;

@Repository("IntegratedSearchDAO")
public class IntegratedSearchDAO extends EgovAbstractMapper {

	public int selectIntegratedSearchVacancyListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchVacancyListCnt", param);
	}

	public List<VacancyBean> selectIntegratedSearchVacancyList(CondVacancyBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchVacancyList", param);
	}


	public int selectIntegratedSearchResumeListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchResumeListCnt", param);
	}

	public List<ResumeBean> selectIntegratedSearchResumeList(CondVacancyBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchResumeList", param);
	}


	public int selectIntegratedSearchJobFairListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchJobFairListCnt", param);
	}

	public List<JobFairCenterBean> selectIntegratedSearchJobFairList(CondVacancyBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchJobFairList", param);
	}


	public int selectIntegratedSearchTrainingProgramListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchTrainingProgramListCnt", param);
	}

	public List<EduTrnngBean> selectIntegratedSearchTrainingProgramList(CondVacancyBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchTrainingProgramList", param);
	}


	public int selectIntegratedSearchNEATrainingListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchNEATrainingListCnt", param);
	}

	public List<EduTrnngBean> selectIntegratedSearchNEATrainingList(CondVacancyBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchNEATrainingList", param);
	}


	public int selectIntegratedSearchRelatedInstitutionListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchRelatedInstitutionListCnt", param);
	}

	public List<InsttMemBean> selectIntegratedSearchRelatedInstitutionList(CondVacancyBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchRelatedInstitutionList", param);
	}

}
