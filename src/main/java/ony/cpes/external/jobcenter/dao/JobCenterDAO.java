package ony.cpes.external.jobcenter.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.jobcenter.bean.CondJobCenterBean;
import ony.cpes.external.jobcenter.bean.JobCenterBean;


@Repository("JobCenterDAO")
public class JobCenterDAO extends EgovAbstractMapper {

	/**
	 * 잡센터 목록 count
	 * jobcenter list
	 * @param param
	 * @return List<JobCenterBean>
	 */
	public int selectJobCenterListCnt (CondJobCenterBean param) {
		return getSqlSession().selectOne("jobcenter.selectJobCenterListCnt", param);
    }

	/**
	 * 잡센터 목록
	 * jobcenter list
	 * @param param
	 * @return List<JobCenterBean>
	 */
	public List<JobCenterBean> selectJobCenterList (CondJobCenterBean param) {
		return getSqlSession().selectList("jobcenter.selectJobCenterList", param);
    }


	/**
	 * 잡센터 상세
	 * jobcenter view
	 * @param param
	 * @return List<JobCenterBean>
	 */
	public JobCenterBean selectJobCenter (CondJobCenterBean param) {
		return getSqlSession().selectOne("jobcenter.selectJobCenter", param);
    }
}
