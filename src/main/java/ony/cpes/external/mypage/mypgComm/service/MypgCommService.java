package ony.cpes.external.mypage.mypgComm.service;

import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;

public interface MypgCommService {
	public ApplicBean selectResumeApplic(ResumeBean param);
	public IntvwBean selectResumeIntvw(ResumeBean param);
	public OfferBean selectResumeOffer(ResumeBean param);
	public int selectVacancycheck(ResumeBean param);
}
