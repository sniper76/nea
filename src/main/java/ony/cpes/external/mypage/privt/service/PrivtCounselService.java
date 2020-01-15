package ony.cpes.external.mypage.privt.service;


import java.util.List;

import ony.cpes.external.mypage.privt.bean.CondCounselBean;
import ony.cpes.external.mypage.privt.bean.EduTrnngBean;



public interface PrivtCounselService {
	/**
	 * 직업훈련 신청 목록 count
	 * education trnning nea list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngNeaListCnt(CondCounselBean param) throws Exception;

	/**
	 * 직업훈련 신청 목록
	 * education trnning nea list
	 * @param param
	 * @return List<FairBean>
	 */
	public List<EduTrnngBean> selectEduTrnngNeaList(CondCounselBean param) throws Exception;

	/**
	 * 직업훈련 신청 신청 취소
	 * education trnning nea cancel
	 * @param param
	 * @return int
	 */
	public int updateCancelEduTrnngNea(CondCounselBean param) throws Exception;

	/**
	 * 직업훈련 신청 삭제
	 * education trnning nea delete
	 * @param param
	 * @return int
	 */
	public int deleteEduTrnngNea(CondCounselBean param) throws Exception;

}
