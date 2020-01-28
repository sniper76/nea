package ony.cmm.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.bean.CondIntegratedSearchBean;
import ony.cmm.common.bean.SynonymBean;
import ony.cmm.common.dao.IntegratedSearchDAO;
import ony.cmm.common.service.IntegratedSearchService;
import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.privt.bean.EduTrnngBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.vacancy.bean.VacancyBean;

@Service("IntegratedSearchService")
public class IntegratedSearchServiceImpl implements IntegratedSearchService {

	@Autowired
	private IntegratedSearchDAO integratedSearchDAO;

	/**
	 * 동의어 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<SynonymBean> selectIntegratedSearchSynonymList(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchSynonymList(param);
	}


	/**
	 * 통합검색::Vacancy 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchVacancyListCnt(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchVacancyListCnt(param);
	}

	/**
	 * 통합검색::Vacancy 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<VacancyBean> selectIntegratedSearchVacancyList(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchVacancyList(param);
	}


	/**
	 * 통합검색::Resume 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchResumeListCnt(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchResumeListCnt(param);
	}

	/**
	 * 통합검색::Vacancy 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<ResumeBean> selectIntegratedSearchResumeList(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchResumeList(param);
	}


	/**
	 * 통합검색::JobFair 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchJobFairListCnt(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchJobFairListCnt(param);
	}

	/**
	 * 통합검색::JobFair 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<JobFairCenterBean> selectIntegratedSearchJobFairList(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchJobFairList(param);
	}


	/**
	 * 통합검색::Training Program 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchTrainingProgramListCnt(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchTrainingProgramListCnt(param);
	}

	/**
	 * 통합검색::Training Program 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<EduTrnngBean> selectIntegratedSearchTrainingProgramList(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchTrainingProgramList(param);
	}


	/**
	 * 통합검색::NEA Training 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchNEATrainingListCnt(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchNEATrainingListCnt(param);
	}

	/**
	 * 통합검색::NEA Training 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<EduTrnngBean> selectIntegratedSearchNEATrainingList(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchNEATrainingList(param);
	}


	/**
	 * 통합검색::Related Institution 조회::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectIntegratedSearchRelatedInstitutionListCnt(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchRelatedInstitutionListCnt(param);
	}

	/**
	 * 통합검색::RelatedInstitution 조회::목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<InsttMemBean> selectIntegratedSearchRelatedInstitutionList(CondIntegratedSearchBean param) throws Exception {
		return integratedSearchDAO.selectIntegratedSearchRelatedInstitutionList(param);
	}

}
