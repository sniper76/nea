package ony.cpes.external.mypage.mypgComm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cpes.external.mypage.mypgComm.dao.MypgCommDAO;
import ony.cpes.external.mypage.mypgComm.service.MypgCommService;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;

@Service("MypgCommService")
public class MypgCommServiceImpl implements MypgCommService {

	@Autowired
	private MypgCommDAO mypgCommDAO;

	@Override
	public ApplicBean selectResumeApplic(ResumeBean param) {
		return mypgCommDAO.selectResumeApplic(param);
	}

	@Override
	public IntvwBean selectResumeIntvw(ResumeBean param) {
		return mypgCommDAO.selectResumeIntvw(param);
	}

	@Override
	public OfferBean selectResumeOffer(ResumeBean param) {
		return mypgCommDAO.selectResumeOffer(param);
	}

	@Override
	public int selectVacancycheck(ResumeBean param) {
		return mypgCommDAO.selectVacancycheck(param);
	}

}
