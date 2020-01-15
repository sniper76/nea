package ony.cpes.external.instt.service;



import java.util.List;

import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngFreeBean;
import ony.cpes.external.mypage.instt.bean.CondInsttMemBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngHistBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;

public interface InsttService {

	/**
	 * 교육기관정보 조회
	 * education member info
	 * @param param
	 * @return PrivtMemBean
	 */
	public InsttMemBean selectInstt(CondInsttMemBean param) throws Exception;


	/**
	 * 교육훈련 목록 조회 count
	 * education tranning list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngContinueListCnt(CondEduTrnngBean param) throws Exception;

	/**
	 * 교육훈련 목록  조회
	 * education tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngContinueList(CondEduTrnngBean param) throws Exception;

	/**
	 * institute list count
	 * @param param
	 * @return int
	 */
	public int selectInsttListCnt(CondEduTrnngFreeBean param) throws Exception;

	/**
	 * institute list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<InsttMemBean> selectInsttList(CondEduTrnngFreeBean param) throws Exception;


	/**
	 * 교육훈련 이력 목록 조회
	 * education history list
	 * @param param
	 * @return List<EduTrnngHistBean>
	 */
	public List<EduTrnngHistBean> selectEduTrnngHistList(CondInsttMemBean param) throws Exception;

	/**
	 * Institute information by user
	 * @param userSeq
	 * @param langCd
	 * @return
	 * @throws Exception
	 */
	public InsttMemBean selectInsttByUser(String userSeq, String langCd) throws Exception;

}
