package ony.cpes.external.mypage.privt.service;

import java.util.List;

import ony.cpes.external.mypage.privt.bean.MatchingBean;
import ony.cpes.external.mypage.privt.bean.MatchingEduDegreeBean;
import ony.cpes.external.mypage.privt.bean.MatchingIscoBean;
import ony.cpes.external.mypage.privt.bean.MatchingLangBean;
import ony.cpes.external.mypage.privt.bean.MatchingLocBean;
import ony.cpes.external.mypage.privt.bean.MatchingSrchBean;
import ony.cpes.external.vacancy.bean.VacancyBean;

public interface PrivtMatchingService {
	public int updateMatching(MatchingBean param) throws Exception;

	public int selectMatchingCnt(MatchingBean param) throws Exception;

	public MatchingBean selectMatchingResumeByUser(MatchingBean param) throws Exception;

	public MatchingBean selectMatchingMst(MatchingBean param) throws Exception;

	public List<MatchingIscoBean> selectMatchingIscoList(MatchingBean param) throws Exception;

	public List<MatchingLocBean> selectMatchingLocList(MatchingBean param) throws Exception;

	public List<MatchingLangBean> selectMatchingLangList(MatchingBean param) throws Exception;

	public List<MatchingEduDegreeBean> selectMatchingEduDegreeList(MatchingBean param) throws Exception;

	public int selectMatchingByVacancysCnt(MatchingSrchBean param) throws Exception;

	public List<VacancyBean> selectMatchingByVacancys(MatchingSrchBean param) throws Exception;

	/**
	 * select resume information by prior resume
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public MatchingBean selectMatchingResume(String userSeq, String langCd) throws Exception;

	/**
	 * select vacancy count of auto matching
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectMatchingAutoCnt(MatchingBean param) throws Exception;

	/**
	 * select vacancy list of auto matching
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<VacancyBean> selectMatchingAutoList(MatchingBean param) throws Exception;

}
