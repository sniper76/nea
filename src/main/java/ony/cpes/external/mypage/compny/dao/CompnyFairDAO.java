package ony.cpes.external.mypage.compny.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.cpes.external.mypage.privt.bean.FairBean;





@Repository("CompnyFairDAO")
public class CompnyFairDAO  extends EgovAbstractMapper {



	/**
	 * 초청받은 채용행사 목록 count
	 * invite fair list count
	 * @param param
	 * @return int
	 */
	public int selectInviteListCnt(CondFairBean param) {
		return getSqlSession().selectOne("compnyFair.selectInviteListCnt", param);
	}

	/**
	 * 초청받은 채용행사 목록
	 * invite fair list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<FairBean> selectInviteList(CondFairBean param) {
		return getSqlSession().selectList("compnyFair.selectInviteList", param);
	}

	/**
	 * 초청받은 채용행사 신청
	 * invite fair request
	 * @param param
	 * @return int
	 */
	public int updateInviteOk(CondFairBean param) {
		return getSqlSession().update("setCompnyFair.updateInviteOk", param);
	}

	/**
	 * 초청받은 채용행사 삭제
	 * invite fair delete
	 * @param param
	 * @return int
	 */
	public int deleteInvite(CondFairBean param) {
		return getSqlSession().update("setCompnyFair.deleteInvite", param);
	}


	/**
	 * 채용행사 상세
	 * fair detail
	 * @param param
	 * @return FairBean
	 */
	public FairBean selectFair(CondFairBean param) {
		return getSqlSession().selectOne("compnyFair.selectFair", param);
	}


	/**
	 * 채용행사별 채용공고 목록
	 * fair from vacancy list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancyList(CondFairBean param) {
		return getSqlSession().selectList("compnyFair.selectVacancyList", param);
	}

	/**
	 * 채용행사 참가취소
	 * invite fair cancel
	 * @param param
	 * @return int
	 */
	public int updateInviteCancel(CondFairBean param) {
		return getSqlSession().update("setCompnyFair.updateInviteCancel", param);
	}

	/**
	 * 채용행사 채용공고 삭제
	 * invite fair cancel
	 * @param param
	 * @return int
	 */
	public int deleteFairVacancy(CondFairBean param) {
		return getSqlSession().delete("setCompnyFair.deleteFairVacancy", param);
	}


	/**
	 * 부스신청 목록 count
	 * fair booth list count
	 * @param param
	 * @return int
	 */
	public int selectBoothListCnt(CondFairBean param) {
		return getSqlSession().selectOne("compnyFair.selectBoothListCnt", param);
	}

	/**
	 * 부스신청 목록 count
	 * fair booth list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<FairBean> selectBoothList(CondFairBean param) {
		return getSqlSession().selectList("compnyFair.selectBoothList", param);
	}


	/**
	 * 채용행사 부스 취소
	 * fair booth cancel
	 * @param param
	 * @return int
	 */
	public int updateBoothCancel(CondFairBean param) {
		return getSqlSession().update("setCompnyFair.updateBoothCancel", param);
	}
}