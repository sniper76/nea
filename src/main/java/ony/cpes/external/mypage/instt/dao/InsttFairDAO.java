package ony.cpes.external.mypage.instt.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.cpes.external.mypage.privt.bean.FairBean;

@Repository("InsttFairDAO")
public class InsttFairDAO  extends EgovAbstractMapper {

	/**
	 * 초청받은 채용행사 목록 count
	 * invite fair list count
	 * @param param
	 * @return int
	 */
	public int selectInviteListCnt(CondFairBean param) {
		return getSqlSession().selectOne("insttFair.selectInviteListCnt", param);
	}

	/**
	 * 초청받은 채용행사 목록
	 * invite fair list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<FairBean> selectInviteList(CondFairBean param) {
		return getSqlSession().selectList("insttFair.selectInviteList", param);
	}

	/**
	 * 초청받은 채용행사 신청
	 * invite fair request
	 * @param param
	 * @return int
	 */
	public int updateInviteOk(CondFairBean param) {
		return getSqlSession().update("setInsttFair.updateInviteOk", param);
	}

	/**
	 * 초청받은 채용행사 삭제
	 * invite fair delete
	 * @param param
	 * @return int
	 */
	public int deleteInvite(CondFairBean param) {
		return getSqlSession().update("setInsttFair.deleteInvite", param);
	}


	/**
	 * 부스신청 목록 count
	 * fair booth list count
	 * @param param
	 * @return int
	 */
	public int selectBoothListCnt(CondFairBean param) {
		return getSqlSession().selectOne("insttFair.selectBoothListCnt", param);
	}

	/**
	 * 부스신청 목록 count
	 * fair booth list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<FairBean> selectBoothList(CondFairBean param) {
		return getSqlSession().selectList("insttFair.selectBoothList", param);
	}


	/**
	 * 채용행사 부스 취소
	 * fair booth cancel
	 * @param param
	 * @return int
	 */
	public int updateBoothCancel(CondFairBean param) {
		return getSqlSession().update("setInsttFair.updateBoothCancel", param);
	}


	/**
	 * 채용행사 취소
	 * cancel fair request
	 * @param param
	 * @return int
	 */
	public int updateFairCancel(CondFairBean param) {
		return getSqlSession().update("setInsttFair.updateFairCancel", param);
	}



}