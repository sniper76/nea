package ony.cpes.external.jobfair.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

import ony.cpes.external.jobfair.bean.CondJobFairCenterBean;
import ony.cpes.external.jobfair.bean.JobFairCenterBean;
import ony.cpes.external.mypage.privt.bean.InterestBean;

@Repository("JobFairDAO")
public class JobFairDAO extends EgovAbstractMapper {

	/**
	 * jobFair list count
	 * @param param
	 * @return int
	 */
	public int selectJobFairListCnt (CondJobFairCenterBean param) {
		return getSqlSession().selectOne("jobfair.selectJobFairListCnt", param);
    }

	/**
	 * jobFair list
	 * @param param
	 * @return List<JobFairCenterBean>
	 */
	public List<JobFairCenterBean> selectJobFairList (CondJobFairCenterBean param) {
		return getSqlSession().selectList("jobfair.selectJobFairList", param);
    }

	/**
	 * jobFair detail
	 * @param param
	 * @return JobFairCenterBean
	 */
	public JobFairCenterBean selectJobFairInfo (CondJobFairCenterBean param) {
		return getSqlSession().selectOne("jobfair.selectJobFairInfo", param);
	}

	/**
	 * jobFair detail employers count
	 * @param param
	 * @return int
	 */
	public int selectJobFairByEmployersCnt (CondJobFairCenterBean param) {
		return getSqlSession().selectOne("jobfair.selectJobFairByEmployersCnt", param);
    }

	/**
	 * jobFair detail by employers
	 * @param param
	 * @return List<InterestBean>
	 */
	public List<InterestBean> selectJobFairByEmployers (CondJobFairCenterBean param) {
		return getSqlSession().selectList("jobfair.selectJobFairByEmployers", param);
	}

	/**
	 * jobFair detail vacancys count
	 * @param param
	 * @return int
	 */
	public int selectJobFairByVacancysCnt (CondJobFairCenterBean param) {
		return getSqlSession().selectOne("jobfair.selectJobFairByVacancysCnt", param);
	}

	/**
	 * jobFair detail by vacancys
	 * @param param
	 * @return List<CompanyBean>
	 */
	public List<InterestBean> selectJobFairByVacancys (CondJobFairCenterBean param) {
		return getSqlSession().selectList("jobfair.selectJobFairByVacancys", param);
	}

	/**
	 * jobFair detail edu instts count
	 * @param param
	 * @return int
	 */
	public int selectJobFairByEduInsttsCnt (CondJobFairCenterBean param) {
		return getSqlSession().selectOne("jobfair.selectJobFairByEduInsttsCnt", param);
	}

	/**
	 * jobFair detail by edu instts
	 * @param param
	 * @return List<CompanyBean>
	 */
	public List<InterestBean> selectJobFairByEduInstts (CondJobFairCenterBean param) {
		return getSqlSession().selectList("jobfair.selectJobFairByEduInstts", param);
	}


	/**
	 * jobFair apply list count
	 * @param param
	 * @return int
	 */
	public int selectJobFairApplyListCnt (CondJobFairCenterBean param) {
		return getSqlSession().selectOne("jobfair.selectJobFairApplyListCnt", param);
    }

	/**
	 * jobFair apply list
	 * @param param
	 * @return List<JobFairCenterBean>
	 */
	public List<JobFairCenterBean> selectJobFairApplyList (CondJobFairCenterBean param) {
		return getSqlSession().selectList("jobfair.selectJobFairApplyList", param);
    }

	/**
	 * jobFair apply detail
	 * @param param
	 * @return JobFairCenterBean
	 */
	public JobFairCenterBean selectJobFairApplyInfo (CondJobFairCenterBean param) {
		return getSqlSession().selectOne("jobfair.selectJobFairApplyInfo", param);
	}

	/**
	 * Job Fair Count by period
	 * @param param
	 * @return
	 */
	public int selectJobFairTermCnt(Map<String, Object> param) {
		return getSqlSession().selectOne("jobfair.selectJobFairTermCnt", param);
	}

	/**
	 * Job Fair List by period
	 * @param param
	 * @return
	 */
	public List<JobFairCenterBean> selectJobFairTermList(Map<String, Object> param) {
		return getSqlSession().selectList("jobfair.selectJobFairTermList", param);
    }

}
