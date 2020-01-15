package ony.cpes.external.jobstudy.service;

import java.util.List;

import ony.cpes.external.jobstudy.bean.CondJobStudyBean;
import ony.cpes.external.jobstudy.bean.JobStudyBean;


public interface JobStudyService {
	/**
	 * 직업탐구 1레벨 목록
	 * job study info
	 * @param param
	 * @return JobStudyBean
	 */
	public List<JobStudyBean> selectJobStudyOneLvlList(CondJobStudyBean param) throws Exception;


	/**
	 * 직업탐구 레벨별 목록
	 * job study info
	 * @param param
	 * @return JobStudyBean
	 */
	public List<JobStudyBean> selectJobStudyLvlList(CondJobStudyBean param) throws Exception;


	/**
	 * 직업탐구 정보
	 * job study info
	 * @param param
	 * @return JobStudyBean
	 */
	public JobStudyBean selectJobStudy(CondJobStudyBean param)  throws Exception;

}
