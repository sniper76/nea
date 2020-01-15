package ony.cpes.external.member.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cmm.common.bean.CertifyBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cpes.external.member.bean.CompanyBean;
import ony.cpes.external.member.bean.InstitutionBean;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.member.dao.MemberDAO;
import ony.cpes.external.member.service.MemberService;
import ony.cpes.external.user.bean.UserBean;

@Service("MemberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;


	/**
	 * 사용자 이메일 중복체크
	 * user email duplication check
	 * @param param
	 * @return int
	 */
    @Override
	public int selectEmailDupChk(CertifyBean param) throws Exception {
		return memberDAO.selectEmailDupChk(param);
	}


	/**
	 * 사용자 cell phone 중복체크
	 * user cell phone duplication check
	 * @param param
	 * @return int
	 */
    @Override
	public int selectCellPhoneDupChk(CertifyBean param) throws Exception {
		return memberDAO.selectCellPhoneDupChk(param);
	}


	/**
	 * 사용자 가입 처리
	 * user join process
	 * @param param
	 * @return int
	 */
    @Override
	public int insertMember(MemberBean param) throws Exception {
    	String uuid =  memberDAO.selectUUID(null);
    	param.setUserSeq(uuid);
    	return memberDAO.insertMember(param);
	}

	/**
	 * 회사 회원 가입
	 * company join insert
	 * @param param
	 * @return int
	 */
    @Override
	public int insertCompany(MemberBean param, CompanyBean param2) throws Exception {
    	String uuid =  memberDAO.selectUUID(null);
    	param.setUserSeq(uuid);
    	param2.setUserSeq(uuid);

    	int cnt2 = memberDAO.insertMember(param);
		int cnt3 = memberDAO.insertCompany(param2);

		return cnt2+cnt3;
	}


	/**
	 * 교육기관 회원 가입
	 * Institution join insert
	 * @param param
	 * @return int
	 */
	public int insertInstitution(MemberBean param, InstitutionBean param2) throws Exception {
	  	String uuid =  memberDAO.selectUUID(null);
    	param.setUserSeq(uuid);
    	param2.setUserSeq(uuid);

    	int cnt2 = memberDAO.insertMember(param);
		int cnt3 = memberDAO.insertInstitution(param2);

		return cnt2+cnt3;
	}

}
