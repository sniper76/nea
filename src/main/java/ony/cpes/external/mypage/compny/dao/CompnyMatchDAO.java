package ony.cpes.external.mypage.compny.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetEduDegreeBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetIscoBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetLangBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetLocBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetPreferntCondBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;

@Repository("CompnyMatchDAO")
public class CompnyMatchDAO extends EgovAbstractMapper {

	/**
	 * 해당 기업의 채용공고 목록
	 * @param param
	 * @return
	 */
	public List<VacancyBean> selectCompnyVacancyList(Map<String, Object> param) {
		return getSqlSession().selectList("compnyMatch.selectCompnyVacancyList", param);
	}

	/**
	 * 해당 기업의 채용공고 정보 조회
	 * @param param
	 * @return
	 */
	public VacancyBean selectCompnyVacancy(Map<String, Object> param) {
		return getSqlSession().selectOne("compnyMatch.selectCompnyVacancy", param);
	}

	/**
	 * 기업의 오토매칭 총건수
	 * @param param
	 * @return
	 */
	public Integer selectAutoMatchingResumeListCnt(CondVacancyBean param) {
		return getSqlSession().selectOne("compnyMatch.selectAutoMatchingResumeListCnt", param);
	}

	/**
	 * 기업의 오토매칭 목록
	 * @param param
	 * @return
	 */
	public List<ResumeBean> selectAutoMatchingResumeList(CondVacancyBean param) {
		return getSqlSession().selectList("compnyMatch.selectAutoMatchingResumeList", param);
	}

	/**
	 * 맞춤 인재정보 설정::조회
	 * @param param
	 * @return
	 */
	public VacancyMatchSetBean selectVacancyMatchSet(Map<String, Object> param) {
		return getSqlSession().selectOne("compnyMatch.selectVacancyMatchSet", param);
	}

	/**
	 * 맞춤 인재정보 설정::입력
	 * @param param
	 * @return
	 */
	public int insertVacancyMatchSet(VacancyMatchSetBean param) {
		return getSqlSession().insert("setCompnyMatch.insertVacancyMatchSet", param);
	}

	/**
	 * 맞춤 인재정보 설정::수정
	 * @param param
	 * @return
	 */
	public int updateVacancyMatchSet(VacancyMatchSetBean param) {
		return getSqlSession().update("setCompnyMatch.updateVacancyMatchSet", param);
	}

	/**
	 * 맞춤 인재정보 설정::학력
	 * @param param
	 * @return
	 */
	public List<VacancyMatchSetEduDegreeBean> selectVacancyMatchSetEduDegreeList(Map<String, Object> param) {
		return getSqlSession().selectList("compnyMatch.selectVacancyMatchSetEduDegreeList", param);
	}

	/**
	 * 맞춤 인재정보 설정::학력::입력
	 * @param param
	 * @return
	 */
	public int insertVacancyMatchSetEduDegree(VacancyMatchSetEduDegreeBean param) {
		return getSqlSession().insert("setCompnyMatch.insertVacancyMatchSetEduDegree", param);
	}

	/**
	 * 맞춤 인재정보 설정::학력::삭제
	 * @param param
	 * @return
	 */
	public int deleteVacancyMatchSetEduDegree(VacancyMatchSetEduDegreeBean param) {
		return getSqlSession().delete("setCompnyMatch.deleteVacancyMatchSetEduDegree", param);
	}

	/**
	 * 맞춤 인재정보 설정::직종::조회
	 * @param param
	 * @return
	 */
	public List<VacancyMatchSetIscoBean> selectVacancyMatchSetIscoList(Map<String, Object> param) {
		return getSqlSession().selectList("compnyMatch.selectVacancyMatchSetIscoList", param);
	}

	/**
	 * 맞춤 인재정보 설정::직종::입력
	 * @param param
	 * @return
	 */
	public int insertVacancyMatchSetIsco(VacancyMatchSetIscoBean param) {
		return getSqlSession().insert("setCompnyMatch.insertVacancyMatchSetIsco", param);
	}

	/**
	 * 맞춤 인재정보 설정::직종::삭제
	 * @param param
	 * @return
	 */
	public int deleteVacancyMatchSetIsco(VacancyMatchSetIscoBean param) {
		return getSqlSession().delete("setCompnyMatch.deleteVacancyMatchSetIsco", param);
	}

	/**
	 * 맞춤 인재정보 설정::외국어::조회
	 * @param param
	 * @return
	 */
	public List<VacancyMatchSetLangBean> selectVacancyMatchSetLangList(Map<String, Object> param) {
		return getSqlSession().selectList("compnyMatch.selectVacancyMatchSetLangList", param);
	}

	/**
	 * 맞춤 인재정보 설정::외국어::입력
	 * @param param
	 * @return
	 */
	public int insertVacancyMatchSetLang(VacancyMatchSetLangBean param) {
		return getSqlSession().insert("setCompnyMatch.insertVacancyMatchSetLang", param);
	}

	/**
	 * 맞춤 인재정보 설정::외국어::삭제
	 * @param param
	 * @return
	 */
	public int deleteVacancyMatchSetLang(VacancyMatchSetLangBean param) {
		return getSqlSession().delete("setCompnyMatch.deleteVacancyMatchSetLang", param);
	}

	/**
	 * 맞춤 인재정보 설정::지역::조회
	 * @param param
	 * @return
	 */
	public List<VacancyMatchSetLocBean> selectVacancyMatchSetLocList(Map<String, Object> param) {
		return getSqlSession().selectList("compnyMatch.selectVacancyMatchSetLocList", param);
	}

	/**
	 * 맞춤 인재정보 설정::지역::입력
	 * @param param
	 * @return
	 */
	public int insertVacancyMatchSetLoc(VacancyMatchSetLocBean param) {
		return getSqlSession().insert("setCompnyMatch.insertVacancyMatchSetLoc", param);
	}

	/**
	 * 맞춤 인재정보 설정::지역::삭제
	 * @param param
	 * @return
	 */
	public int deleteVacancyMatchSetLoc(VacancyMatchSetLocBean param) {
		return getSqlSession().delete("setCompnyMatch.deleteVacancyMatchSetLoc", param);
	}

	/**
	 * 맞춤 인재정보 설정::우대조건::조회
	 * @param param
	 * @return
	 */
	public List<VacancyMatchSetPreferntCondBean> selectVacancyMatchSetPreferntCondList(Map<String, Object> param) {
		return getSqlSession().selectList("compnyMatch.selectVacancyMatchSetPreferntCondList", param);
	}

	/**
	 * 맞춤 인재정보 설정::우대조건::입력
	 * @param param
	 * @return
	 */
	public int insertVacancyMatchSetPreferntCond(VacancyMatchSetPreferntCondBean param) {
		return getSqlSession().insert("setCompnyMatch.insertVacancyMatchSetPreferntCond", param);
	}

	/**
	 * 맞춤 인재정보 설정::우대조건::삭제
	 * @param param
	 * @return
	 */
	public int deleteVacancyMatchSetPreferntCond(VacancyMatchSetPreferntCondBean param) {
		return getSqlSession().delete("setCompnyMatch.deleteVacancyMatchSetPreferntCond", param);
	}

	/**
	 * 맞춤 인재정보::총건수
	 * @param param
	 * @return
	 */
	public Integer selectVacancyMatchListCnt(VacancyMatchSetBean param) {
		return getSqlSession().selectOne("compnyMatch.selectVacancyMatchListCnt", param);
	}

	/**
	 * 맞춤 인재정보 목록
	 * @param param
	 * @return
	 */
	public List<ResumeBean> selectVacancyMatchList(VacancyMatchSetBean param) {
		return getSqlSession().selectList("compnyMatch.selectVacancyMatchList", param);
	}

}
