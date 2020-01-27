package ony.cpes.external.vacancy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cmm.common.ConstVal;
import ony.cpes.external.member.bean.CompanyBean;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.vacancy.bean.CondVacancyBean;
import ony.cpes.external.vacancy.bean.PopulCompnyBean;
import ony.cpes.external.vacancy.bean.PopulVacancyBean;
import ony.cpes.external.vacancy.bean.VacancyBean;
import ony.cpes.external.vacancy.dao.VacancyDAO;
import ony.cpes.external.vacancy.service.VacancyService;




@Service("VacancyService")
public class VacancyServiceImpl implements VacancyService {

	@Autowired VacancyDAO vacancyDAO;

	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;


	/**
	 * 구인 상세
	 * offer of a job detail
	 * @param param
	 * @return VacancyBean
	 */
    @Override
	public VacancyBean selectVacancy(CondVacancyBean param) throws Exception {
    	VacancyBean vacancyBean = null;

   		vacancyBean =  vacancyDAO.selectVacancy(param);
		if(!StringUtils.isEmpty(vacancyBean)) {
			vacancyBean.setVacancyLocBeanList(vacancyDAO.selectVacancyLocList(param));
			vacancyBean.setVacancyLangBeanList(vacancyDAO.selectVacancyLangList(param));
			vacancyBean.setVacancyPreferntBeanList(vacancyDAO.selectVacancyPreferntList(param));
		}



		return vacancyBean;
	}


	/**
	 * 채용공고별 입사지원
	 * vacancy of applic
	 * @param param
	 * @return ApplicBean
	 */
    @Override
	public ApplicBean selectVacancyApplic(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyApplic(param);
	}



	/**
	 * 채용공고별 입사제의
	 * offer of a job
	 * @param param
	 * @return OfferBean
	 */
    @Override
	public OfferBean selectVacancyOffer(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyOffer(param);
	}


	/**
	 * 입사지원별 인터뷰
	 * offer of a job
	 * @param param
	 * @return IntvwBean
	 */
    @Override
	public IntvwBean selectApplicIntvw(CondVacancyBean param) throws Exception {
		return vacancyDAO.selectApplicIntvw(param);
	}



	/**
	 * 채용공고 검색 count
	 * vacancy search list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectSearchListCnt(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectSearchListCnt(param);
    }


	/**
	 * 채용공고 검색 count
	 * vacancy search list count
	 * @param param
	 * @return int
	 */
    @Override
	public List<VacancyBean> selectSearchList(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectSearchList(param);
    }

	/**
	 * 채용공고 오늘 count
	 * vacancy today count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectVacancyTodayCnt(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyTodayCnt(param);
	}

	/**
	 * 오늘의 인기기업 수
	 * @return
	 * @throws Exception
	 */
    @Override
	public int selectVacancyPopulateCompnyTodayListCnt(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyPopulateCompnyTodayListCnt(param);
	}

	/**
	 * 오늘의 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PopulCompnyBean> selectVacancyPopulateCompnyTodayList(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyPopulateCompnyTodayList(param);
	}

	/**
	 * 이주의 인기기업 수
	 * @return
	 * @throws Exception
	 */
	@Override
	public int selectVacancyPopulateCompnyByWeekListCnt(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyPopulateCompnyByWeekListCnt(param);
	}

	/**
	 * 이주의 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PopulCompnyBean> selectVacancyPopulateCompnyByWeekList(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyPopulateCompnyByWeekList(param);
	}

	/**
	 * 이달의 인기기업 수
	 * @return
	 * @throws Exception
	 */
	@Override
	public int selectVacancyPopulateCompnyByMonthListCnt(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyPopulateCompnyByMonthListCnt(param);
	}

	/**
	 * 이달의 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PopulCompnyBean> selectVacancyPopulateCompnyByMonthList(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyPopulateCompnyByMonthList(param);
	}

	/**
	 * 누적 인기기업 수
	 * @return
	 * @throws Exception
	 */
	@Override
	public int selectVacancyPopulateCompnyByAccumulateListCnt(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyPopulateCompnyByAccumulateListCnt(param);
	}

	/**
	 * 누적 인기기업 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PopulCompnyBean> selectVacancyPopulateCompnyByAccumulateList(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyPopulateCompnyByAccumulateList(param);
	}

	/**
	 * 인기채용공고 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PopulVacancyBean> selectVacancyPopulateList(CondVacancyBean param) throws Exception {
    	return vacancyDAO.selectVacancyPopulateList(param);
	}




	/**
	 * 채용공고  최신 60개
	 * vacancy list
	 * @param param
	 * @return List<VacancyBean>
	 */
	@Override
	public List<VacancyBean> selectMainVacancyList(CondVacancyBean param) throws Exception {
		return vacancyDAO.selectMainVacancyList(param);
	}


	/**
	 * 이달의 인기기업
	 * month company list
	 * @param param
	 * @return List<PopulCompnyBean>
	 */
	@Override
	public List<PopulCompnyBean> selectMonthCompnyList(CondVacancyBean param) throws Exception {
		return vacancyDAO.selectMonthCompnyList(param);
	}


	/**
	 * 오늘의 인기 채용공고
	 * vacancy today list
	 * @param param
	 * @return int
	 */
	@Override
	public int selectTodayVacancyListCnt(CondVacancyBean param) throws Exception {
		return vacancyDAO.selectTodayVacancyListCnt(param);
	}

	/**
	 * 오늘의 인기 채용공고
	 * vacancy today list
	 * @param param
	 * @return List<PopulVacancyBean>
	 */
	@Override
	public List<PopulVacancyBean> selectTodayVacancyList(CondVacancyBean param) throws Exception {
		return vacancyDAO.selectTodayVacancyList(param);
	}
}
