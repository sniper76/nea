package ony.cpes.external.compny.service;


import java.util.List;

import ony.cpes.external.mypage.compny.bean.CompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;

public interface CompnyService {
	/**
	 * 기업정보 조회
	 * company member view
	 * @param param
	 * @return CompnyMemBean
	 */
	public CompnyMemBean selectCompnyInfo(CondCompnyMemBean param) throws Exception;



	/**
	 * 구인 목록 조회 count
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
	public int selectVacancyContinueListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancyContinueList(CondVacancyBean param) throws Exception;

	/**
	 * Company Information by user
	 * @param userSeq
	 * @param langCd
	 * @return
	 * @throws Exception
	 */
	public CompnyMemBean selectCompnyByUserSeq(String userSeq, String langCd) throws Exception;

}
