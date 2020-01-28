package ony.cmm.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

import ony.cmm.common.bean.CondIntegratedSearchBean;
import ony.cmm.common.bean.SynonymBean;
import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.privt.bean.EduTrnngBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.vacancy.bean.VacancyBean;

@Repository("IntegratedSearchDAO")
public class IntegratedSearchDAO extends EgovAbstractMapper {

	/**
	 * 동의어 조회
	 * @param param
	 * @return
	 */
	public List<SynonymBean> selectIntegratedSearchSynonymList(CondIntegratedSearchBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchSynonymList", param);
	}


	/**
	 * 통합검색::Vacancy 조회::총건수
	 * @param param
	 * @return
	 */
	public int selectIntegratedSearchVacancyListCnt(CondIntegratedSearchBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchVacancyListCnt", param);
	}

	/**
	 * 통합검색::Vacancy 조회::목록
	 * @param param
	 * @return
	 */
	public List<VacancyBean> selectIntegratedSearchVacancyList(CondIntegratedSearchBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchVacancyList", param);
	}


	/**
	 * 통합검색::Resume 조회::총건수
	 * @param param
	 * @return
	 */
	public int selectIntegratedSearchResumeListCnt(CondIntegratedSearchBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchResumeListCnt", param);
	}

	/**
	 * 통합검색::Vacancy 조회::목록
	 * @param param
	 * @return
	 */
	public List<ResumeBean> selectIntegratedSearchResumeList(CondIntegratedSearchBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchResumeList", param);
	}


	/**
	 * 통합검색::JobFair 조회::총건수
	 * @param param
	 * @return
	 */
	public int selectIntegratedSearchJobFairListCnt(CondIntegratedSearchBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchJobFairListCnt", param);
	}

	/**
	 * 통합검색::JobFair 조회::목록
	 * @param param
	 * @return
	 */
	public List<JobFairCenterBean> selectIntegratedSearchJobFairList(CondIntegratedSearchBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchJobFairList", param);
	}


	/**
	 * 통합검색::Training Program 조회::총건수
	 * @param param
	 * @return
	 */
	public int selectIntegratedSearchTrainingProgramListCnt(CondIntegratedSearchBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchTrainingProgramListCnt", param);
	}

	/**
	 * 통합검색::Training Program 조회::목록
	 * @param param
	 * @return
	 */
	public List<EduTrnngBean> selectIntegratedSearchTrainingProgramList(CondIntegratedSearchBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchTrainingProgramList", param);
	}


	/**
	 * 통합검색::NEA Training 조회::총건수
	 * @param param
	 * @return
	 */
	public int selectIntegratedSearchNEATrainingListCnt(CondIntegratedSearchBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchNEATrainingListCnt", param);
	}

	/**
	 * 통합검색::NEA Training 조회::목록
	 * @param param
	 * @return
	 */
	public List<EduTrnngBean> selectIntegratedSearchNEATrainingList(CondIntegratedSearchBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchNEATrainingList", param);
	}


	/**
	 * 통합검색::Related Institution 조회::총건수
	 * @param param
	 * @return
	 */
	public int selectIntegratedSearchRelatedInstitutionListCnt(CondIntegratedSearchBean param) {
		return  getSqlSession().selectOne("integrated.selectIntegratedSearchRelatedInstitutionListCnt", param);
	}

	/**
	 * 통합검색::RelatedInstitution 조회::목록
	 * @param param
	 * @return
	 */
	public List<InsttMemBean> selectIntegratedSearchRelatedInstitutionList(CondIntegratedSearchBean param) {
		return  getSqlSession().selectList("integrated.selectIntegratedSearchRelatedInstitutionList", param);
	}

}
