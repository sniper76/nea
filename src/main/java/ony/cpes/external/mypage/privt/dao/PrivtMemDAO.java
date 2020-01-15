package ony.cpes.external.mypage.privt.dao;



import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.CondPrivtMemBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemChgBean;


@Repository("PrivtMemDAO")
public class PrivtMemDAO  extends EgovAbstractMapper {
	/**
	 * 개인정보 조회
	 * private member info
	 * @param param
	 * @return PrivtMemBean
	 */
	public PrivtMemBean selectMember(CondPrivtMemBean param) {
		return getSqlSession().selectOne("privtMem.selectMember", param);
	}

	/**
	 * 개인정보 저장
	 * private member update
	 * @param param
	 * @return int
	 */
	public int updateMember(PrivtMemBean param) {
		return getSqlSession().update("setPrivtMem.updateMember", param);
	}

	/**
	 * 비밀번호 체크
	 * pwd check
	 * @param param
	 * @return int
	 */
	public int selectPrivtMemberPwdChk(PrivtMemBean param) {
		return getSqlSession().selectOne("privtMem.selectPrivtMemberPwdChk", param);
	}


	/**
	 * 개인정보 조회
	 * private member info
	 * @param param
	 * @return PrivtMemBean
	 */
	public PrivtMemBean selectPwd(PrivtMemBean param) {
		return getSqlSession().selectOne("privtMem.selectPwd", param);
	}


	/**
	 * 비밀번호 수정
	 * pwd update
	 * @param param
	 * @return PrivtMemBean
	 */
	public int updatePwd(PrivtMemBean param) {
		return getSqlSession().update("setPrivtMem.updatePwd", param);
	}


	/**
	 * 회원탈퇴
	 * member delete
	 * @param param
	 * @return PrivtMemBean
	 */
	public int deleteMember(PrivtMemBean param) {
		return getSqlSession().update("setPrivtMem.deleteMember", param);
	}


	/**
	 * 회원변경 신청 조회
	 * private member type change info
	 * @param param
	 * @return PrivtMemChgBean
	 */
	public PrivtMemChgBean selectMemberChg(CondPrivtMemBean param) {
		return getSqlSession().selectOne("privtMem.selectMemberChg", param);
	}

	/**
	 * 회원타입 변경 입력
	 * member type change insert
	 * @param param
	 * @return int
	 */
	public int insertMemberTypeChange(PrivtMemChgBean param) {
		return getSqlSession().insert("setPrivtMem.insertMemberTypeChange", param);
	}

	/**
	 * 회원탈퇴
	 * member delete
	 * @param param
	 * @return PrivtMemBean
	 */
	public int deleteCompany(PrivtMemBean param) {
		return getSqlSession().update("setPrivtMem.deleteCompany", param);
	}

	/**
	 * 회원탈퇴
	 * member delete
	 * @param param
	 * @return PrivtMemBean
	 */
	public int deleteInstt(PrivtMemBean param) {
		return getSqlSession().update("setPrivtMem.deleteInstt", param);
	}

	/**
	 * select application summary by status
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectApplicSmry2(Map<String, Object> param) {
		return getSqlSession().selectOne("privtMem.selectApplicSmry2", param);
	}

}
