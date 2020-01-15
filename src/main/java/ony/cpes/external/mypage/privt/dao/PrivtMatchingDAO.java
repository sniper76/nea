package ony.cpes.external.mypage.privt.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.MatchingBean;
import ony.cpes.external.mypage.privt.bean.MatchingEduDegreeBean;
import ony.cpes.external.mypage.privt.bean.MatchingIscoBean;
import ony.cpes.external.mypage.privt.bean.MatchingLangBean;
import ony.cpes.external.mypage.privt.bean.MatchingLocBean;
import ony.cpes.external.mypage.privt.bean.MatchingPrivilegeBean;
import ony.cpes.external.mypage.privt.bean.MatchingSrchBean;
import ony.cpes.external.vacancy.bean.VacancyBean;

@Repository("PrivtMatchingDAO")
public class PrivtMatchingDAO extends EgovAbstractMapper{

	public int selectMatchingCnt(MatchingBean param) {
		return getSqlSession().selectOne("matching.selectMatchingCnt", param);
	}

	public MatchingBean selectMatchingResumeByUser(MatchingBean param) {
		return getSqlSession().selectOne("matching.selectMatchingResumeByUser", param);
	}

	public int insertMatchingMst(MatchingBean param) {
		return getSqlSession().insert("setMatching.insertMatchingMst", param);
	}

	public int insertMatchingIsco(MatchingIscoBean param) {
		return getSqlSession().insert("setMatching.insertMatchingIsco", param);
	}

	public int insertMatchingLang(MatchingLangBean param) {
		return getSqlSession().insert("setMatching.insertMatchingLang", param);
	}

	public int insertMatchingLoc(MatchingLocBean param) {
		return getSqlSession().insert("setMatching.insertMatchingLoc", param);
	}

	public int insertMatchingEduDegree(MatchingEduDegreeBean param) {
		return getSqlSession().insert("setMatching.insertMatchingEduDegree", param);
	}

	public int insertMatchingPreferntCond(MatchingPrivilegeBean param) {
		return getSqlSession().insert("setMatching.insertMatchingPreferntCond", param);
	}

	public int updateMatchingMst(MatchingBean param) {
		return getSqlSession().insert("setMatching.updateMatchingMst", param);
	}

	public int deleteMatchingIsco(MatchingBean param) {
		return getSqlSession().delete("setMatching.deleteMatchingIsco", param);
	}

	public int deleteMatchingLang(MatchingBean param) {
		return getSqlSession().delete("setMatching.deleteMatchingLang", param);
	}

	public int deleteMatchingLoc(MatchingBean param) {
		return getSqlSession().delete("setMatching.deleteMatchingLoc", param);
	}

	public int deleteMatchingEduDegree(MatchingBean param) {
		return getSqlSession().delete("setMatching.deleteMatchingEduDegree", param);
	}

	public int deleteMatchingPreferntCond(MatchingBean param) {
		return getSqlSession().delete("setMatching.deleteMatchingPreferntCond", param);
	}

	public MatchingBean selectMatchingMst(MatchingBean param) {
		return getSqlSession().selectOne("matching.selectMatchingMst", param);
	}

	public List<MatchingIscoBean> selectMatchingIscoList(MatchingBean param) {
		return getSqlSession().selectList("matching.selectMatchingIscoList", param);
	}

	public List<MatchingLocBean> selectMatchingLocList(MatchingBean param) {
		return getSqlSession().selectList("matching.selectMatchingLocList", param);
	}

	public List<MatchingLangBean> selectMatchingLangList(MatchingBean param) {
		return getSqlSession().selectList("matching.selectMatchingLangList", param);
	}

	public List<MatchingEduDegreeBean> selectMatchingEduDegreeList(MatchingBean param) {
		return getSqlSession().selectList("matching.selectMatchingEduDegreeList", param);
	}

	public int selectMatchingByVacancysCnt(MatchingSrchBean param) {
		return getSqlSession().selectOne("matching.selectMatchingByVacancysCnt", param);
	}

	public List<VacancyBean> selectMatchingByVacancys(MatchingSrchBean param) {
		return getSqlSession().selectList("matching.selectMatchingByVacancys", param);
	}

	/**
	 * select resume information by prior resume
	 * @param param
	 * @return
	 */
	public MatchingBean selectMatchingResume(MatchingBean param) {
		return getSqlSession().selectOne("matching.selectMatchingResume", param);
	}

	/**
	 * select vacancy count of auto matching
	 * @param param
	 * @return
	 */
	public int selectMatchingAutoCnt(MatchingBean param) {
		return getSqlSession().selectOne("matching.selectMatchingAutoCnt", param);
	}

	/**
	 * select vacancy list of auto matching
	 * @param param
	 * @return
	 */
	public List<VacancyBean> selectMatchingAutoList(MatchingBean param) {
		return getSqlSession().selectList("matching.selectMatchingAutoList", param);
	}

}
