package ony.cpes.external.mypage.privt.service;


import java.util.Map;

import ony.cpes.external.mypage.privt.bean.CondPrivtMemBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemChgBean;

public interface PrivtMemService {
	/**
	 * 개인정보 조회
	 * private member view
	 * @param param
	 * @return PrivtMemBean
	 */
	public PrivtMemBean selectPrivtMember(CondPrivtMemBean param) throws Exception;

	/**
	 * 개인정보 저장
	 * private member update
	 * @param param
	 * @return int
	 */
	public int updatePrivtMember(PrivtMemBean param) throws Exception;


	/**
	 * 비밀번호 체크
	 * pwd check
	 * @param param
	 * @return int
	 */
	public int selectPrivtMemberPwdChk(PrivtMemBean param) throws Exception;


	/**
	 * 개인정보 조회
	 * private member info
	 * @param param
	 * @return PrivtMemBean
	 */
	public PrivtMemBean selectPwd(PrivtMemBean param) throws Exception;

	/**
	 * 비밀번호 수정
	 * pwd update
	 * @param param
	 * @return PrivtMemBean
	 */
	public int updatePwd(PrivtMemBean param) throws Exception;


	/**
	 * 회원탈퇴
	 * member delete
	 * @param param
	 * @return PrivtMemBean
	 */
	public int deleteMember(PrivtMemBean param) throws Exception;


	/**
	 * 회원변경 신청 조회
	 * private member type change info
	 * @param param
	 * @return PrivtMemChgBean
	 */
	public PrivtMemChgBean selectMemberChg(CondPrivtMemBean param) throws Exception;

	/**
	 * 회원타입 변경 입력
	 * member type change insert
	 * @param param
	 * @return PrivtMemChgBean
	 */
	public PrivtMemChgBean insertMemberTypeChange(PrivtMemChgBean param) throws Exception;

	/**
	 * select application summary by status
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectApplicSmry2(String userSeq) throws Exception;

}
