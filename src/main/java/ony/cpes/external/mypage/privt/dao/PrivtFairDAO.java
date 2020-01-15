package ony.cpes.external.mypage.privt.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.cpes.external.mypage.privt.bean.FairBean;

@Repository("PrivtFairDAO")
public class PrivtFairDAO  extends EgovAbstractMapper {

	/**
	 * 채용행사 목록 count
	 * fair list count
	 * @param param
	 * @return int
	 */
	public int selectFairListCnt(CondFairBean param) {
		return getSqlSession().selectOne("privtFair.selectFairListCnt", param);
	}

	/**
	 * 채용행사 목록
	 * fair list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<FairBean> selectFairList(CondFairBean param) {
		return getSqlSession().selectList("privtFair.selectFairList", param);
	}

	/**
	 * 채용행사 신청 취소
	 * fair cancel
	 * @param param
	 * @return int
	 */
	public int updateCancelFair(CondFairBean param) {
		return getSqlSession().update("setPrivtFair.updateCancelFair", param);
	}

	/**
	 * 채용행사 삭제
	 * fair delete
	 * @param param
	 * @return int
	 */
	public int deleteFair(CondFairBean param) {
		return getSqlSession().update("setPrivtFair.deleteFair", param);
	}

}