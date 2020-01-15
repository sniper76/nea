package ony.cpes.external.mypage.instt.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.instt.bean.CondInsttMemBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngHistBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;


@Repository("InsttMemDAO")
public class InsttMemDAO  extends EgovAbstractMapper {
	/**
	 * 교육기관정보 조회
	 * education member info
	 * @param param
	 * @return PrivtMemBean
	 */
	public InsttMemBean selectMember(CondInsttMemBean param) {
		return getSqlSession().selectOne("insttMem.selectMember", param);
	}

	/**
	 * 교육기관정보 저장
	 * education member update
	 * @param param
	 * @return int
	 */
	public int updateMember(InsttMemBean param) {
		return getSqlSession().update("setInsttMem.updateMember", param);
	}

	/**
	 * 교육훈련 이력 목록 조회
	 * education history list
	 * @param param
	 * @return List<EduTrnngHistBean>
	 */
	public List<EduTrnngHistBean> selectEduTrnngHistList(CondInsttMemBean param) {
		return getSqlSession().selectList("insttMem.selectEduTrnngHistList", param);
	}

	/**
	 * 교육기관정보 프로파일 수정
	 * education profile update
	 * @param param
	 * @return int
	 */
	public int updateProfile(InsttMemBean param) {
		return getSqlSession().update("setInsttMem.updateProfile", param);
	}


	/**
	 * 교육훈련 이력 등록
	 * education history insert
	 * @param param
	 * @return int
	 */
	public int insertEduTrnngHist(EduTrnngHistBean param) {
		return getSqlSession().insert("setInsttMem.insertEduTrnngHist", param);
	}


	/**
	 * 교육훈련 이력 삭제
	 * education history delete
	 * @param param
	 * @return int
	 */
	public int deleteEduTrnngHist(EduTrnngHistBean param) {
		return getSqlSession().delete("setInsttMem.deleteEduTrnngHist", param);
	}

	public int updateInsttLogoImg(InsttMemBean param) {
		return getSqlSession().update("setInsttMem.updateInsttLogoImg", param);
	}
}
