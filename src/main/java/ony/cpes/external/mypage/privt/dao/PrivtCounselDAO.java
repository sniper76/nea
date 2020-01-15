package ony.cpes.external.mypage.privt.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.CondCounselBean;
import ony.cpes.external.mypage.privt.bean.EduTrnngBean;

@Repository("PrivtCounselDAO")
public class PrivtCounselDAO  extends EgovAbstractMapper {

	/**
	 * 직업훈련 신청 목록 count
	 * education trnning nea list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngNeaListCnt(CondCounselBean param) {
		return getSqlSession().selectOne("privtCounsel.selectEduTrnngNeaListCnt", param);
	}

	/**
	 * 직업훈련 신청 목록
	 * education trnning nea list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<EduTrnngBean> selectEduTrnngNeaList(CondCounselBean param) {
		return getSqlSession().selectList("privtCounsel.selectEduTrnngNeaList", param);
	}

	/**
	 * 직업훈련 신청 신청 취소
	 * education trnning nea cancel
	 * @param param
	 * @return int
	 */
	public int updateCancelEduTrnngNea(CondCounselBean param) {
		return getSqlSession().update("setPrivtCounsel.updateCancelEduTrnngNea", param);
	}

	/**
	 * 직업훈련 신청 삭제
	 * education trnning nea delete
	 * @param param
	 * @return int
	 */
	public int deleteEduTrnngNea(CondCounselBean param) {
		return getSqlSession().update("setPrivtCounsel.deleteEduTrnngNea", param);
	}

}