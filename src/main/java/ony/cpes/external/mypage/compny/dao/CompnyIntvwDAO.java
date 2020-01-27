package ony.cpes.external.mypage.compny.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyIntvwBean;
import ony.cpes.external.mypage.compny.bean.VacancyIntvwBean;
import ony.cpes.external.mypage.compny.bean.VideoIntvwPatcptnBean;
import ony.cpes.external.mypage.compny.bean.VideoIntwvHolidayBean;

@Repository("CompnyIntvwDAO")
public class CompnyIntvwDAO extends EgovAbstractMapper {

	/**
	 * 화상면접 총건수
	 * @param param
	 * @return
	 */
	public int selectVacancyIntwvVideoListCnt(CondCompnyIntvwBean param) {
		return getSqlSession().selectOne("compnyIntvw.selectVacancyIntwvVideoListCnt", param);
	}

	/**
	 * 화상면접 목록
	 * @param param
	 * @return
	 */
	public List<VacancyIntvwBean> selectVacancyIntwvVideoList(CondCompnyIntvwBean param) {
		return getSqlSession().selectList("compnyIntvw.selectVacancyIntwvVideoList", param);
	}

	/**
	 * 화상면접신청관리::삭제
	 * @param param
	 * @return
	 */
	public int deleteVacancyIntwvVideo(VacancyIntvwBean param) {
		return getSqlSession().delete("setCompnyIntvw.deleteVacancyIntwvVideo", param);
	}

	/**
	 * 화상면접신청::상세::정보
	 * @param param
	 * @return
	 */
	public VideoIntvwPatcptnBean selectVacancyIntwvVideoPatcptn(Map<String, Object> param) {
		return getSqlSession().selectOne("compnyIntvw.selectVacancyIntwvVideoPatcptn", param);
	}

	/**
	 * 화상면접신청::입력
	 * @param param
	 * @return
	 */
	public int insertVacancyIntwvVideo(VideoIntvwPatcptnBean param) {
		return getSqlSession().insert("setCompnyIntvw.insertVacancyIntwvVideo", param);
	}

	/**
	 * 잡센터의 휴일 목록
	 * @param param
	 * @return
	 */
	public List<String> selectJcHolidayList(Map<String, Object> param) {
		return getSqlSession().selectList("compnyIntvw.selectJcHolidayList", param);
	}

	/**
	 * 화상면접 시간테이블 조회
	 * @param param
	 * @return
	 */
	public List<CommDtlCdBean> selectVacancyIntwvVideoTimeList(VideoIntvwPatcptnBean param) {
		return getSqlSession().selectList("compnyIntvw.selectVacancyIntwvVideoTimeList", param);
	}
}
