package ony.cpes.external.jobstudy.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.ConstVal;
import ony.cpes.external.jobstudy.bean.CondJobStudyBean;
import ony.cpes.external.jobstudy.bean.JobStudyBean;
import ony.cpes.external.jobstudy.dao.JobStudyDAO;
import ony.cpes.external.jobstudy.service.JobStudyService;
import ony.framework.util.StringUtil;

@Service("JobStudyService")
public class JobStudyServiceImpl implements JobStudyService {

	@Autowired JobStudyDAO jobStudyDAO;

	/**
	 * 직업탐구 1레벨 목록
	 * job study info
	 * @param param
	 * @return JobStudyBean
	 */
	public List<JobStudyBean> selectJobStudyOneLvlList(CondJobStudyBean param) throws Exception {

		/*if(!StringUtil.isEmpty(param.getCondText())) {
			List<JobStudyBean> list = jobStudyDAO.selectJobStudySearchList(param);
			if(!CollectionUtils.isEmpty(list)) {
				ArrayList<String> condList = new ArrayList<String>();
				for(JobStudyBean jobStudyBean: list) {
					condList.add(jobStudyBean.getIscoId());
				}
				param.setCondList(condList);

				return jobStudyDAO.selectJobStudyOneLvlList(param);
			}

		} else {
			return jobStudyDAO.selectJobStudyOneLvlList(param);
		}*/

		return jobStudyDAO.selectJobStudyOneLvlList(param);

	}


	/**
	 * 직업탐구 레벨별 목록
	 * job study info
	 * @param param
	 * @return JobStudyBean
	 */
	public List<JobStudyBean> selectJobStudyLvlList(CondJobStudyBean param) throws Exception {
		return jobStudyDAO.selectJobStudyLvlList(param);
	}


	/**
	 * 직업탐구 정보 상세
	 * job study info
	 * @param param
	 * @return JobStudyBean
	 */
	public JobStudyBean selectJobStudy(CondJobStudyBean param)  throws Exception {
		JobStudyBean jobStudyBean = jobStudyDAO.selectJobStudy(param);

		if(!StringUtil.isEmpty(jobStudyBean) && !StringUtil.isEmpty(jobStudyBean.getCdLvl())) {
			String[] strArr = jobStudyBean.getCdLvl().split(ConstVal.ISCD_DIV_VAL);
			ArrayList<String> condList = new ArrayList<String>();
			for(String str: strArr) {
				condList.add(str);
			}
			param.setCondList(condList);

			JobStudyBean jobStudyBean2 = jobStudyDAO.selectJobStudyFullPath(param);
			if(!StringUtil.isEmpty(jobStudyBean2) && !StringUtil.isEmpty(jobStudyBean2.getFullPath())) {
				jobStudyBean.setFullPath(jobStudyBean2.getFullPath());
			}

		}

		return jobStudyBean;
	}


	@Override
	public JobStudyBean selectJobStudySearch(CondJobStudyBean param) throws Exception {
		JobStudyBean resultBean = new JobStudyBean();
		List<JobStudyBean> resultList = jobStudyDAO.selectJobStudySearch(param);

		resultBean.setTotCnt(resultList.size());
		resultBean.setList(resultList);

		return resultBean;
	}

}
