package ony.cmm.common.service;

import java.util.List;

import ony.cmm.common.bean.CondIntegratedSearchBean;
import ony.cmm.common.bean.SynonymBean;
import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.privt.bean.EduTrnngBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.vacancy.bean.VacancyBean;

public interface IntegratedSearchService {

	/**
	 * 동의어 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<SynonymBean> selectIntegratedSearchSynonymList(CondIntegratedSearchBean param) throws Exception;


	/**
	 * 통합검색::Vacancy 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchVacancyListCnt(CondIntegratedSearchBean param) throws Exception;

	/**
	 * 통합검색::Vacancy 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<VacancyBean> selectIntegratedSearchVacancyList(CondIntegratedSearchBean param) throws Exception;


	/**
	 * 통합검색::Resume 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchResumeListCnt(CondIntegratedSearchBean param) throws Exception;

	/**
	 * 통합검색::Vacancy 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<ResumeBean> selectIntegratedSearchResumeList(CondIntegratedSearchBean param) throws Exception;


	/**
	 * 통합검색::JobFair 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchJobFairListCnt(CondIntegratedSearchBean param) throws Exception;

	/**
	 * 통합검색::JobFair 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<JobFairCenterBean> selectIntegratedSearchJobFairList(CondIntegratedSearchBean param) throws Exception;


	/**
	 * 통합검색::Training Program 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchTrainingProgramListCnt(CondIntegratedSearchBean param) throws Exception;

	/**
	 * 통합검색::Training Program 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<EduTrnngBean> selectIntegratedSearchTrainingProgramList(CondIntegratedSearchBean param) throws Exception;


	/**
	 * 통합검색::NEA Training 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchNEATrainingListCnt(CondIntegratedSearchBean param) throws Exception;

	/**
	 * 통합검색::NEA Training 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<EduTrnngBean> selectIntegratedSearchNEATrainingList(CondIntegratedSearchBean param) throws Exception;


	/**
	 * 통합검색::Related Institution 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchRelatedInstitutionListCnt(CondIntegratedSearchBean param) throws Exception;

	/**
	 * 통합검색::RelatedInstitution 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<InsttMemBean> selectIntegratedSearchRelatedInstitutionList(CondIntegratedSearchBean param) throws Exception;

}
