package ony.cpes.external.compny.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.compny.bean.CondCompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.bean.CompnyMemBean;

@Repository("CompnyDAO")
public class CompnyDAO  extends EgovAbstractMapper {
	/**
	 * 기업정보 조회
	 * company member info
	 * @param param
	 * @return CompnyMemBean
	 */
	public CompnyMemBean selectCompnyInfo(CondCompnyMemBean param) {
		return getSqlSession().selectOne("compny.selectCompnyInfo", param);
	}


	/**
	 * 구인 목록 조회 count
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
	public int selectVacancyContinueListCnt(CondVacancyBean param) {
		return  getSqlSession().selectOne("compny.selectVacancyContinueListCnt", param);
	}

	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancyContinueList(CondVacancyBean param) {
		return getSqlSession().selectList("compny.selectVacancyContinueList", param);
	}

	/**
	 * Company information by user
	 * @param userSeq
	 * @return
	 */
	public CompnyMemBean selectCompnyByUserSeq(String userSeq, String langCd) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userSeq", userSeq);
		param.put("langCd", langCd);
		return getSqlSession().selectOne("compny.selectCompnyByUserSeq", param);
	}

}
