package ony.cmm.common.service;

import java.util.List;

import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.privt.bean.EduTrnngBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.vacancy.bean.VacancyBean;

public interface IntegratedSearchService {

	/**
	 * 통합검색::Vacancy 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchVacancyListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 통합검색::Vacancy 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<VacancyBean> selectIntegratedSearchVacancyList(CondVacancyBean param) throws Exception;


	/**
	 * 통합검색::Resume 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchResumeListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 통합검색::Vacancy 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<ResumeBean> selectIntegratedSearchResumeList(CondVacancyBean param) throws Exception;


	/**
	 * 통합검색::JobFair 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchJobFairListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 통합검색::JobFair 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<JobFairCenterBean> selectIntegratedSearchJobFairList(CondVacancyBean param) throws Exception;


	/**
	 * 통합검색::Training Program 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchTrainingProgramListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 통합검색::Training Program 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<EduTrnngBean> selectIntegratedSearchTrainingProgramList(CondVacancyBean param) throws Exception;


	/**
	 * 통합검색::NEA Training 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchNEATrainingListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 통합검색::NEA Training 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<EduTrnngBean> selectIntegratedSearchNEATrainingList(CondVacancyBean param) throws Exception;


	/**
	 * 통합검색::Related Institution 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchRelatedInstitutionListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 통합검색::RelatedInstitution 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<InsttMemBean> selectIntegratedSearchRelatedInstitutionList(CondVacancyBean param) throws Exception;

}
