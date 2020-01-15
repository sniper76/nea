package ony.cpes.external.member.dao;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cmm.common.bean.CertifyBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cpes.external.member.bean.CompanyBean;
import ony.cpes.external.member.bean.InstitutionBean;
import ony.cpes.external.member.bean.MemberBean;




@Repository("MemberDAO")
public class MemberDAO extends EgovAbstractMapper{


	/**
	 * 사용자 이메일 중복체크
	 * user email duplication check
	 * @param param
	 * @return int
	 */
	public int selectEmailDupChk(CertifyBean param) {
        return getSqlSession().selectOne("member.selectEmailDupChk", param);
    }


	/**
	 * 사용자 cell phone 중복체크
	 * user cell phone duplication check
	 * @param param
	 * @return int
	 */
	public int selectCellPhoneDupChk(CertifyBean param) {
        return getSqlSession().selectOne("member.selectCellPhoneDupChk", param);
    }


	/**
	 * 사용자 회원 가입
	 * user join insert
	 * @param param
	 * @return int
	 */
	public int insertMember(MemberBean param) {
        return getSqlSession().insert("setMember.insertMember", param);
    }


	/**
	 * 회사 회원 가입
	 * company join insert
	 * @param param
	 * @return int
	 */
	public int insertCompany(CompanyBean param) {
        return getSqlSession().insert("setMember.insertCompany", param);
    }


	/**
	 * UUID GET
	 * @param param
	 * @return int
	 */
	public String selectUUID(ConditionBean param) {
        return getSqlSession().selectOne("member.selectUUID", param);
    }


	/**
	 * 교육기관 회원 가입
	 * Institution join insert
	 * @param param
	 * @return int
	 */
	public int insertInstitution(InstitutionBean param) {
        return getSqlSession().insert("setMember.insertInstitution", param);
    }
}
