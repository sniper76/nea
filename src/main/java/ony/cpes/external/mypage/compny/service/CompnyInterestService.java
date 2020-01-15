package ony.cpes.external.mypage.compny.service;


import java.util.List;

import ony.cpes.external.mypage.compny.bean.CondInterestBean;
import ony.cpes.external.mypage.compny.bean.InterestBean;



public interface CompnyInterestService {


	/**
	 * 채용공고를 관심등록한 인재 count
	 * Interest vacancy from private member count
	 * @param param
	 * @return int
	 */
	public int selectVacancyListCnt(CondInterestBean param) throws Exception;


	/**
	 * 채용공고를 관심등록한 인재
	 * Interest vacancy from private member
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectVacancyList(CondInterestBean param) throws Exception;


	/**
	 * 관심 회사로 등록한 인재 count
	 * Interest compnay from private member count
	 * @param param
	 * @return int
	 */
	public int selectCompnyListCnt(CondInterestBean param) throws Exception;

	/**
	 * 관심 회사로 등록한 인재
	 * Interest compnay from private member
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectCompnyList(CondInterestBean param) throws Exception;


	/**
	 * 관심인재 목록 count
	 * Interest resume count
	 * @param param
	 * @return int
	 */
	public int selectResumeListCnt(CondInterestBean param) throws Exception;


	/**
	 * 관심인재 목록
	 * Interest resume list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectResumeList(CondInterestBean param) throws Exception;


	/**
	 * 관심채용행사 목록 count
	 * Interest fair count
	 * @param param
	 * @return int
	 */
	public int selectFairListCnt(CondInterestBean param) throws Exception;

	/**
	 * 관심채용행사 목록
	 * interest fair list
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectFairList(CondInterestBean param) throws Exception;
}
