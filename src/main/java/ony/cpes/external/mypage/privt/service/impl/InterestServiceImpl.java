package ony.cpes.external.mypage.privt.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cpes.external.mypage.privt.bean.CondInterestBean;
import ony.cpes.external.mypage.privt.bean.InterestBean;
import ony.cpes.external.mypage.privt.dao.InterestDAO;
import ony.cpes.external.mypage.privt.service.InterestService;


@Service("InterestService")
public class InterestServiceImpl implements InterestService {

	@Autowired
	private InterestDAO interestDAO;

	/**
	 * 관심 채용공고 목록 count
	 * Interest vacancy list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectVacancyListCnt(CondInterestBean param) throws Exception {
		return interestDAO.selectVacancyListCnt(param);
	}


	/**
	 * 관심 채용공고 목록
	 * Interest vacancy list
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectVacancyList(CondInterestBean param) throws Exception {
		return interestDAO.selectVacancyList(param);
	}

	/**
	 * 관심기업 목록 count
	 * Interest company list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectCompnyListCnt(CondInterestBean param) throws Exception {
		return interestDAO.selectCompnyListCnt(param);
	}

	/**
	 * 관심기업 목록
	 * Interest company list
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectCompnyList(CondInterestBean param) throws Exception {
		return interestDAO.selectCompnyList(param);
	}

	/**
	 * 관심채용행사 목록 count
	 * Interest fair list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectFairListCnt(CondInterestBean param) throws Exception {
		return interestDAO.selectFairListCnt(param);
	}

	/**
	 * 관심채용행사 목록
	 * Interest fair list
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectFairList(CondInterestBean param) throws Exception {
		return interestDAO.selectFairList(param);
	}

	/**
	 * 관심교육기관 목록 count
	 * Interest education instt list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectEduInsttListCnt(CondInterestBean param) throws Exception {
		return interestDAO.selectEduInsttListCnt(param);
	}

	/**
	 * 관심교육기관 목록
	 * Interest education instt list
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectEduInsttList(CondInterestBean param) throws Exception {
		return interestDAO.selectEduInsttList(param);
	}

	/**
	 * 관심교육프로그램 목록 count
	 * Interest education program list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectEduTrnngListCnt(CondInterestBean param) throws Exception {
		return interestDAO.selectEduTrnngListCnt(param);
	}

	/**
	 * 관심교육프로그램 목록
	 * Interest education program list
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectEduTrnngList(CondInterestBean param) throws Exception {
		return interestDAO.selectEduTrnngList(param);
	}

	/**
	 * 관심직업훈련 목록 count
	 * Interest education program nea list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectEduTrnngNeaListCnt(CondInterestBean param) throws Exception {
		return interestDAO.selectEduTrnngNeaListCnt(param);
	}

	/**
	 * 관심직업훈련 목록
	 * Interest education program nea list
	 * @param param
	 * @return List<InterestBean>
	 */
	@Override
	public List<InterestBean> selectEduTrnngNeaList(CondInterestBean param) throws Exception {
		return interestDAO.selectEduTrnngNeaList(param);
	}

}
