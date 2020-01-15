package ony.cpes.external.jobfair.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cpes.external.compny.dao.CompnyDAO;
import ony.cpes.external.instt.dao.InsttDAO;
import ony.cpes.external.jobfair.bean.CondJobFairCenterBean;
import ony.cpes.external.jobfair.bean.JobFairBoothBean;
import ony.cpes.external.jobfair.bean.JobFairBoothHistBean;
import ony.cpes.external.jobfair.bean.JobFairBoothResvWaitBean;
import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnCompnyBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnInsttBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnOnlineBean;
import ony.cpes.external.jobfair.dao.JobFairBoothDAO;
import ony.cpes.external.jobfair.dao.JobFairDAO;
import ony.cpes.external.jobfair.dao.JobFairPatcptnDAO;
import ony.cpes.external.jobfair.service.JobFairService;
import ony.cpes.external.mypage.compny.bean.CompnyMemBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.cpes.external.mypage.privt.bean.InterestBean;

@Service("JobFairService")
public class JobFairServiceImpl implements JobFairService {

	@Autowired JobFairDAO jobfairDAO;
	@Autowired JobFairPatcptnDAO jobFairPatcptnDAO;
	@Autowired JobFairBoothDAO jobfairBoothDAO;
	@Autowired CompnyDAO compnyDAO;
	@Autowired InsttDAO insttDAO;
	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;

	/**
	 * jobfair list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectJobFairListCnt (CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairListCnt(param);
    }

	/**
	 * jobfair list
	 * @param param
	 * @return List<JobFairCenterBean>
	 */
    @Override
	public List<JobFairCenterBean> selectJobFairList (CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairList(param);
    }

    /**
     * jobfair detail
     * @param param
     * @return JobFairCenterBean
     */
    @Override
    public JobFairCenterBean selectJobFairInfo (CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairInfo(param);
    }

	/**
	 * jobfair detail by employers count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectJobFairByEmployersCnt (CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairByEmployersCnt(param);
    }

    /**
     * jobfair detail by employers
     * @param param
     * @return List<InterestBean>
     */
    @Override
    public List<InterestBean> selectJobFairByEmployers (CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairByEmployers(param);
    }

    /**
     * jobfair detail by vacancys count
     * @param param
     * @return int
     */
    @Override
    public int selectJobFairByVacancysCnt (CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairByVacancysCnt(param);
    }

    /**
     * jobfair detail by vacancys
     * @param param
     * @return List<CompanyBean>
     */
    @Override
    public List<InterestBean> selectJobFairByVacancys (CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairByVacancys(param);
    }

    /**
     * jobfair detail by edu instts count
     * @param param
     * @return int
     */
    @Override
    public int selectJobFairByEduInsttsCnt (CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairByEduInsttsCnt(param);
    }

    /**
     * jobfair detail by edu instts
     * @param param
     * @return List<CompanyBean>
     */
    @Override
    public List<InterestBean> selectJobFairByEduInstts (CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairByEduInstts(param);
    }

	/**
	 * jobfair apply list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectJobFairApplyListCnt(CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairApplyListCnt(param);
    }

	/**
	 * jobfair apply list
	 * @param param
	 * @return List<JobFairCenterBean>
	 */
    @Override
	public List<JobFairCenterBean> selectJobFairApplyList(CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairApplyList(param);
    }

    /**
     * jobfair apply detail
     * @param param
     * @return JobFairCenterBean
     */
    @Override
    public JobFairCenterBean selectJobFairApplyInfo(CondJobFairCenterBean param) throws Exception {
    	return jobfairDAO.selectJobFairApplyInfo(param);
    }

    /**
	 * 참가신청 (일반/학생)
	 * Participate job fair (Online)
	 * @param param
	 * @return integer
	 * @throws Exception
     */
    @Override
    public int insertJobFairApplyPatcptnOnline(JobFairPatcptnBean param) throws Exception {
		return jobFairPatcptnDAO.insertJobFairApplyPatcptnOnline(param);
	}

	/**
	 * Job Fair Participate information (online)
	 * @param fairSeq
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
    public JobFairPatcptnOnlineBean selectJobFairApplyPatcptnOnline(String fairSeq, String userSeq) throws Exception {
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("fairSeq", fairSeq);
    	param.put("userSeq", userSeq);
    	return jobFairPatcptnDAO.selectJobFairApplyPatcptnOnline(param);
    }

    /**
	 * 참가신청 (기업) :: Save
	 * Participate job fair (Company)
	 * @param param
	 * @return integer
	 * @throws Exception
     */
    @Override
    public int insertJobFairApplyPatcptnCompny(JobFairPatcptnBean param) throws Exception {
		return jobFairPatcptnDAO.insertJobFairApplyPatcptnCompny(param);
	}

    /**
     * 참가신청 (기업) :: Information
     */
    @Override
    public JobFairPatcptnCompnyBean selectJobFairApplyPatcptnCompny(String fairSeq, String userSeq) throws Exception {
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("fairSeq", fairSeq);
    	param.put("userSeq", userSeq);
    	return jobFairPatcptnDAO.selectJobFairApplyPatcptnCompny(param);
    }

	/**
	 * 참가신청 (기관) :: Save
	 * Participate job fair (Institute)
	 * @param param
	 * @return integer
	 * @throws Exception
	 */
    @Override
    public int insertJobFairApplyPatcptnInstt(JobFairPatcptnBean param) throws Exception {
		return jobFairPatcptnDAO.insertJobFairApplyPatcptnInstt(param);
	}

    /**
     * 참가신청 (기관) :: Information
     */
    @Override
    public JobFairPatcptnInsttBean selectJobFairApplyPatcptnInstt(String fairSeq, String userSeq) throws Exception {
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("fairSeq", fairSeq);
    	param.put("userSeq", userSeq);
    	return jobFairPatcptnDAO.selectJobFairApplyPatcptnInstt(param);
    }

    /**
     * Job Fair Booth information
     */
    public JobFairBoothBean selectJobFairBooth(String boothSeq, String fairSeq) throws Exception {
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("boothSeq", boothSeq);
    	param.put("fairSeq", fairSeq);
    	return jobfairBoothDAO.selectJobFairBooth(param);
    }

    /**
     * Job Fair Booth List
     */
    public List<JobFairBoothBean> selectJobFairBoothList(String fairSeq, String langCd) throws Exception {
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("fairSeq", fairSeq);
    	param.put("langCd", langCd);
    	return jobfairBoothDAO.selectJobFairBoothList(param);
    }

    /**
     * Job Fair Booth Apply
     */
    public int insertJobFairBoothApply(JobFairBoothHistBean jobFairBoothHist, JobFairBoothBean jobFairBooth, String userAuthCd, String langCd) throws Exception {
    	String compnyInsttDivCd = "";
    	String compnyInsttSeq = "";
    	String userSeq = jobFairBoothHist.getRegUserSeq();

    	if("ROLE_USER".equals(userAuthCd) || "ROLE_STDIT".equals(userAuthCd)) {
		} else if("ROLE_CMPNY".equals(userAuthCd)) { //Company
			compnyInsttDivCd = "CIDC000000001";
			CompnyMemBean compnyMemBean = compnyDAO.selectCompnyByUserSeq(userSeq, langCd);
			if(compnyMemBean != null) {
				compnyInsttSeq = compnyMemBean.getCompnySeq();
			}

		} else if("ROLE_TRNCT".equals(userAuthCd)) { //Institute
			compnyInsttDivCd = "CIDC000000002";
			InsttMemBean insttMemBean = insttDAO.selectInsttByUser(userSeq, langCd);
			if(insttMemBean != null) {
				compnyInsttSeq = insttMemBean.getInsttSeq();
			}

		}

    	// insert booth apply history
    	jobFairBoothHist.setCompnyInsttDivCd(compnyInsttDivCd);
    	jobFairBoothHist.setCompnyInsttSeq(compnyInsttSeq);
    	jobFairBoothHist.setResvStsCd("RSV0000000002"); //입금대기
    	jobfairBoothDAO.insertJobFairBoothHist(jobFairBoothHist);

    	// update booth status
    	jobFairBooth.setBoothStsCd("BSC0000000002"); //입금대기
    	return jobfairBoothDAO.updateJobFairBoothSts(jobFairBooth);
    }

	/**
	 * Job Fair Booth Reservation Waiting
	 * @param jobFairBoothResvWaitBean
	 * @return
	 * @throws Exception
	 */
    public int insertJobFairBoothResvWait(JobFairBoothResvWaitBean param) throws Exception {
    	return jobfairBoothDAO.insertJobFairBoothResvWait(param);
    }

	/**
	 *Job Fair Booth Reservation Waiting :: information
	 * @param fairSeq
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
    public JobFairBoothResvWaitBean selectJobFairBoothResvWait(String fairSeq, String userSeq, String compnyInsttDivCd) throws Exception {
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("fairSeq", fairSeq);
    	param.put("userSeq", userSeq);
    	param.put("compnyInsttDivCd", compnyInsttDivCd);
    	return jobfairBoothDAO.selectJobFairBoothResvWait(param);
    }

	/**
	 * Job Fair Count by period
	 * @param startDt
	 * @param endDt
	 * @return
	 * @throws Exception
	 */
	public int selectJobFairTermCnt(String startDt, String endDt, String langCd) throws Exception {
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("fairBgnDt", startDt);
    	param.put("fairEndDt", endDt);
    	param.put("langCd", langCd);
    	return jobfairDAO.selectJobFairTermCnt(param);
	}

	/**
	 * Job Fair List by period
	 * @param startDt
	 * @param endDt
	 * @return
	 * @throws Exception
	 */
	public List<JobFairCenterBean> selectJobFairTermList(String startDt, String endDt, String langCd) throws Exception {
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("fairBgnDt", startDt);
    	param.put("fairEndDt", endDt);
    	param.put("langCd", langCd);
    	return jobfairDAO.selectJobFairTermList(param);
	}

}