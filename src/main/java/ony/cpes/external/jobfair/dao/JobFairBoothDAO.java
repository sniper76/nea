package ony.cpes.external.jobfair.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.jobfair.bean.JobFairBoothBean;
import ony.cpes.external.jobfair.bean.JobFairBoothHistBean;
import ony.cpes.external.jobfair.bean.JobFairBoothResvWaitBean;

@Repository("JobFairBoothDAO")
public class JobFairBoothDAO extends EgovAbstractMapper {

	/**
	 * jobFair Booth Information
	 * @param param
	 * @return JobFairCenterBean
	 */
	public JobFairBoothBean selectJobFairBooth(Map<String, Object> param) {
		return getSqlSession().selectOne("jobFairBooth.selectJobFairBooth", param);
	}

	/**
	 * Job Fair Booth List
	 * @param param
	 * @return
	 */
	public List<JobFairBoothBean> selectJobFairBoothList(Map<String, Object> param) {
		return getSqlSession().selectList("jobFairBooth.selectJobFairBoothList", param);
	}

	/**
	 * Job Fair Booth Apply
	 * @param param
	 * @return
	 */
	public int insertJobFairBoothHist(JobFairBoothHistBean param) {
		return getSqlSession().insert("setJobFairBooth.insertJobFairBoothHist", param);
	}

	/**
	 * update job fair booth status
	 * @param param
	 * @return
	 */
	public int updateJobFairBoothSts(JobFairBoothBean param) {
		return getSqlSession().update("setJobFairBooth.updateJobFairBoothSts", param);
	}

	/**
	 * Job Fair Booth Reservation Waiting :: insert
	 * @param param
	 * @return
	 */
	public int insertJobFairBoothResvWait(JobFairBoothResvWaitBean param) {
		return getSqlSession().insert("setJobFairBooth.insertJobFairBoothResvWait", param);
	}

	/**
	 *Job Fair Booth Reservation Wating :: information
	 * @param param
	 * @return
	 */
	public JobFairBoothResvWaitBean selectJobFairBoothResvWait(Map<String, Object> param) {
		return getSqlSession().selectOne("jobFairBooth.selectJobFairBoothResvWait", param);
	}

}
