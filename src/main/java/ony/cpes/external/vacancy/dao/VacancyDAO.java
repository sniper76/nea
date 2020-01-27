package ony.cpes.external.vacancy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.vacancy.bean.VacancyLangBean;
import ony.cpes.external.vacancy.bean.VacancyLocBean;
import ony.cpes.external.vacancy.bean.VacancyPreferntBean;
import ony.cpes.external.member.bean.CompanyBean;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.vacancy.bean.CondVacancyBean;
import ony.cpes.external.vacancy.bean.PopulCompnyBean;
import ony.cpes.external.vacancy.bean.PopulVacancyBean;
import ony.cpes.external.vacancy.bean.VacancyBean;

@Repository("VacancyDAO")
public class VacancyDAO  extends EgovAbstractMapper {


	/**
	 * 구인 상세 조회
	 * offer of a job
	 * @param param
	 * @return VacancyBean
	 */
	public VacancyBean selectVacancy(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectVacancy", param);
	}



	/**
	 * 채용공고별 입사지원
	 * vacancy of applic
	 * @param param
	 * @return ApplicBean
	 */
	public ApplicBean selectVacancyApplic(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectVacancyApplic", param);
	}



	/**
	 * 채용공고별 입사제의
	 * offer of a job
	 * @param param
	 * @return VacancyBean
	 */
	public OfferBean selectVacancyOffer(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectVacancyOffer", param);
	}


	/**
	 * 입사지원별 인터뷰
	 * offer of a job
	 * @param param
	 * @return VacancyBean
	 */
	public IntvwBean selectApplicIntvw(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectApplicIntvw", param);
	}



	/**
	 * 구인 지역 목록 조회
	 * offer of a job loc list
	 * @param param
	 * @return List<VacancyLocBean>
	 */
	public List<VacancyLocBean> selectVacancyLocList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectVacancyLocList", param);
	}


	/**
	 * 구인 언어 목록 조회
	 * offer of a job lang list
	 * @param param
	 * @return List<VacancyLangBean>
	 */
	public List<VacancyLangBean> selectVacancyLangList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectVacancyLangList", param);
	}


	/**
	 * 구인 우대조건 목록 조회
	 * offer of a job Prefernt list
	 * @param param
	 * @return List<VacancyPreferntBean>
	 */
	public List<VacancyPreferntBean> selectVacancyPreferntList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectVacancyPreferntList", param);
	}

	/**
	 * 채용공고 검색 count
	 * vacancy search list count
	 * @param param
	 * @return int
	 */
	public int selectSearchListCnt(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectSearchListCnt", param);
	}


	/**
	 * 채용공고 검색 count
	 * vacancy search list count
	 * @param param
	 * @return int
	 */
	public List<VacancyBean> selectSearchList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectSearchList", param);
	}


	/**
	 * 채용공고 오늘 count
	 * vacancy today count
	 * @param param
	 * @return int
	 */
	public int selectVacancyTodayCnt(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectVacancyTodayCnt", param);
	}

	/**
	 * 오늘의 인기기업 수
	 * @return
	 * @throws Exception
	 */
	public int selectVacancyPopulateCompnyTodayListCnt(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectVacancyPopulateCompnyTodayListCnt", param);
	}

	/**
	 * 오늘의 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulCompnyBean> selectVacancyPopulateCompnyTodayList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectVacancyPopulateCompnyTodayList", param);
	}

	/**
	 * 이주의 인기기업 수
	 * @return
	 * @throws Exception
	 */
	public int selectVacancyPopulateCompnyByWeekListCnt(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectVacancyPopulateCompnyByWeekListCnt", param);
	}

	/**
	 * 이주의 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulCompnyBean> selectVacancyPopulateCompnyByWeekList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectVacancyPopulateCompnyByWeekList", param);
	}

	/**
	 * 이달의 인기기업 수
	 * @return
	 * @throws Exception
	 */
	public int selectVacancyPopulateCompnyByMonthListCnt(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectVacancyPopulateCompnyByMonthListCnt", param);
	}

	/**
	 * 이달의 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulCompnyBean> selectVacancyPopulateCompnyByMonthList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectVacancyPopulateCompnyByMonthList", param);
	}

	/**
	 * 누적 인기기업 수
	 * @return
	 * @throws Exception
	 */
	public int selectVacancyPopulateCompnyByAccumulateListCnt(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectVacancyPopulateCompnyByAccumulateListCnt", param);
	}

	/**
	 * 누적 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulCompnyBean> selectVacancyPopulateCompnyByAccumulateList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectVacancyPopulateCompnyByAccumulateList", param);
	}

	/**
	 * 인기채용공고 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<PopulVacancyBean> selectVacancyPopulateList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectVacancyPopulateList", param);
	}


	/**
	 * 채용공고  최신 60개
	 * vacancy list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectMainVacancyList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectMainVacancyList", param);
	}

	/**
	 * 이달의 인기기업
	 * month company list
	 * @param param
	 * @return List<PopulCompnyBean>
	 */
	public List<PopulCompnyBean> selectMonthCompnyList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectMonthCompnyList", param);
	}


	/**
	 * 오늘의 인기 채용공고
	 * vacancy today list
	 * @param param
	 * @return int
	 */
	public int selectTodayVacancyListCnt(CondVacancyBean param) {
		return getSqlSession().selectOne("vacancy.selectTodayVacancyListCnt", param);
	}

	/**
	 * 오늘의 인기 채용공고
	 * vacancy today list
	 * @param param
	 * @return List<PopulVacancyBean>
	 */
	public List<PopulVacancyBean> selectTodayVacancyList(CondVacancyBean param) {
		return getSqlSession().selectList("vacancy.selectTodayVacancyList", param);
	}

}
