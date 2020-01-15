package ony.cpes.external.jobcenter.service;

import java.util.List;

import ony.cpes.external.jobcenter.bean.CondJobCenterBean;
import ony.cpes.external.jobcenter.bean.JobCenterBean;





public interface JobCenterService {

	/**
	 * 잡센터 목록 count
	 * jobcenter list count
	 * @param param
	 * @return int
	 */
	public int selectJobCenterListCnt (CondJobCenterBean param) throws Exception;

	/**
	 * 잡센터 목록
	 * jobcenter list
	 * @param param
	 * @return List<JobCenterBean>
	 */
	public List<JobCenterBean> selectJobCenterList (CondJobCenterBean param) throws Exception;


	/**
	 * 잡센터 상세
	 * jobcenter view
	 * @param param
	 * @return List<JobCenterBean>
	 */
	public JobCenterBean selectJobCenter (CondJobCenterBean param) throws Exception;

}
