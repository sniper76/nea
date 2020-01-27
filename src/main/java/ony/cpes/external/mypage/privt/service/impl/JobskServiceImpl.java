package ony.cpes.external.mypage.privt.service.impl;


import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.ConstVal;
import ony.cpes.external.mypage.privt.bean.CondJobskBean;
import ony.cpes.external.mypage.privt.bean.JobskBean;
import ony.cpes.external.mypage.privt.dao.JobskDAO;
import ony.cpes.external.mypage.privt.service.JobskService;
import ony.framework.util.StringUtil;

@Service("JobskService")
public class JobskServiceImpl implements JobskService {
	@Autowired
	private JobskDAO jobskDAO;

	/**
	 * 구직신청 조회
	 * jobseeker view
	 * @param param
	 * @return JobskBean
	 */
	@Override
	public JobskBean selectJobskYn(CondJobskBean param) throws Exception {
		return jobskDAO.selectJobskYn(param);
	}

	/**
	 * 비구직으로 변경
	 * not jobseerker
	 * @param param
	 * @return int
	 */
	@Override
	public int updateCloseJobsk(CondJobskBean param)  throws Exception {
		int result = 0;

		JobskBean condJobskBean = jobskDAO.selectPriResume(param);
		if(StringUtil.isEmpty(condJobskBean)) {
			return 0;
		}
		param.setCondSeq(condJobskBean.getResumeSeq());

		result += jobskDAO.updateCancelJobskReq(param);
		result += jobskDAO.updateResumeJobskYn(param);

		param.setCondStatCd(ConstVal.JOBSK_STS_CD_CANCEL_VAL);
		result += jobskDAO.updateUserJobskYn(param);

		return result;
	}

	/**
	 * 대표이력서 조회
	 * primary resume
	 * @param param
	 * @return JobskBean
	 */
	@Override
	public JobskBean selectPriResume(CondJobskBean param) throws Exception {
		return jobskDAO.selectPriResume(param);
	}

	/**
	 * 구직신청 등록
	 * jobseeker insert
	 * @param param
	 * @return int
	 */
	@Override
	public int insertJobsk(JobskBean param) throws Exception {
		int result = 0;
		if(jobskDAO.updateJobskResume(param) > 0) {
			param.setJobskNum(jobskDAO.selectJobskNum(param));
			result = jobskDAO.insertJobsk(param);

			CondJobskBean condJobskBean = new CondJobskBean();
			condJobskBean.setCondStatCd("JSC0000000002");
			condJobskBean.setModUserSeq(param.getModUserSeq());
			condJobskBean.setCondSeq(param.getModUserSeq());
			condJobskBean.setCondUserSeq(param.getModUserSeq());
			result += jobskDAO.updateUserJobskYn(condJobskBean);
		}

		return result;
	}

	/**
	 * 구직신청 목록 조회
	 * jobseeker list
	 * @param param
	 * @return List<JobskBean>
	 */
	@Override
	public List<JobskBean> selectJobskList(CondJobskBean param) throws Exception {
		return jobskDAO.selectJobskList(param);
	}

	/**
	 * 구직신청 삭제
	 * jobseeker delete
	 * @param param
	 * @return int
	 */
	@Override
	public int deleteJobsk(CondJobskBean param) throws Exception {
		int result = jobskDAO.deleteJobsk(param);
		if(result > 0) {
			param.setCondStatCd(ConstVal.JOBSK_STS_CD_CANCEL_VAL);
			result += jobskDAO.updateUserJobskYn(param);
		}
		return result;
	}

	/**
	 * 알선 신청
	 * jobseeker update
	 * @param param
	 * @return int
	 */
	@Override
	public int updateUrgencyResume(CondJobskBean param) throws Exception {
		return jobskDAO.updateUrgencyResume(param);
	}


	/**
	 * 구직신청 상세
	 * jobseeker view
	 * @param param
	 * @return JobskBean
	 */
	@Override
	public JobskBean selectJobsk(CondJobskBean param) throws Exception {
		return jobskDAO.selectJobsk(param);
	}
}
