package ony.cpes.external.jobcenter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cpes.external.jobcenter.bean.CondJobCenterBean;
import ony.cpes.external.jobcenter.bean.JobCenterBean;
import ony.cpes.external.jobcenter.dao.JobCenterDAO;
import ony.cpes.external.jobcenter.service.JobCenterService;

@Service("JobCenterService")
public class JobCenterServiceImpl implements JobCenterService {

	@Autowired JobCenterDAO jobcenterDAO;

	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;

	/**
	 * 잡센터 목록 count
	 * jobcenter list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectJobCenterListCnt (CondJobCenterBean param) throws Exception {
    	return jobcenterDAO.selectJobCenterListCnt(param);
    }

	/**
	 * 잡센터 목록
	 * jobcenter list
	 * @param param
	 * @return List<JobCenterBean>
	 */
    @Override
	public List<JobCenterBean> selectJobCenterList (CondJobCenterBean param) throws Exception {
    	return jobcenterDAO.selectJobCenterList(param);
    }


	/**
	 * 잡센터 상세
	 * jobcenter view
	 * @param param
	 * @return List<JobCenterBean>
	 */
    @Override
	public JobCenterBean selectJobCenter (CondJobCenterBean param) throws Exception {
//    	if(!StringUtils.equals(ConstVal.NO_VAL, param.getCondViewCntYn())) {//수정화면에서 조회할경우 조회수 업데이트 하지 않음
//    		jobcenterDAO.updateViewCnt(param);
//    	}
    	return jobcenterDAO.selectJobCenter(param);
    }

}
