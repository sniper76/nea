package ony.cpes.external.instt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngFreeBean;
import ony.cpes.external.mypage.instt.bean.CondInsttMemBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngHistBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;

@Repository("InsttDAO")
public class InsttDAO  extends EgovAbstractMapper {
	/**
	 * 교육기관정보 조회
	 * education member info
	 * @param param
	 * @return PrivtMemBean
	 */
	public InsttMemBean selectInstt(CondInsttMemBean param) {
		return getSqlSession().selectOne("instt.selectInstt", param);
	}


	/**
	 * 교육훈련 목록 조회 count
	 * education tranning list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngContinueListCnt(CondEduTrnngBean param) {
		return  getSqlSession().selectOne("instt.selectEduTrnngContinueListCnt", param);
	}

	/**
	 * 교육훈련 목록  조회
	 * education tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngContinueList(CondEduTrnngBean param) {
		return getSqlSession().selectList("instt.selectEduTrnngContinueList", param);
	}

	/**
	 * institute list count
	 * @param param
	 * @return int
	 */
	public int selectInsttListCnt(CondEduTrnngFreeBean param) {
		return  getSqlSession().selectOne("instt.selectInsttListCnt", param);
	}

	/**
	 * institute list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<InsttMemBean> selectInsttList(CondEduTrnngFreeBean param) {
		return getSqlSession().selectList("instt.selectInsttList", param);
	}

	/**
	 * 교육훈련 이력 목록 조회
	 * education history list
	 * @param param
	 * @return List<EduTrnngHistBean>
	 */
	public List<EduTrnngHistBean> selectEduTrnngHistList(CondInsttMemBean param) {
		return getSqlSession().selectList("instt.selectEduTrnngHistList", param);
	}

	/**
	 * Institute information by user
	 * @param userSeq
	 * @return
	 */
	public InsttMemBean selectInsttByUser(String userSeq, String langCd) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userSeq", userSeq);
		param.put("langCd", langCd);
		return getSqlSession().selectOne("instt.selectInsttByUser", param);
	}

}
