package ony.cpes.external.hrSearch.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cpes.external.hrSearch.bean.HrSearchBean;
import ony.cpes.external.hrSearch.dao.HrSearchDAO;
import ony.cpes.external.hrSearch.service.HrSearchService;

@Service("HrSearchService")
public class HrSearchServiceImpl implements HrSearchService {

	@Autowired
	private HrSearchDAO hrSearchDAO;

	@Override
	public int selectHrSearchResultTotCnt(HrSearchBean param) {
		return hrSearchDAO.selectHrSearchResultTotCnt(param);
	}

	@Override
	public List<HrSearchBean> selectHrSearchResultList(HrSearchBean param) {
		return hrSearchDAO.selectHrSearchResultList(param);
	}

}
