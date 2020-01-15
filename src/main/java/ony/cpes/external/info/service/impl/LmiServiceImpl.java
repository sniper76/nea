package ony.cpes.external.info.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cpes.external.info.bean.LmiIndicYearBean;
import ony.cpes.external.info.dao.LmiDAO;
import ony.cpes.external.info.service.LmiService;

@Service("LmiService")
public class LmiServiceImpl implements LmiService {

	@Autowired
	private LmiDAO lmiDAO;

	/**
	 * 년도별 노동시장 지표 조회
	 * @param year
	 * @return
	 * @throws Exception
	 */
	public List<LmiIndicYearBean> selectLmi(String year) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("year", year);

		return lmiDAO.selectLmi(param);
	}

}
