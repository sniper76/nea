package ony.cpes.external.eduTrnng.dao;




import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngFreeBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngNeaBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngSoftSkillBean;




@Repository("EduTrnngDAO")
public class EduTrnngDAO  extends EgovAbstractMapper {


	/**
	 * 교육 프로그램 상세
	 * education tranning detail
	 * @param param
	 * @return EduTrnngBean
	 */
	public EduTrnngBean selectEduTrnng(CondEduTrnngBean param) {
		return getSqlSession().selectOne("eduTrnng.selectEduTrnng", param);
	}

	/**
	 * education soft skill detail
	 * @param param
	 * @return EduTrnngBean
	 */
	public EduTrnngSoftSkillBean selectEduTrnngSoftSkill(CondEduTrnngBean param) {
		return getSqlSession().selectOne("eduTrnng.selectEduTrnngSoftSkill", param);
	}

	/**
	 * edu training user count
	 * @param param
	 * @return
	 */
	public int selectEduTrnngByTrnngUserCnt(CondEduTrnngBean param) {
		return getSqlSession().selectOne("eduTrnng.selectEduTrnngByTrnngUserCnt", param);
	}

	public int insertEduTrnngByTrnngUser(EduTrnngBean param) {
		return getSqlSession().insert("setEduTrnng.insertEduTrnngUser", param);
	}

	/**
	 * 교육 프로그램 목록 count
	 * education tranning list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngListCnt(CondEduTrnngBean param) {
		return getSqlSession().selectOne("eduTrnng.selectEduTrnngListCnt", param);
	}


	/**
	 * 교육 프로그램 목록
	 * education tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngList(CondEduTrnngBean param) {
		return getSqlSession().selectList("eduTrnng.selectEduTrnngList", param);
	}

	/**
	 * education tranning free list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngFreeListCnt(CondEduTrnngFreeBean param) {
		return getSqlSession().selectOne("eduTrnng.selectEduTrnngFreeListCnt", param);
	}

	/**
	 * education tranning free list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngFreeList(CondEduTrnngFreeBean param) {
		return getSqlSession().selectList("eduTrnng.selectEduTrnngFreeList", param);
	}

	/**
	 * education tranning list count by location
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngLocListCnt(CondEduTrnngFreeBean param) {
		return getSqlSession().selectOne("eduTrnng.selectEduTrnngFreeListCnt", param);
	}

	/**
	 * education tranning list by location
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngLocList(CondEduTrnngFreeBean param) {
		return getSqlSession().selectList("eduTrnng.selectEduTrnngFreeList", param);
	}


	/**
	 * 직업훈련 목록 count
	 * nea tranning list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngNeaListCnt(CondEduTrnngFreeBean param) {
		return getSqlSession().selectOne("eduTrnng.selectEduTrnngNeaListCnt", param);
	}


	/**
	 * 직업훈련 목록
	 * nea tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngNeaBean> selectEduTrnngNeaList(CondEduTrnngFreeBean param) {
		return getSqlSession().selectList("eduTrnng.selectEduTrnngNeaList", param);
	}

	/**
	 * soft skill tranning list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngSoftSkillListCnt(CondEduTrnngFreeBean param) {
		return getSqlSession().selectOne("eduTrnng.selectEduTrnngSoftSkillListCnt", param);
	}


	/**
	 * soft skill tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngNeaBean> selectEduTrnngSoftSkillList(CondEduTrnngFreeBean param) {
		return getSqlSession().selectList("eduTrnng.selectEduTrnngSoftSkillList", param);
	}

}
