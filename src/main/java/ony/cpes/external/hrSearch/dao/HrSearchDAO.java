package ony.cpes.external.hrSearch.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.hrSearch.bean.HrSearchBean;

@Repository("HrSearchDAO")
public class HrSearchDAO extends EgovAbstractMapper {

	public int selectHrSearchResultTotCnt(HrSearchBean param) {
		return getSqlSession().selectOne("hrSearch.selectHrSearchResultTotCnt", param);
	}

	public List<HrSearchBean> selectHrSearchResultList(HrSearchBean param){
		return getSqlSession().selectList("hrSearch.selectHrSearchResultList", param);
	}

}
