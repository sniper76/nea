package ony.cpes.external.mypage.compny.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cpes.external.mypage.compny.bean.CondInterestBean;
import ony.cpes.external.mypage.compny.bean.InterestBean;
import ony.cpes.external.mypage.compny.dao.CompnyInterestDAO;
import ony.cpes.external.mypage.compny.service.CompnyInterestService;




@Service("CompnyInterestService")
public class CompnyInterestServiceImpl implements CompnyInterestService {

	@Autowired
	private CompnyInterestDAO compnyInterestDAO;

	/**
	 * 채용공고를 관심 등록한 인재 목록 count
	 * Interest vacancy from private member count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectVacancyListCnt(CondInterestBean param) throws Exception {
		return compnyInterestDAO.selectVacancyListCnt(param);
	}


	/**
	 * 채용공고를 관심 등록한 인재 목록
	 * Interest vacancy from private member
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectVacancyList(CondInterestBean param) throws Exception {
		return compnyInterestDAO.selectVacancyList(param);
	}


	/**
	 * 관심 회사로 등록한 인재 count
	 * Interest compnay from private member count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectCompnyListCnt(CondInterestBean param) throws Exception {
		return compnyInterestDAO.selectCompnyListCnt(param);
	}

	/**
	 * 관심 회사로 등록한 인재
	 * Interest compnay from private member
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectCompnyList(CondInterestBean param) throws Exception {
		return compnyInterestDAO.selectCompnyList(param);
	}


	/**
	 * 관심인재 목록 count
	 * Interest resume count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectResumeListCnt(CondInterestBean param) throws Exception {
		return compnyInterestDAO.selectResumeListCnt(param);
	}


	/**
	 * 관심인재 목록
	 * Interest resume list
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectResumeList(CondInterestBean param) throws Exception {
		return compnyInterestDAO.selectResumeList(param);
	}


	/**
	 * 관심채용행사 목록 count
	 * Interest fair count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectFairListCnt(CondInterestBean param) throws Exception {
		return compnyInterestDAO.selectFairListCnt(param);
	}

	/**
	 * 관심채용행사 목록
	 * interest fair list
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectFairList(CondInterestBean param) throws Exception{
		return compnyInterestDAO.selectFairList(param);
	}

}
