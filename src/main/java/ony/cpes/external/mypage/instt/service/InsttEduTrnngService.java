package ony.cpes.external.mypage.instt.service;

import java.util.List;

import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;

public interface InsttEduTrnngService {


	/**
	 * 교육 프로그램  상태별 cnt
	 * education tranning status cnt
	 * @param param
	 * @return EduTrnngBean
	 */
	public EduTrnngBean selectEduTrnngStatCnt(CondEduTrnngBean param) throws Exception;

	/**
	 * 교육 프로그램  목록 count
	 * education tranning list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngListCnt(CondEduTrnngBean param) throws Exception;

	/**
	 * 교육 프로그램  목록
	 * education tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngList(CondEduTrnngBean param) throws Exception;


	/**
	 * 교육 프로그램  등록
	 * education tranning insert
	 * @param param
	 * @return int
	 */
	public int insertEduTrnng(EduTrnngBean param) throws Exception;


	/**
	 * 교육 프로그램 상세
	 * education tranning detail
	 * @param param
	 * @return EduTrnngBean
	 */
	public EduTrnngBean selectEduTrnng(CondEduTrnngBean param) throws Exception;


	/**
	 * 교육 프로그램 주소 목록
	 * education tranning address list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngAddrList(CondEduTrnngBean param) throws Exception;



	/**
	 * 교육 프로그램  수정
	 * education tranning update
	 * @param param
	 * @return int
	 */
	public int updateEduTrnng(EduTrnngBean param) throws Exception;


	/**
	 * 교육 프로그램  삭제
	 * education tranning delete
	 * @param param
	 * @return int
	 */
	public int deleteEduTrnng(CondEduTrnngBean param) throws Exception;


	/**
	 * 교육 프로그램  마감
	 * education tranning close
	 * @param param
	 * @return int
	 */
	public int updateEduTrnngClose(CondEduTrnngBean param) throws Exception;
}
