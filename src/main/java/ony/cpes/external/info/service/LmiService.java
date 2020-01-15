package ony.cpes.external.info.service;

import java.util.List;

import ony.cpes.external.info.bean.LmiIndicYearBean;

public interface LmiService {

	/**
	 * 년도별 노동시장 지표 조회
	 * @param year
	 * @return
	 * @throws Exception
	 */
	public List<LmiIndicYearBean> selectLmi(String year) throws Exception;

}
