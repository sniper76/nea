package ony.cpes.external.info.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.info.bean.LmiIndicYearBean;

@Repository("LmiDAO")
public class LmiDAO extends EgovAbstractMapper {

	/**
	 * 노동시장 지표 조회
	 * @param param
	 * @return
	 */
	public List<LmiIndicYearBean> selectLmi(Map<String, Object> param) {
		return getSqlSession().selectList("lmi.selectLmi", param);
	}

}
