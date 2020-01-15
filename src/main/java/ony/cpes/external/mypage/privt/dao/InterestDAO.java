package ony.cpes.external.mypage.privt.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.CondInterestBean;
import ony.cpes.external.mypage.privt.bean.InterestBean;





@Repository("InterestDAO")
public class InterestDAO  extends EgovAbstractMapper {



	/**
	 * 관심 채용공고 목록 count
	 * Interest vacancy list count
	 * @param param
	 * @return int
	 */
	public int selectVacancyListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("interest.selectVacancyListCnt", param);
	}

	/**
	 * 관심 채용공고 목록
	 * Interest vacancy list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectVacancyList(CondInterestBean param) {
		return getSqlSession().selectList("interest.selectVacancyList", param);
	}

	/**
	 * 관심기업 목록 count
	 * Interest company list count
	 * @param param
	 * @return int
	 */
	public int selectCompnyListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("interest.selectCompnyListCnt", param);
	}

	/**
	 * 관심기업 목록
	 * Interest company list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectCompnyList(CondInterestBean param) {
		return getSqlSession().selectList("interest.selectCompnyList", param);
	}

	/**
	 * 관심채용행사 목록 count
	 * Interest fair list count
	 * @param param
	 * @return int
	 */
	public int selectFairListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("interest.selectFairListCnt", param);
	}

	/**
	 * 관심채용행사 목록
	 * Interest fair list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectFairList(CondInterestBean param) {
		return getSqlSession().selectList("interest.selectFairList", param);
	}


	/**
	 * 관심교육기관 목록 count
	 * Interest education instt list count
	 * @param param
	 * @return int
	 */
	public int selectEduInsttListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("interest.selectEduInsttListCnt", param);
	}

	/**
	 * 관심교육기관 목록
	 * Interest education instt list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectEduInsttList(CondInterestBean param) {
		return getSqlSession().selectList("interest.selectEduInsttList", param);
	}

	/**
	 * 관심교육프로그램 목록 count
	 * Interest education program list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("interest.selectEduTrnngListCnt", param);
	}

	/**
	 * 관심교육프로그램 목록
	 * Interest education program list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectEduTrnngList(CondInterestBean param) {
		return getSqlSession().selectList("interest.selectEduTrnngList", param);
	}

	/**
	 * 관심직업훈련 목록 count
	 * Interest education program nea list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngNeaListCnt(CondInterestBean param) {
		return getSqlSession().selectOne("interest.selectEduTrnngNeaListCnt", param);
	}

	/**
	 * 관심직업훈련 목록
	 * Interest education program nea list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectEduTrnngNeaList(CondInterestBean param) {
		return getSqlSession().selectList("interest.selectEduTrnngNeaList", param);
	}
}