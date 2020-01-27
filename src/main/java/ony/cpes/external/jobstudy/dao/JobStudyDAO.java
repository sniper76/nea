package ony.cpes.external.jobstudy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.jobstudy.bean.CondJobStudyBean;
import ony.cpes.external.jobstudy.bean.JobStudyBean;


@Repository("JobStudyDAO")
public class JobStudyDAO extends EgovAbstractMapper {


	/**
	 * 직업탐구 정보
	 * job study info
	 * @param param
	 * @return JobStudyBean
	 */
	public JobStudyBean selectJobStudy(CondJobStudyBean param) {
		return getSqlSession().selectOne("jobStudy.selectJobStudy", param);
	}


	/**
	 * 직업탐구 1레벨 목록
	 * job study list
	 * @param param
	 * @return List<JobStudyBean>
	 */
	public List<JobStudyBean> selectJobStudyOneLvlList(CondJobStudyBean param) {
		return getSqlSession().selectList("jobStudy.selectJobStudyOneLvlList", param);
    }

	/**
	 * 직업탐구 레벨별 목록
	 * job study list
	 * @param param
	 * @return List<JobStudyBean>
	 */
	public List<JobStudyBean> selectJobStudyLvlList(CondJobStudyBean param) {
		return getSqlSession().selectList("selectJobStudyLvlList", param);
    }


	/**
	 * 직업탐구 풀경로
	 * job study full path
	 * @param param
	 * @return JobStudyBean
	 */
	public JobStudyBean selectJobStudyFullPath(CondJobStudyBean param) {
		return getSqlSession().selectOne("jobStudy.selectJobStudyFullPath", param);
	}


	/**
	 * 직업탐구 검색
	 * job study search
	 * @param param
	 * @return List<JobStudyBean>
	 */
	public List<JobStudyBean> selectJobStudySearchList(CondJobStudyBean param) {
		return getSqlSession().selectList("jobStudy.selectJobStudySearchList", param);
    }

	public List<JobStudyBean> selectJobStudySearch(CondJobStudyBean param) {
		return getSqlSession().selectList("jobStudy.selectJobStudySearch", param);
	}

}
