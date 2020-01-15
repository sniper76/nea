package ony.cpes.external.eduTrnng.service;


import java.util.List;

import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngFreeBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngNeaBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngSoftSkillBean;

public interface EduTrnngService {

	/**
	 * 교육 프로그램 상세
	 * education tranning detail
	 * @param param
	 * @return EduTrnngBean
	 */
	public EduTrnngBean selectEduTrnng(CondEduTrnngBean param) throws Exception;

	/**
	 * education soft skill detail
	 * @param param
	 * @return EduTrnngBean
	 */
	public EduTrnngSoftSkillBean selectEduTrnngSoftSkill(CondEduTrnngBean param) throws Exception;

	/**
	 * edu training user count
	 * @param param
	 * @return
	 */
	public int selectEduTrnngByTrnngUserCnt(CondEduTrnngBean param) throws Exception;

	public int insertEduTrnngByTrnngUser(EduTrnngBean param) throws Exception;

	/**
	 * 교육 프로그램 목록 count
	 * education tranning list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngListCnt(CondEduTrnngBean param) throws Exception;


	/**
	 * 교육 프로그램 목록
	 * education tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngList(CondEduTrnngBean param) throws Exception;

	/**
	 * education tranning free list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngFreeListCnt(CondEduTrnngFreeBean param) throws Exception;

	/**
	 * education tranning free list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngFreeList(CondEduTrnngFreeBean param) throws Exception;

	/**
	 * education tranning list count by location
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngLocListCnt(CondEduTrnngFreeBean param) throws Exception;

	/**
	 * education tranning list by location
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngLocList(CondEduTrnngFreeBean param) throws Exception;


	/**
	 * 직업훈련 목록 count
	 * nea tranning list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngNeaListCnt(CondEduTrnngFreeBean param) throws Exception;


	/**
	 * 직업훈련 목록
	 * nea tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngNeaBean> selectEduTrnngNeaList(CondEduTrnngFreeBean param) throws Exception;

	public int selectEduTrnngSoftSkillListCnt(CondEduTrnngFreeBean param) throws Exception;

	public List<EduTrnngNeaBean> selectEduTrnngSoftSkillList(CondEduTrnngFreeBean param) throws Exception;
}
