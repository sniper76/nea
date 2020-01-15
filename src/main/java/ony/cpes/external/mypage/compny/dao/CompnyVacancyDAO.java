package ony.cpes.external.mypage.compny.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyLangBean;
import ony.cpes.external.mypage.compny.bean.VacancyLocBean;
import ony.cpes.external.mypage.compny.bean.VacancyPreferntBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;


@Repository("CompnyVacancyDAO")
public class CompnyVacancyDAO  extends EgovAbstractMapper {
	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancySimpleList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectVacancySimpleList", param);
	}


	/**
	 * 구인 신규 등록
	 * offer of a job insert
	 * @param param
	 * @return int
	 */
	public int insertVacancy(VacancyBean vacancyBean) {
		return  getSqlSession().insert("setCompnyVacancy.insertVacancy", vacancyBean);
	}

	/**
	 * 구인 언어 등록
	 * offer of a job insert
	 * @param param
	 * @return int
	 */
	public int insertVacancyLang(VacancyLangBean vacancyLangBean) {
		return  getSqlSession().insert("setCompnyVacancy.insertVacancyLang", vacancyLangBean);
	}


	/**
	 * 구인 우대 등록
	 * offer of a job insert
	 * @param param
	 * @return int
	 */
	public int insertVacancyPrefernt(VacancyPreferntBean vacancyPreferntBean) {
		return  getSqlSession().insert("setCompnyVacancy.insertVacancyPrefernt", vacancyPreferntBean);
	}



	/**
	 * 구인 상세 조회
	 * offer of a job
	 * @param param
	 * @return VacancyBean
	 */
	public VacancyBean selectVacancy(CondVacancyBean param) {
		return  getSqlSession().selectOne("compnyVacancy.selectVacancy", param);
	}


	/**
	 * 구인 지역 목록 조회
	 * offer of a job loc list
	 * @param param
	 * @return List<VacancyLocBean>
	 */
	public List<VacancyLocBean> selectVacancyLocList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectVacancyLocList", param);
	}


	/**
	 * 구인 언어 목록 조회
	 * offer of a job lang list
	 * @param param
	 * @return List<VacancyLangBean>
	 */
	public List<VacancyLangBean> selectVacancyLangList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectVacancyLangList", param);
	}


	/**
	 * 구인 우대조건 목록 조회
	 * offer of a job Prefernt list
	 * @param param
	 * @return List<VacancyPreferntBean>
	 */
	public List<VacancyPreferntBean> selectVacancyPreferntList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectVacancyPreferntList", param);
	}


	/**
	 * 임시 구인 신규 등록
	 * temp offer of a job insert
	 * @param param
	 * @return int
	 */
	public int insertVacancyTemp(VacancyBean vacancyBean) {
		return  getSqlSession().insert("setCompnyVacancy.insertVacancyTemp", vacancyBean);
	}

	/**
	 * 임시 구인 언어 등록
	 * temp offer of a job insert
	 * @param param
	 * @return int
	 */
	public int insertVacancyLangTemp(VacancyLangBean vacancyLangBean) {
		return  getSqlSession().insert("setCompnyVacancy.insertVacancyLangTemp", vacancyLangBean);
	}


	/**
	 * 임시 구인 우대 등록
	 * temp offer of a job insert
	 * @param param
	 * @return int
	 */
	public int insertVacancyPreferntTemp(VacancyPreferntBean vacancyPreferntBean) {
		return  getSqlSession().insert("setCompnyVacancy.insertVacancyPreferntTemp", vacancyPreferntBean);
	}


	/**
	 * 임시 구인 신규 삭제
	 * temp offer of a job delete
	 * @param param
	 * @return int
	 */
	public int deleteVacancyTemp(VacancyBean vacancyBean) {
		return  getSqlSession().delete("setCompnyVacancy.deleteVacancyTemp", vacancyBean);
	}

	/**
	 * 임시 구인 언어 삭제
	 * temp offer of a job delete
	 * @param param
	 * @return int
	 */
	public int deleteVacancyLangTemp(VacancyBean param) {
		return  getSqlSession().delete("setCompnyVacancy.deleteVacancyLangTemp", param);
	}


	/**
	 * 임시 구인 우대 삭제
	 * temp offer of a job delete
	 * @param param
	 * @return int
	 */
	public int deleteVacancyPreferntTemp(VacancyBean param) {
		return  getSqlSession().delete("setCompnyVacancy.deleteVacancyPreferntTemp", param);
	}


	/**
	 * 임시 구인 우대 삭제
	 * temp offer of a job delete
	 * @param param
	 * @return int
	 */
	public int deleteVacancyLocTemp(VacancyBean param) {
		return  getSqlSession().delete("setCompnyVacancy.deleteVacancyLocTemp", param);
	}


	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancyList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectVacancyList", param);
	}


	/**
	 * 구인 temp 목록 조회
	 * temp offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancyTempList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectVacancyTempList", param);
	}



	/**
	 * 구인 목록 조회 count
	 * offer of a job list count
	 * @param param
	 * @return List<VacancyBean>
	 */
	public int selectVacancyListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("compnyVacancy.selectVacancyListCnt", param);
	}


	/**
	 * 구인 temp 목록 조회
	 * temp offer of a job list count
	 * @param param
	 * @return List<VacancyBean>
	 */
	public int selectVacancyTempListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("compnyVacancy.selectVacancyTempListCnt", param);
	}


	/**
	 * 구인 상세 조회
	 * offer of a job
	 * @param param
	 * @return VacancyBean
	 */
	public VacancyBean selectVacancyTemp(CondVacancyBean param) {
		return  getSqlSession().selectOne("compnyVacancy.selectVacancyTemp", param);
	}


	/**
	 * 구인 지역 목록 조회
	 * offer of a job loc list
	 * @param param
	 * @return List<VacancyLocBean>
	 */
	public List<VacancyLocBean> selectVacancyLocTempList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectVacancyLocTempList", param);
	}


	/**
	 * 구인 언어 목록 조회
	 * offer of a job lang list
	 * @param param
	 * @return List<VacancyLangBean>
	 */
	public List<VacancyLangBean> selectVacancyLangTempList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectVacancyLangTempList", param);
	}


	/**
	 * 구인 우대조건 목록 조회
	 * offer of a job Prefernt list
	 * @param param
	 * @return List<VacancyPreferntBean>
	 */
	public List<VacancyPreferntBean> selectVacancyPreferntTempList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectVacancyPreferntTempList", param);
	}


	/**
	 * 구인 수정
	 * offer of a job update
	 * @param param
	 * @return int
	 */
	public int updateVacancy(VacancyBean vacancyBean) {
		return  getSqlSession().update("setCompnyVacancy.updateVacancy", vacancyBean);
	}



	/**
	 * 구인 언어 삭제
	 * lanaguage delete
	 * @param param
	 * @return int
	 */
	public int deleteVacancyLang(VacancyBean param) {
		return  getSqlSession().delete("setCompnyVacancy.deleteVacancyLang", param);
	}

	/**
	 * 구인 지역 삭제
	 * area delete
	 * @param param
	 * @return int
	 */
	public int deleteVacancyLoc(VacancyBean param) {
		return  getSqlSession().delete("setCompnyVacancy.deleteVacancyLoc", param);
	}


	/**
	 * 구인 우대조건 삭제
	 * Prefernt delete
	 * @param param
	 * @return int
	 */
	public int deleteVacancyPrefernt(VacancyBean param) {
		return  getSqlSession().delete("setCompnyVacancy.deleteVacancyPrefernt", param);
	}


	/**
	 * 구인 수정
	 * offer of a job update
	 * @param param
	 * @return int
	 */
	public int updateVacancyTemp(VacancyBean vacancyBean) {
		return  getSqlSession().update("setCompnyVacancy.updateVacancyTemp", vacancyBean);
	}


	/**
	 * 구인 수정
	 * offer of a job update
	 * @param param
	 * @return int
	 */
	public int deleteVacancy(VacancyBean vacancyBean) {
		return  getSqlSession().delete("setCompnyVacancy.deleteVacancy", vacancyBean);
	}


	/**
	 * 기업별 채용공고 상태 count
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
	public VacancyBean selectVacancyCntInfo(CondVacancyBean param) {
    	return getSqlSession().selectOne("compnyVacancy.selectVacancyCntInfo", param);
    }

	/**
	 * 구인 지역 등록
	 * @param vacancyLocBean
	 * @return
	 */
	public int insertVacancyLoc(VacancyLocBean vacancyLocBean) {
		return getSqlSession().insert("setCompnyVacancy.insertVacancyLoc", vacancyLocBean);
	}

	/**
	 * 구인 지역 임시등록
	 * @param vacancyLocBean
	 * @return
	 */
	public int insertVacancyLocTemp(VacancyLocBean vacancyLocBean) {
		return getSqlSession().insert("setCompnyVacancy.insertVacancyLocTemp", vacancyLocBean);
	}


	/**
	 * 채용마감
	 * vacancy close process
	 * @param param
	 * @return int
	 */
	public int closeVacancy(CondVacancyBean param) {
    	return getSqlSession().update("setCompnyVacancy.closeVacancy", param);
    }

	/**
	 * 채용마감
	 * selectVacancyNum
	 * @param param
	 * @return int
	 */
	public String selectVacancyNum(CondVacancyBean param) {
    	return getSqlSession().selectOne("compnyVacancy.selectVacancyNum", param);
    }


	/**
	 * 면접제의 목록 조회 count
	 * interview  list count
	 * @param param
	 * @return List<IntvwBean>
	 */
	public int selectIntvwListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("compnyVacancy.selectIntvwListCnt", param);
	}


	/**
	 * 면접제의 목록 조회
	 * interview  list
	 * @param param
	 * @return List<IntvwBean>
	 */
	public List<IntvwBean> selectIntvwList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyVacancy.selectIntvwList", param);
	}

}
