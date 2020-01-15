package ony.cpes.external.mypage.privt.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.CondJobskBean;
import ony.cpes.external.mypage.privt.bean.JobskBean;



@Repository("JobskDAO")
public class JobskDAO  extends EgovAbstractMapper {
	/**
	 * 구직신청 조회
	 * jobseeker view
	 * @param param
	 * @return JobskBean
	 */
	public JobskBean selectJobskYn(CondJobskBean param) {
		return getSqlSession().selectOne("jobsk.selectJobskYn", param);
	}

	/**
	 * 구직상태취소
	 * jobseeker status change
	 * @param param
	 * @return int
	 */
	public int updateCancelJobskReq(CondJobskBean param) {
		return getSqlSession().update("setJobsk.updateCancelJobskReq", param);
	}

	/**
	 * 구직신청 상태 변경(구직 or 비구직)
	 * jobseeker status change
	 * @param param
	 * @return int
	 */
	public int updateResumeJobskYn(CondJobskBean param) {
		return getSqlSession().update("setJobsk.updateResumeJobskYn", param);
	}




	/**
	 * 구직신청 상태 변경(구직 or 비구직)
	 * jobseeker status change
	 * @param param
	 * @return int
	 */
	public int updateUserJobskYn(CondJobskBean param) {
		return getSqlSession().update("setJobsk.updateUserJobskYn", param);
	}

	/**
	 * 대표이력서 조회
	 * primary resume
	 * @param param
	 * @return JobskBean
	 */
	public JobskBean selectPriResume(CondJobskBean param) {
		return getSqlSession().selectOne("jobsk.selectPriResume", param);
	}

	/**
	 * 대표 이력서 수정
	 * resume update
	 * @param param
	 * @return int
	 */
	public int updateJobskResume(JobskBean param) {
		return getSqlSession().update("setJobsk.updateJobskResume", param);
	}

	/**
	 * 구직신청 등록
	 * jobseeker insert
	 * @param param
	 * @return int
	 */
	public int insertJobsk(JobskBean param) {
		return getSqlSession().insert("setJobsk.insertJobsk", param);
	}


	/**
	 * 구직신청 조회
	 * jobseeker view
	 * @param param
	 * @return JobskBean
	 */
	public String selectJobskNum(JobskBean param) {
		return getSqlSession().selectOne("jobsk.selectJobskNum", param);
	}



	/**
	 * 구직신청 목록 조회
	 * jobseeker list
	 * @param param
	 * @return List<JobskBean>
	 */
	public List<JobskBean> selectJobskList(CondJobskBean param) {
		return getSqlSession().selectList("jobsk.selectJobskList", param);
	}


	/**
	 * 구직신청 삭제
	 * jobseeker delete
	 * @param param
	 * @return int
	 */
	public int deleteJobsk(CondJobskBean param) {
		return getSqlSession().update("setJobsk.deleteJobsk", param);
	}

	/**
	 * 알선 신청
	 * jobseeker update
	 * @param param
	 * @return int
	 */
	public int updateUrgencyResume(CondJobskBean param) {
		return getSqlSession().update("setJobsk.updateUrgencyResume", param);
	}

	/**
	 * 구직신청 조회
	 * jobseeker view
	 * @param param
	 * @return JobskBean
	 */
	public JobskBean selectJobsk(CondJobskBean param) {
		return getSqlSession().selectOne("jobsk.selectJobsk", param);
	}

}