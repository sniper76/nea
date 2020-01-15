package ony.cpes.external.mypage.privt.service;


import java.util.List;

import ony.cpes.external.mypage.privt.bean.CondJobskBean;
import ony.cpes.external.mypage.privt.bean.JobskBean;

public interface JobskService {


	/**
	 * 구직신청 조회
	 * jobseeker view
	 * @param param
	 * @return JobskBean
	 */
	public JobskBean selectJobskYn(CondJobskBean param) throws Exception;


	/**
	 * 비구직으로 변경
	 * not jobseerker
	 * @param param
	 * @return int
	 */
	public int updateCloseJobsk(CondJobskBean param) throws Exception;

	/**
	 * 대표이력서 조회
	 * primary resume
	 * @param param
	 * @return JobskBean
	 */
	public JobskBean selectPriResume(CondJobskBean param) throws Exception;


	/**
	 * 구직신청 등록
	 * jobseeker insert
	 * @param param
	 * @return int
	 */
	public int insertJobsk(JobskBean param) throws Exception;


	/**
	 * 구직신청 목록 조회
	 * jobseeker list
	 * @param param
	 * @return List<JobskBean>
	 */
	public List<JobskBean> selectJobskList(CondJobskBean param) throws Exception;


	/**
	 * 구직신청 삭제
	 * jobseeker delete
	 * @param param
	 * @return int
	 */
	public int deleteJobsk(CondJobskBean param) throws Exception;


	/**
	 * 알선 신청
	 * jobseeker update
	 * @param param
	 * @return int
	 */
	public int updateUrgencyResume(CondJobskBean param) throws Exception;


	/**
	 * 구직신청 상세
	 * jobseeker view
	 * @param param
	 * @return JobskBean
	 */
	public JobskBean selectJobsk(CondJobskBean param) throws Exception;


}
