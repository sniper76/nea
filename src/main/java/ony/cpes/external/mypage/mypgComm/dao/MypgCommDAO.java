package ony.cpes.external.mypage.mypgComm.dao;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;

@Repository("MypgCommDAO")
public class MypgCommDAO extends EgovAbstractMapper {

	public ApplicBean selectResumeApplic(ResumeBean param) {
		return getSqlSession().selectOne("mypgComm.selectResumeApplic", param);
	}

	public IntvwBean selectResumeIntvw(ResumeBean param) {
		return getSqlSession().selectOne("mypgComm.selectResumeIntvw", param);
	}

	public OfferBean selectResumeOffer(ResumeBean param) {
		return getSqlSession().selectOne("mypgComm.selectResumeOffer", param);
	}

	public int selectVacancycheck(ResumeBean param) {
		return getSqlSession().selectOne("mypgComm.selectVacancycheck", param);
	}
}
