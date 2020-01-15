package ony.cpes.external.jobfair.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.jobfair.bean.JobFairPatcptnBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnCompnyBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnInsttBean;
import ony.cpes.external.jobfair.bean.JobFairPatcptnOnlineBean;

@Repository("JobFairPatcptnDAO")
public class JobFairPatcptnDAO extends EgovAbstractMapper {

	/**
	 * 참가신청 (일반/학생)
	 * Participate job fair (Online) :: insert
	 * @param param
	 * @return integer
	 * @throws Exception
	 */
	public int insertJobFairApplyPatcptnOnline(JobFairPatcptnBean param) {
		return getSqlSession().insert("setJobFairPatcptn.insertJobFairPatcptnOnline", param);
	}

	/**
	 * 참가신청 (일반/학생)
	 * Participate job fair (Online) :: information
	 * @param param
	 * @return
	 */
	public JobFairPatcptnOnlineBean selectJobFairApplyPatcptnOnline(Map<String, Object> param) {
		return getSqlSession().selectOne("jobFairPatcptn.selectJobFairApplyPatcptnOnline", param);
	}

    /**
	 * 참가신청 (기업) :: 저장
	 * Participate job fair (Company)
	 * @param param
	 * @return integer
	 * @throws Exception
     */
	public int insertJobFairApplyPatcptnCompny(JobFairPatcptnBean param) {
		return getSqlSession().insert("setJobFairPatcptn.insertJobFairPatcptnCompny", param);
	}

	/**
	 * 참가신청 (기업) :: Information
	 * @param param
	 * @return
	 */
	public JobFairPatcptnCompnyBean selectJobFairApplyPatcptnCompny(Map<String, Object> param) {
		return getSqlSession().selectOne("jobFairPatcptn.selectJobFairApplyPatcptnCompny", param);
	}

	/**
	 * 참가신청 (기관) :: Save
	 * Participate job fair (Institute)
	 * @param param
	 * @return integer
	 * @throws Exception
	 */
	public int insertJobFairApplyPatcptnInstt(JobFairPatcptnBean param) {
		return getSqlSession().insert("setJobFairPatcptn.insertJobFairPatcptnInstt", param);
	}

	/**
	 * 참가신청 (기관) :: Information
	 * @param param
	 * @return
	 */
	public JobFairPatcptnInsttBean selectJobFairApplyPatcptnInstt(Map<String, Object> param) {
		return getSqlSession().selectOne("jobFairPatcptn.selectJobFairApplyPatcptnInstt", param);
	}

}
