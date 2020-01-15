package ony.cpes.external.member.service;

import ony.cmm.common.bean.CertifyBean;
import ony.cpes.external.member.bean.CompanyBean;
import ony.cpes.external.member.bean.InstitutionBean;
import ony.cpes.external.member.bean.MemberBean;

public interface MemberService {

	/**
	 * 사용자 이메일 중복체크
	 * user email duplication check
	 * @param param
	 * @return int
	 */
	public int selectEmailDupChk(CertifyBean param) throws Exception;


	/**
	 * 사용자 cell phone 중복체크
	 * user cell phone duplication check
	 * @param param
	 * @return int
	 */
	public int selectCellPhoneDupChk(CertifyBean param) throws Exception;


	/**
	 * 사용자 가입 처리
	 * user join process
	 * @param param
	 * @return int
	 */
	public int insertMember(MemberBean param) throws Exception;


	/**
	 * 회사 회원 가입
	 * company join insert
	 * @param param
	 * @return int
	 */
	public int insertCompany(MemberBean param, CompanyBean param2) throws Exception;

	/**
	 * 교육기관 회원 가입
	 * Institution join insert
	 * @param param
	 * @return int
	 */
	public int insertInstitution(MemberBean param, InstitutionBean param2) throws Exception;

}
