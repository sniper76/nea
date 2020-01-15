package ony.cpes.external.counsel.service;

import java.util.List;

import ony.cpes.external.counsel.bean.CondCounselBean;
import ony.cpes.external.counsel.bean.CounselBean;

public interface CounselService {


	/**
	 * 상담 등록
	 * counsel insert
	 * @param param
	 * @return int
	 */
	public int insertCounsel(CounselBean param) throws Exception;



	/**
	 * 상담 목록 count
	 * counsel list count
	 * @param param
	 * @return int
	 */
	public int selectCounselListCnt (CondCounselBean param) throws Exception;



	/**
	 * 상담 목록
	 * counsel list
	 * @param param
	 * @return List<CounselBean>
	 */
	public List<CounselBean> selectCounselList (CondCounselBean param) throws Exception;


	/**
	 * 상담 상세
	 * counsel detail view
	 * @param param
	 * @return CounselBean
	 */
	public CounselBean selectCounsel (CondCounselBean param) throws Exception;


	/**
	 * 상담 삭제
	 * counsel delete
	 * @param param
	 * @return int
	 */
	public int deleteCounsel(CondCounselBean param) throws Exception;



	/**
	 * 상담 수정
	 * counsel update
	 * @param param
	 * @return int
	 */
	public int updateCounsel(CounselBean param) throws Exception;
}
