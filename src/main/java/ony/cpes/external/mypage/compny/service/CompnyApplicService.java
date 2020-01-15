package ony.cpes.external.mypage.compny.service;

import java.util.List;
import java.util.Map;

import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ReferralBean;

public interface CompnyApplicService {
	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancySimpleList(CondApplicBean param) throws Exception;


	/**
	 * 입사지원 count정보
	 * applic list
	 * @param param
	 * @return ApplicBean
	 */
	public ApplicBean selectApplicStatCnt(CondApplicBean param) throws Exception;

	/**
	 * 입사지원 목록 count
	 * applic list count
	 * @param param
	 * @return int
	 */
	public int selectApplicListCnt(CondApplicBean param) throws Exception;

	/**
	 * 입사지원 엑셀 다운로드 목록
	 * applic list
	 * @param param
	 * @return List<ApplicBean>
	 */
	public List<Map<String, Object>> selectApplicExcelList(CondApplicBean param) throws Exception;

	/**
	 * 입사지원 목록
	 * applic list
	 * @param param
	 * @return List<ApplicBean>
	 */
	public List<ApplicBean> selectApplicList(CondApplicBean param) throws Exception;


	/**
	 * 입사지원 상태변경
	 * applic proc stat change
	 * @param param
	 * @return int
	 */
	public int updateProcStat(CondApplicBean param) throws Exception;


	/**
	 * 입사지원 이력서 열람 처리
	 * appli cx read
	 * @param param
	 * @return int
	 */
	public int updateResumeOpen(CondApplicBean param) throws Exception;

	/**
	 * 입사지원 이력서 열람 처리(다수)
	 * appli cx read(multi)
	 * @param param
	 * @return int
	 */
	public int updateResumeOpenMulti(CondApplicBean param) throws Exception;




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
	 * @return List<OfferBean>
	 */
	public List<OfferBean> selectOfferList(CondApplicBean param) throws Exception;


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
	 * 알선 삭제
	 * reffer ok delete
	 * @param param
	 * @return int
	 */
	public int deleteReferral(CondApplicBean param) throws Exception;

	/**
	 * 알선 수락
	 * reffer ok
	 * @param param
	 * @param param2
	 * @return int
	 */
	public int updateReferralOk(ReferralBean param) throws Exception;


	/**
	 * 알선 거절
	 * reffer no
	 * @param param
	 * @param param2
	 * @return int
	 */
	public int updateReferralNo(ReferralBean param) throws Exception;


	/**
	 * 입사제의 삭제
	 * offer delete
	 * @param param
	 * @return int
	 */
	public int deleteOffer(CondApplicBean param) throws Exception;

	/**
	 * 구인 목록 조회 count(진행중)
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
	public int selectVacancyListCnt(CondVacancyBean param) throws Exception;


	/**
	 * 구인 목록 조회(진행중)
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancyList(CondVacancyBean param) throws Exception;


	/**
	 * 알선 요청
	 * referral rquest
	 * @param param
	 * @return int
	 */
	public int updateReferralReq(CondApplicBean param) throws Exception;


	/**
	 * 입사지원 불합격 처리
	 * applic fail process
	 * @param param
	 * @return int
	 */
	public int updateFailReason(CondApplicBean param) throws Exception;


	/**
	 * 입사지원 인터뷰 요청
	 * applic intvw process
	 * @param param
	 * @return int
	 */
	public int updateIntvwReq(CondApplicBean param, IntvwBean param2) throws Exception;


}
