package ony.cpes.external.mypage.privt.service.impl;


import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.ConstVal;
import ony.cpes.external.member.dao.MemberDAO;
import ony.cpes.external.mypage.privt.bean.CondPrivtMemBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemBean;
import ony.cpes.external.mypage.privt.bean.PrivtMemChgBean;
import ony.cpes.external.mypage.privt.dao.PrivtMemDAO;
import ony.cpes.external.mypage.privt.service.PrivtMemService;


@Service("PrivtMemService")
public class PrivtMemServiceImpl implements PrivtMemService {
	@Autowired
	private PrivtMemDAO privtMemDAO;

	@Autowired
	private MemberDAO memberDAO;

	/**
	 * 개인정보 조회
	 * private member view
	 * @param param
	 * @return PrivtMemBean
	 */
	@Override
	public PrivtMemBean selectPrivtMember(CondPrivtMemBean param) throws Exception {
		return privtMemDAO.selectMember(param);
	}


	/**
	 * 개인정보 저장
	 * private member update
	 * @param param
	 * @return int
	 */
	@Override
	public int updatePrivtMember(PrivtMemBean param) throws Exception {
		return privtMemDAO.updateMember(param);
	}


	/**
	 * 비밀번호 체크
	 * pwd check
	 * @param param
	 * @return int
	 */
	@Override
	public int selectPrivtMemberPwdChk(PrivtMemBean param) throws Exception {
		return privtMemDAO.selectPrivtMemberPwdChk(param);
	}

	/**
	 * 개인정보 조회
	 * private member info
	 * @param param
	 * @return PrivtMemBean
	 */
	@Override
	public PrivtMemBean selectPwd(PrivtMemBean param) throws Exception {
		return privtMemDAO.selectPwd(param);
	}


	/**
	 * 비밀번호 수정
	 * pwd update
	 * @param param
	 * @return PrivtMemBean
	 */
	@Override
	public int updatePwd(PrivtMemBean param) throws Exception {
		return privtMemDAO.updatePwd(param);
	}


	/**
	 * 회원탈퇴
	 * member delete
	 * @param param
	 * @return PrivtMemBean
	 */
	@Override
	public int deleteMember(PrivtMemBean param) throws Exception {
		int result = 0;

 		result = privtMemDAO.deleteMember(param);

 		if(result > 0) {
 			if(StringUtils.equals(ConstVal.ROLE_CMPNY_VAL, param.getUserAuthCd())) {//기업,comany
 				privtMemDAO.deleteCompany(param);
 	  		} else if(StringUtils.equals(ConstVal.ROLE_TRNCT_VAL, param.getUserAuthCd())) {//교육기관,eduction
 	  			privtMemDAO.deleteInstt(param);
 	  		}
 		}

 		return result;
	}


	/**
	 * 회원변경 신청 조회
	 * private member type change info
	 * @param param
	 * @return PrivtMemChgBean
	 */
	@Override
	public PrivtMemChgBean selectMemberChg(CondPrivtMemBean param) throws Exception {
		return privtMemDAO.selectMemberChg(param);
	}


	/**
	 * 회원타입 변경 입력
	 * member type change insert
	 * @param param
	 * @return PrivtMemChgBean
	 */
	@Override
	public PrivtMemChgBean insertMemberTypeChange(PrivtMemChgBean param) throws Exception {
		String uuid =  memberDAO.selectUUID(null);
		param.setUserChgSeq(uuid);
		if(privtMemDAO.insertMemberTypeChange(param) < 1) {
			return null;
		}

		CondPrivtMemBean condPrivtMemBean = new CondPrivtMemBean();
		condPrivtMemBean.setCondSeq(uuid);
		condPrivtMemBean.setLangCd(param.getLangCd());
		PrivtMemChgBean result = privtMemDAO.selectMemberChg(condPrivtMemBean);
		return result;
	}

	/**
	 * select application summary by status
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectApplicSmry2(String userSeq) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("userSeq", userSeq);
		return privtMemDAO.selectApplicSmry2(param);
	}

}
