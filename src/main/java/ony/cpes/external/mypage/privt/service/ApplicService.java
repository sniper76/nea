package ony.cpes.external.mypage.privt.service;


import java.util.List;
import java.util.Map;

import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ReferralBean;
import ony.cpes.external.mypage.privt.bean.ResumeOpenCompnyBean;


public interface ApplicService {
	/**
	 * 입사지원 count정보
	 * applic list
	 * @param param
	 * @return ApplicBean
	 */
	public ApplicBean selectApplicStatCnt(CondApplicBean param)  throws Exception;

	/**
	 * 입사지원 목록
	 * applic list count
	 * @param param
	 * @return int
	 */
	public int selectApplicListCnt(CondApplicBean param) throws Exception;


	/**
	 * 입사지원 목록
	 * applic list
	 * @param param
	 * @return List<ApplicBean>
	 */
	public List<ApplicBean> selectApplicList(CondApplicBean param) throws Exception;


	/**
	 * 입사지원 취소
	 * applic cancel
	 * @param param
	 * @return int
	 */
	public int updateCancelApplic(CondApplicBean param) throws Exception;

	/**
	 * Delete Application
	 * @param applicSeqArr
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public int deleteApplic(String[] applicSeqArr, String userSeq) throws Exception;

	/**
	 * 입사제의 목록 count
	 * offer list count
	 * @param param
	 * @return int
	 */
	public int selectOfferListCnt(CondApplicBean param) throws Exception;


	/**
	 * 입사제의 목록
	 * offer list
	 * @param param
	 * @return int
	 */
	public List<OfferBean> selectOfferList(CondApplicBean param) throws Exception;


	/**
	 * 면접제의 목록 count
	 * interview list count
	 * @param param
	 * @return int
	 */
	public int selectIntvwListCnt(CondApplicBean param) throws Exception;


	/**
	 * 면접제의 목록
	 * interview list
	 * @param param
	 * @return List<IntvwBean>
	 */
	public List<IntvwBean> selectIntvwList(CondApplicBean param) throws Exception;


	/**
	 * 면접제의 상세
	 * interview detail
	 * @param param
	 * @return IntvwBean
	 */
	public IntvwBean selectIntvw(CondApplicBean param) throws Exception;


	/**
	 * 입사제의 삭제
	 * offer delete
	 * @param param
	 * @return int
	 */
	public int deleteOffer(CondApplicBean param) throws Exception;


	/**
	 * 이력서 열람 기업 목록  count
	 * cv open compny list count
	 * @param param
	 * @return int
	 */
	public int selectOpenResumeCompnyListCnt(CondApplicBean param) throws Exception;

	/**
	 * 이력서 열람 기업 목록
	 * cv open compny list
	 * @param param
	 * @return List<ResumeOpenCompnyBean>
	 */
	public List<ResumeOpenCompnyBean> selectOpenResumeCompnyList(CondApplicBean param) throws Exception;


	/**
	 * 이력서 열람 기업 삭제
	 * cv open resume compny delete
	 * @param param
	 * @return int
	 */
	public int deleteResumeOpenCompny(CondApplicBean param) throws Exception;


	/**
	 * 알선 목록  count
	 * referral list count
	 * @param param
	 * @return int
	 */
	public int selectReferralListCnt(CondApplicBean param) throws Exception;


	/**
	 * 알선 목록
	 * referral list
	 * @param param
	 * @return List<ReferralBean>
	 */
	public List<ReferralBean> selectReferralList(CondApplicBean param) throws Exception;


	/**
	 * 알선 수락
	 * reffer ok
	 * @param param
	 * @param param2
	 * @return int
	 */
	public int updateReferralOk(ReferralBean param, ApplicBean param2) throws Exception;


	/**
	 * 알선 삭제
	 * reffer ok delete
	 * @param param
	 * @return int
	 */
	public int deleteReferral(CondApplicBean param) throws Exception;


	/**
	 * 알선 거부
	 * reffer no
	 * @param param
	 * @return int
	 */
	public int updateReferralNo(ReferralBean param) throws Exception;


	/**
	 * 입사지원 등록
	 * applic insert
	 * @param param
	 * @return int
	 */
	public int insertApplic(ApplicBean param) throws Exception;


	/**
	 * 입사제의 수락,거절
	 * offer ok,reject
	 * @param param
	 * @return int
	 */
	public int updateOfferUser(OfferBean param) throws Exception;

	/**
	 * select application summary by process code
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectApplicSmry(String userSeq) throws Exception;


	/**
	 * 인터뷰 수락
	 * interview ok
	 * @param param
	 * @return int
	 */
	public int updateIntvwOk(IntvwBean param) throws Exception;


	/**
	 * 인터뷰 거절
	 * interview reject
	 * @param param
	 * @return int
	 */
	public int updateIntvwReject(IntvwBean param) throws Exception;


	/**
	 * 면접 삭제
	 * interview delete
	 * @param param
	 * @return int
	 */
	public int deleteIntvw(CondApplicBean param) throws Exception;

}
