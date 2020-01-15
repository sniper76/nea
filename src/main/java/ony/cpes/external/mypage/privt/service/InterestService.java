package ony.cpes.external.mypage.privt.service;


import java.util.List;

import ony.cpes.external.mypage.privt.bean.CondInterestBean;
import ony.cpes.external.mypage.privt.bean.InterestBean;



public interface InterestService {


	/**
	 * 관심 채용공고 목록 count
	 * Interest vacancy list count
	 * @param param
	 * @return int
	 */
	public int selectVacancyListCnt(CondInterestBean param) throws Exception;


	/**
	 * 관심 채용공고 목록
	 * Interest vacancy list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectVacancyList(CondInterestBean param) throws Exception;

	/**
	 * 관심기업 목록 count
	 * Interest company list count
	 * @param param
	 * @return int
	 */
	public int selectCompnyListCnt(CondInterestBean param) throws Exception;

	/**
	 * 관심기업 목록
	 * Interest company list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectCompnyList(CondInterestBean param) throws Exception;


	/**
	 * 관심채용행사 목록 count
	 * Interest fair list count
	 * @param param
	 * @return int
	 */
	public int selectFairListCnt(CondInterestBean param) throws Exception;

	/**
	 * 관심채용행사 목록
	 * Interest fair list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectFairList(CondInterestBean param) throws Exception;


	/**
	 * 관심교육기관 목록 count
	 * Interest education instt list count
	 * @param param
	 * @return int
	 */
	public int selectEduInsttListCnt(CondInterestBean param) throws Exception;

	/**
	 * 관심교육기관 목록
	 * Interest education instt list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectEduInsttList(CondInterestBean param) throws Exception;


	/**
	 * 관심교육프로그램 목록 count
	 * Interest education program list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngListCnt(CondInterestBean param) throws Exception;

	/**
	 * 관심교육프로그램 목록
	 * Interest education program list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectEduTrnngList(CondInterestBean param) throws Exception;

	/**
	 * 관심직업훈련 목록 count
	 * Interest education program nea list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngNeaListCnt(CondInterestBean param) throws Exception;

	/**
	 * 관심직업훈련 목록
	 * Interest education program nea list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectEduTrnngNeaList(CondInterestBean param) throws Exception;
}
