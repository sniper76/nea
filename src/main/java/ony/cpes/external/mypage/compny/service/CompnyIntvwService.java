package ony.cpes.external.mypage.compny.service;

import java.util.List;

import ony.cmm.common.bean.CommDtlCdBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyIntvwBean;
import ony.cpes.external.mypage.compny.bean.VacancyIntvwBean;
import ony.cpes.external.mypage.compny.bean.VideoIntvwPatcptnBean;

public interface CompnyIntvwService {

	/**
	 * 화상면접 총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectVacancyIntwvVideoListCnt(CondCompnyIntvwBean param) throws Exception;

	/**
	 * 화상면접 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<VacancyIntvwBean> selectVacancyIntwvVideoList(CondCompnyIntvwBean param) throws Exception;

	/**
	 * 화상면접
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteVacancyIntwvVideo(VacancyIntvwBean param) throws Exception;

	/**
	 * 화상면접 신청 저장
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int insertVacancyIntwvVideo(VideoIntvwPatcptnBean param) throws Exception;

	/**
	 * 화상면접 신청 정보
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public VideoIntvwPatcptnBean selectVacancyIntwvVideoPatcptn(String videoIntvwPatcptnSeq, String langCd) throws Exception;

	/**
	 * 잡센터의 휴일 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<String> selectJcHolidayList(String jcCd) throws Exception;

	/**
	 * 화상면접 시간테이블 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<CommDtlCdBean> selectVacancyIntwvVideoTimeList(VideoIntvwPatcptnBean param) throws Exception;

}
