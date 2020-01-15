package ony.cpes.external.mypage.instt.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;




@Repository("InsttEduTrnngDAO")
public class InsttEduTrnngDAO  extends EgovAbstractMapper {

	/**
	 * 교육 프로그램 상태별 cnt
	 * education tranning status cnt
	 * @param param
	 * @return EduTrnngBean
	 */
	public EduTrnngBean selectEduTrnngStatCnt(CondEduTrnngBean param) {
		return getSqlSession().selectOne("insttEduTrnng.selectEduTrnngStatCnt", param);
	}

	/**
	 * 교육 프로그램  목록 count
	 * education tranning list count
	 * @param param
	 * @return int
	 */
	public int selectEduTrnngListCnt(CondEduTrnngBean param) {
		return getSqlSession().selectOne("insttEduTrnng.selectEduTrnngListCnt", param);
	}

	/**
	 * 교육 프로그램  목록
	 * education tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngList(CondEduTrnngBean param) {
		return getSqlSession().selectList("insttEduTrnng.selectEduTrnngList", param);
	}

	/**
	 * 교육 프로그램  number
	 * education tranning number
	 * @param param
	 * @return String
	 */
	public String selectEduTrnngNum(CondEduTrnngBean param) {
		return getSqlSession().selectOne("insttEduTrnng.selectEduTrnngNum", param);
	}

	/**
	 * 교육 프로그램  등록
	 * education tranning insert
	 * @param param
	 * @return int
	 */
	public int insertEduTrnng(EduTrnngBean param) {
		return getSqlSession().insert("setInsttEduTrnng.insertEduTrnng", param);
	}


	/**
	 * 교육 프로그램  등록(Sub)
	 * education tranning insert(sub)
	 * @param param
	 * @return int
	 */
	public int insertEduTrnngSub(EduTrnngBean param) {
		return getSqlSession().insert("setInsttEduTrnng.insertEduTrnngSub", param);
	}

	/**
	 * 교육 프로그램  주소 등록
	 * education tranning address insert(sub)
	 * @param param
	 * @return int
	 */
	public int insertEduTrnngAddr(EduTrnngBean param) {
		return getSqlSession().insert("setInsttEduTrnng.insertEduTrnngAddr", param);
	}


	/**
	 * 교육 프로그램 상세
	 * education tranning detail
	 * @param param
	 * @return EduTrnngBean
	 */
	public EduTrnngBean selectEduTrnng(CondEduTrnngBean param) {
		return getSqlSession().selectOne("insttEduTrnng.selectEduTrnng", param);
	}


	/**
	 * 교육 프로그램 주소 목록
	 * education tranning address list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	public List<EduTrnngBean> selectEduTrnngAddrList(CondEduTrnngBean param) {
		return getSqlSession().selectList("insttEduTrnng.selectEduTrnngAddrList", param);
	}



	/**
	 * 교육 프로그램  수정
	 * education tranning update
	 * @param param
	 * @return int
	 */
	public int updateEduTrnng(EduTrnngBean param) {
		return getSqlSession().update("setInsttEduTrnng.updateEduTrnng", param);
	}

	/**
	 * 교육 프로그램  서브 수정
	 * education tranning sub update
	 * @param param
	 * @return int
	 */
	public int updateEduTrnngSub(EduTrnngBean param) {
		return getSqlSession().update("setInsttEduTrnng.updateEduTrnngSub", param);
	}

	/**
	 * 교육 프로그램  주소 삭제
	 * education tranning insert
	 * @param param
	 * @return int
	 */
	public int deleteEduTrnngAddrAll(EduTrnngBean param) {
		return getSqlSession().delete("setInsttEduTrnng.deleteEduTrnngAddrAll", param);
	}


	/**
	 * 교육 프로그램  삭제
	 * education tranning update
	 * @param param
	 * @return int
	 */
	public int deleteEduTrnng(CondEduTrnngBean param) {
		return getSqlSession().update("setInsttEduTrnng.deleteEduTrnng", param);
	}

	/**
	 * 교육 프로그램  마감
	 * education tranning close
	 * @param param
	 * @return int
	 */
	public int updateEduTrnngClose(CondEduTrnngBean param) {
		return getSqlSession().update("setInsttEduTrnng.updateEduTrnngClose", param);
	}

}
