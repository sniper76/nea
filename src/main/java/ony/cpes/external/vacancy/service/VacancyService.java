package ony.cpes.external.vacancy.service;

import java.util.List;

import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.vacancy.bean.CondVacancyBean;
import ony.cpes.external.vacancy.bean.PopulCompnyBean;
import ony.cpes.external.vacancy.bean.PopulVacancyBean;
import ony.cpes.external.vacancy.bean.VacancyBean;





public interface VacancyService {

	/**
	 * 구인 복사 기능
	 * offer of a job copy
	 * @param param
	 * @return VacancyBean
	 */
	public VacancyBean selectVacancy(CondVacancyBean param) throws Exception;


	/**
	 * 채용공고별 입사지원
	 * vacancy of applic
	 * @param param
	 * @return ApplicBean
	 */
	public ApplicBean selectVacancyApplic(CondVacancyBean param) throws Exception;



	/**
	 * 채용공고별 입사제의
	 * offer of a job
	 * @param param
	 * @return VacancyBean
	 */
	public OfferBean selectVacancyOffer(CondVacancyBean param) throws Exception;



	/**
	 * 입사지원별 인터뷰
	 * offer of a job
	 * @param param
	 * @return VacancyBean
	 */
	public IntvwBean selectApplicIntvw(CondVacancyBean param) throws Exception;


	/**
	 * 채용공고 검색 count
	 * vacancy search list count
	 * @param param
	 * @return int
	 */
	public int selectSearchListCnt(CondVacancyBean param) throws Exception;


	/**
	 * 채용공고 검색 count
	 * vacancy search list count
	 * @param param
	 * @return int
	 */
	public List<VacancyBean> selectSearchList(CondVacancyBean param) throws Exception;


	/**
	 * 채용공고 오늘 count
	 * vacancy today count
	 * @param param
	 * @return int
	 */
	public int selectVacancyTodayCnt(CondVacancyBean param) throws Exception;

	/**
	 * 오늘의 인기기업 수
	 * @return
	 * @throws Exception
	 */
	public int selectVacancyPopulateCompnyTodayListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 오늘의 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulCompnyBean> selectVacancyPopulateCompnyTodayList(CondVacancyBean param) throws Exception;

	/**
	 * 이주의 인기기업 수
	 * @return
	 * @throws Exception
	 */
	public int selectVacancyPopulateCompnyByWeekListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 이주의 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulCompnyBean> selectVacancyPopulateCompnyByWeekList(CondVacancyBean param) throws Exception;

	/**
	 * 이달의 인기기업 수
	 * @return
	 * @throws Exception
	 */
	public int selectVacancyPopulateCompnyByMonthListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 이달의 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulCompnyBean> selectVacancyPopulateCompnyByMonthList(CondVacancyBean param) throws Exception;

	/**
	 * 누적 인기기업 수
	 * @return
	 * @throws Exception
	 */
	public int selectVacancyPopulateCompnyByAccumulateListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 누적 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulCompnyBean> selectVacancyPopulateCompnyByAccumulateList(CondVacancyBean param) throws Exception;

	/**
	 * 인기채용공고 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulVacancyBean> selectVacancyPopulateList(CondVacancyBean param) throws Exception;

}
