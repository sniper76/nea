package ony.cpes.external.mypage.compny.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.compny.bean.CondInterestBean;
import ony.cpes.external.mypage.compny.bean.InterestBean;





@Repository("CompnyInterestDAO")
public class CompnyInterestDAO  extends EgovAbstractMapper {



	/**
	 * 채용공고를 관심등록한 인재 count
	 * Interest vacancy from private member count
	 * @param param
	 * @return int
	 */
	public int selectVacancyListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("compnyInterest.selectVacancyListCnt", param);
	}

	/**
	 * 채용공고를 관심등록한 인재 인재
	 * Interest vacancy from private member
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectVacancyList(CondInterestBean param) {
		return getSqlSession().selectList("compnyInterest.selectVacancyList", param);
	}


	/**
	 * 관심 회사로 등록한 인재 count
	 * Interest compnay from private member count
	 * @param param
	 * @return int
	 */
	public int selectCompnyListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("compnyInterest.selectCompnyListCnt", param);
	}

	/**
	 * 관심 회사로 등록한 인재
	 * Interest compnay from private member
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectCompnyList(CondInterestBean param) {
		return getSqlSession().selectList("compnyInterest.selectCompnyList", param);
	}

	/**
	 * 관심인재 목록 count
	 * Interest resume count
	 * @param param
	 * @return int
	 */
	public int selectResumeListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("compnyInterest.selectResumeListCnt", param);
	}

	/**
	 * 관심인재 목록
	 * Interest resume list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectResumeList(CondInterestBean param) {
		return getSqlSession().selectList("compnyInterest.selectResumeList", param);
	}

	/**
	 * 관심채용행사 목록 count
	 * Interest fair count
	 * @param param
	 * @return int
	 */
	public int selectFairListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("compnyInterest.selectFairListCnt", param);
	}

	/**
	 * 관심채용행사 목록
	 * interest fair list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectFairList(CondInterestBean param) {
		return getSqlSession().selectList("compnyInterest.selectFairList", param);
	}
}