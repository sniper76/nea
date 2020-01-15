package ony.cpes.external.mypage.instt.service;


import java.util.List;

import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.cpes.external.mypage.privt.bean.FairBean;



public interface InsttFairService {

	/**
	 * 초청받은 채용행사 목록 count
	 * invite fair list count
	 * @param param
	 * @return int
	 */
	public int selectInviteListCnt(CondFairBean param) throws Exception;

	/**
	 * 초청받은 채용행사 목록
	 * invite fair list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<FairBean> selectInviteList(CondFairBean param) throws Exception;



	/**
	 * 초청받은 채용행사 신청
	 * invite fair request
	 * @param param
	 * @return int
	 */
	public int updateInviteOk(CondFairBean param) throws Exception;


	/**
	 * 초청받은 채용행사 삭제
	 * invite fair delete
	 * @param param
	 * @return int
	 */
	public int deleteInvite(CondFairBean param) throws Exception;


	/**
	 * 부스신청 목록 count
	 * fair booth list count
	 * @param param
	 * @return int
	 */
	public int selectBoothListCnt(CondFairBean param) throws Exception;

	/**
	 * 부스신청 목록 count
	 * fair booth list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<FairBean> selectBoothList(CondFairBean param) throws Exception;


	/**
	 * 채용행사 부스 취소
	 * fair booth cancel
	 * @param param
	 * @return int
	 */
	public int updateBoothCancel(CondFairBean param) throws Exception;
}
