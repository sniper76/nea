package ony.cpes.external.mypage.privt.service;


import java.util.List;

import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.cpes.external.mypage.privt.bean.FairBean;



public interface PrivtFairService {

	/**
	 * 채용행사 목록 count
	 * fair list count
	 * @param param
	 * @return int
	 */
	public int selectFairListCnt(CondFairBean param) throws Exception;

	/**
	 * 채용행사 목록
	 * fair list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<FairBean> selectFairList(CondFairBean param) throws Exception;

	/**
	 * 채용행사 신청 취소
	 * fair cancel
	 * @param param
	 * @return int
	 */
	public int updateCancelFair(CondFairBean param) throws Exception;

	/**
	 * 채용행사 삭제
	 * fair delete
	 * @param param
	 * @return int
	 */
	public int deleteFair(CondFairBean param) throws Exception;
}
