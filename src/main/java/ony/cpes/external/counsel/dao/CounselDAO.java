package ony.cpes.external.counsel.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.counsel.bean.CondCounselBean;
import ony.cpes.external.counsel.bean.CounselBean;




@Repository("CounselDAO")
public class CounselDAO extends EgovAbstractMapper{

	/**
	 * 상담 저장
	 * counsel insert
	 * @param param
	 * @return int
	 */
	public int insertCounsel(CounselBean param) {
        return getSqlSession().insert("setCounsel.insertCounsel", param);
    }



	/**
	 * 상담 목록 count
	 * counsel list count
	 * @param param
	 * @return int
	 */
	public int selectCounselListCnt (CondCounselBean param) {
        return getSqlSession().selectOne("counsel.selectCounselListCnt", param);
    }

	/**
	 * 상담 목록
	 * counsel list
	 * @param param
	 * @return List<CounselBean>
	 */
	public List<CounselBean> selectCounselList (CondCounselBean param) {
        return getSqlSession().selectList("counsel.selectCounselList", param);
    }


	/**
	 * 상담 상세
	 * counsel detail view
	 * @param param
	 * @return CounselBean
	 */
	public CounselBean selectCounsel (CondCounselBean param) {
        return getSqlSession().selectOne("counsel.selectCounsel", param);
    }

	/**
	 * 상담 조회수 수정
	 * counsel hit count update
	 * @param param
	 * @return int
	 */
	public int updateViewCnt(CondCounselBean param) {
        return getSqlSession().update("setCounsel.updateViewCnt", param);
    }

	/**
	 * 상담 삭제
	 * counsel delete
	 * @param param
	 * @return int
	 */
	public int deleteCounsel(CondCounselBean param) {
        return getSqlSession().update("setCounsel.deleteCounsel", param);
    }


	/**
	 * 상담 수정
	 * counsel update
	 * @param param
	 * @return int
	 */
	public int updateCounsel(CounselBean param) {
        return getSqlSession().update("setCounsel.updateCounsel", param);
    }

}
