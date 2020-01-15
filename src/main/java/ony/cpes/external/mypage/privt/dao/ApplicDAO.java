package ony.cpes.external.mypage.privt.dao;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ReferralBean;
import ony.cpes.external.mypage.privt.bean.ResumeOpenCompnyBean;




@Repository("ApplicDAO")
public class ApplicDAO  extends EgovAbstractMapper {

	/**
	 * 입사지원 count정보
	 * applic list
	 * @param param
	 * @return ApplicBean
	 */
	public ApplicBean selectApplicStatCnt(CondApplicBean param) {
		return getSqlSession().selectOne("applic.selectApplicStatCnt", param);
	}

	/**
	 * 입사지원 목록 count
	 * applic list count
	 * @param param
	 * @return int
	 */
	public int selectApplicListCnt(CondApplicBean param) {
		return getSqlSession().selectOne("applic.selectApplicListCnt", param);
	}

	/**
	 * 입사지원 목록
	 * applic list
	 * @param param
	 * @return List<ApplicBean>
	 */
	public List<ApplicBean> selectApplicList(CondApplicBean param) {
		return getSqlSession().selectList("applic.selectApplicList", param);
	}


	/**
	 * 입사지원 취소
	 * applic cancel
	 * @param param
	 * @return int
	 */
	public int updateCancelApplic(CondApplicBean param) {
		return getSqlSession().update("setApplic.updateCancelApplic", param);
	}

	/**
	 * Delete Application
	 * @param param
	 * @return
	 */
	public int deleteApplic(ApplicBean param) {
		return getSqlSession().update("setApplic.deleteApplic", param);
	}

	/**
	 * 입사제의 목록 count
	 * offer list count
	 * @param param
	 * @return int
	 */
	public int selectOfferListCnt(CondApplicBean param) {
		return getSqlSession().selectOne("applic.selectOfferListCnt", param);
	}

	/**
	 * 입사제의 목록
	 * offer list
	 * @param param
	 * @return List<OfferBean>
	 */
	public List<OfferBean> selectOfferList(CondApplicBean param) {
		return getSqlSession().selectList("applic.selectOfferList", param);
	}


	/**
	 * 면접제의 목록 count
	 * interview list count
	 * @param param
	 * @return int
	 */
	public int selectIntvwListCnt(CondApplicBean param) {
		return getSqlSession().selectOne("applic.selectIntvwListCnt", param);
	}

	/**
	 * 면접제의 목록
	 * interview list
	 * @param param
	 * @return List<IntvwBean>
	 */
	public List<IntvwBean> selectIntvwList(CondApplicBean param) {
		return getSqlSession().selectList("applic.selectIntvwList", param);
	}


	/**
	 * 면접제의 상세
	 * interview detail
	 * @param param
	 * @return IntvwBean
	 */
	public IntvwBean selectIntvw(CondApplicBean param) {
		return getSqlSession().selectOne("applic.selectIntvw", param);
	}


	/**
	 * 입사제의 삭제
	 * offer delete
	 * @param param
	 * @return int
	 */
	public int deleteOffer(CondApplicBean param) {
		return getSqlSession().delete("setApplic.deleteOffer", param);
	}



	/**
	 * 이력서 열람 기업 목록  count
	 * cv open compny list count
	 * @param param
	 * @return int
	 */
	public int selectOpenResumeCompnyListCnt(CondApplicBean param) {
		return getSqlSession().selectOne("applic.selectOpenResumeCompnyListCnt", param);
	}


	/**
	 * 이력서 열람 기업 목록
	 * cv open compny list
	 * @param param
	 * @return List<ResumeOpenCompnyBean>
	 */
	public List<ResumeOpenCompnyBean> selectOpenResumeCompnyList(CondApplicBean param) {
		return getSqlSession().selectList("applic.selectOpenResumeCompnyList", param);
	}


	/**
	 * 이력서 열람 기업 삭제
	 * cv open resume compny delete
	 * @param param
	 * @return int
	 */
	public int deleteResumeOpenCompny(CondApplicBean param) {
		return getSqlSession().delete("setApplic.deleteResumeOpenCompny", param);
	}



	/**
	 * 알선 목록  count
	 * referral list count
	 * @param param
	 * @return int
	 */
	public int selectReferralListCnt(CondApplicBean param) {
		return getSqlSession().selectOne("applic.selectReferralListCnt", param);
	}


	/**
	 * 알선 목록
	 * referral list
	 * @param param
	 * @return List<ReferralBean>
	 */
	public List<ReferralBean> selectReferralList(CondApplicBean param) {
		return getSqlSession().selectList("applic.selectReferralList", param);
	}

	/**
	 * 알선 수락
	 * reffer ok
	 * @param param
	 * @return int
	 */
	public int updateReferralOk(ReferralBean param) {
		return getSqlSession().update("setApplic.updateReferralOk", param);
	}

	/**
	 * 입시지원 저장
	 * applic insert
	 * @param param
	 * @return int
	 */
	public int insertApplic(ApplicBean param) {
		return getSqlSession().insert("setApplic.insertApplic", param);
	}


	/**
	 * 알선 삭제
	 * reffer ok delete
	 * @param param
	 * @return int
	 */
	public int deleteReferral(CondApplicBean param) {
		return getSqlSession().update("setApplic.deleteReferral", param);
	}


	/**
	 * 알선 거부
	 * reffer no
	 * @param param
	 * @return int
	 */
	public int updateReferralNo(ReferralBean param) {
		return getSqlSession().update("setApplic.updateReferralNo", param);
	}


	/**
	 * 입사제의 수락,거절
	 * offer ok,reject
	 * @param param
	 * @return int
	 */
	public int updateOfferUser(OfferBean param) {
		return getSqlSession().update("setApplic.updateOfferUser", param);
	}



	/**
	 * 입사제의 수락후 입시지원 저장
	 * applic insert
	 * @param param
	 * @return int
	 */
	public int insertApplicOffer(ApplicBean param) {
		return getSqlSession().insert("setApplic.insertApplicOffer", param);
	}

	/**
	 * select application summary by process code
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectApplicSmry(Map<String, Object> param) {
		return getSqlSession().selectOne("applic.selectApplicSmry", param);
	}

	/**
	 * 인터뷰 수락
	 * interview ok
	 * @param param
	 * @return int
	 */
	public int updateIntvwOk(IntvwBean param) {
		return getSqlSession().update("setApplic.updateIntvwOk", param);
	}


	/**
	 * 인터뷰 거절
	 * interview reject
	 * @param param
	 * @return int
	 */
	public int updateIntvwReject(IntvwBean param) {
		return getSqlSession().update("setApplic.updateIntvwReject", param);
	}

}