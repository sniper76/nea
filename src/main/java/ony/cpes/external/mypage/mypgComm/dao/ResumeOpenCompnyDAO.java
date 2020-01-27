package ony.cpes.external.mypage.mypgComm.dao;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.mypage.privt.bean.ResumeOpenCompnyBean;

@Repository("ResumeOpenCompnyDAO")
public class ResumeOpenCompnyDAO extends EgovAbstractMapper{

	public int insertResumeOpenCompny(ResumeOpenCompnyBean param) {
		return getSqlSession().insert("setMypgComm.insertResumeOpenCompny", param);
	}

	public String selectResumeOpenCompanyCnt(ResumeBean param) {
		return getSqlSession().selectOne("mypgComm.selectResumeOpenCompanyCnt", param);
	}

	public int updateResumeOpenCompany(ResumeOpenCompnyBean param) {
		return getSqlSession().update("setMypgComm.updateResumeOpenCompany", param);
	}

}
