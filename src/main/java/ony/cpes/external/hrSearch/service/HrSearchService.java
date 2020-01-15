package ony.cpes.external.hrSearch.service;

import java.util.List;

import ony.cpes.external.hrSearch.bean.HrSearchBean;

public interface HrSearchService {
	public int selectHrSearchResultTotCnt(HrSearchBean param);
	public List<HrSearchBean> selectHrSearchResultList(HrSearchBean param);
}
