package ony.cpes.external.mypage.compny.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ReferralBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;


@Repository("CompnyApplicDAO")
public class CompnyApplicDAO  extends EgovAbstractMapper {
	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancySimpleList(CondApplicBean param) {
		return getSqlSession().selectList("compnyApplic.selectVacancySimpleList", param);
	}

	/**
	 * 입사지원 count정보
	 * applic list
	 * @param param
	 * @return ApplicBean
	 */
	public ApplicBean selectApplicStatCnt(CondApplicBean param) {
		return getSqlSession().selectOne("compnyApplic.selectApplicStatCnt", param);
	}

	/**
	 * 입사지원 목록 count
	 * applic list count
	 * @param param
	 * @return int
	 */
	public int selectApplicListCnt(CondApplicBean param) {
		return getSqlSession().selectOne("compnyApplic.selectApplicListCnt", param);
	}

	/**
	 * 입사지원 엑셀 다운로드 목록
	 * applic list
	 * @param param
	 * @return List<ApplicBean>
	 */
	public List<Map<String, Object>> selectApplicExcelList(CondApplicBean param) {
		return getSqlSession().selectList("compnyApplic.selectApplicExcelList", param);
	}

	/**
	 * 입사지원 목록
	 * applic list
	 * @param param
	 * @return List<ApplicBean>
	 */
	public List<ApplicBean> selectApplicList(CondApplicBean param) {
		return getSqlSession().selectList("compnyApplic.selectApplicList", param);
	}


	/**
	 * 입사지원 상태변경
	 * applic proc stat change
	 * @param param
	 * @return int
	 */
	public int updateProcStat(CondApplicBean param) {
		return getSqlSession().update("setCompnyApplic.updateProcStat", param);
	}

	/**
	 * 입사지원 이력서 열람 처리
	 * appli cx read
	 * @param param
	 * @return int
	 */
	public int updateResumeOpen(CondApplicBean param) {
		return getSqlSession().update("setCompnyApplic.updateResumeOpen", param);
	}


	/**
	 * 입사제의 목록 count
	 * offer list count
	 * @param param
	 * @return int
	 */
	public int selectOfferListCnt(CondApplicBean param) {
		return getSqlSession().selectOne("compnyApplic.selectOfferListCnt", param);
	}

	/**
	 * 입사제의 목록
	 * offer list
	 * @param param
	 * @return List<OfferBean>
	 */
	public List<OfferBean> selectOfferList(CondApplicBean param) {
		return getSqlSession().selectList("compnyApplic.selectOfferList", param);
	}

	/**
	 * 알선 목록  count
	 * referral list count
	 * @param param
	 * @return int
	 */
	public int selectReferralListCnt(CondApplicBean param) {
		return getSqlSession().selectOne("compnyApplic.selectReferralListCnt", param);
	}


	/**
	 * 알선 목록
	 * referral list
	 * @param param
	 * @return List<ReferralBean>
	 */
	public List<ReferralBean> selectReferralList(CondApplicBean param) {
		return getSqlSession().selectList("compnyApplic.selectReferralList", param);
	}

	/**
	 * 알선 삭제
	 * reffer ok delete
	 * @param param
	 * @return int
	 */
	public int deleteReferral(CondApplicBean param) {
		return getSqlSession().update("setCompnyApplic.deleteReferral", param);
	}



	/**
	 * 알선 수락
	 * reffer ok
	 * @param param
	 * @return int
	 */
	public int updateReferralOk(ReferralBean param) {
		return getSqlSession().update("setCompnyApplic.updateReferralOk", param);
	}


	/**
	 * 알선 거절
	 * reffer no
	 * @param param
	 * @return int
	 */
	public int updateReferralNo(ReferralBean param) {
		return getSqlSession().update("setCompnyApplic.updateReferralNo", param);
	}

	/**
	 * 입사제의 삭제
	 * offer delete
	 * @param param
	 * @return int
	 */
	public int deleteOffer(CondApplicBean param) {
		return getSqlSession().delete("setCompnyApplic.deleteOffer", param);
	}


	/**
	 * 구인 목록 조회 count
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
	public int selectVacancyListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("compnyApplic.selectVacancyListCnt", param);
	}


	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancyList(CondVacancyBean param) {
		return  getSqlSession().selectList("compnyApplic.selectVacancyList", param);
	}

	/**
	 * 알선 요청
	 * referral rquest
	 * @param param
	 * @return int
	 */
	public int updateReferralReq(CondApplicBean param) {
		return getSqlSession().update("setCompnyApplic.updateReferralReq", param);
	}


	/**
	 * 입사지원 불합격 처리
	 * applic fail process
	 * @param param
	 * @return int
	 */
	public int updateFailReason(CondApplicBean param) {
		return getSqlSession().update("setCompnyApplic.updateFailReason", param);
	}

	/**
	 * 인터뷰 제안
	 * applic interview
	 * @param param
	 * @return int
	 */
	public int insertIntvw(IntvwBean param) {
		return getSqlSession().insert("setCompnyApplic.insertIntvw", param);
	}


	/**
	 * 입사지원
	 * applic list count
	 * @param param
	 * @return int
	 */
	public int selectApplicIntvwDupCnt(CondApplicBean param) {
		return getSqlSession().selectOne("compnyApplic.selectApplicIntvwDupCnt", param);
	}

}
