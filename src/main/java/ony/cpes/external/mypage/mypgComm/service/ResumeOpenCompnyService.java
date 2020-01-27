package ony.cpes.external.mypage.mypgComm.service;

import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.mypage.privt.bean.ResumeOpenCompnyBean;

public interface ResumeOpenCompnyService {
	public int insertResumeOpenCompny(ResumeOpenCompnyBean param);
	public String selectResumeOpenCompanyCnt(ResumeBean param);
	public int updateResumeOpenCompany(ResumeOpenCompnyBean param);
}
