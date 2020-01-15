package ony.cpes.external.mypage.mypgComm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cpes.external.mypage.mypgComm.dao.ResumeOpenCompnyDAO;
import ony.cpes.external.mypage.mypgComm.service.ResumeOpenCompnyService;
import ony.cpes.external.mypage.privt.bean.ResumeOpenCompnyBean;

@Service("ResumeOpenCompnyService")
public class ResumeOpenCompnyServiceImpl implements ResumeOpenCompnyService {

	@Autowired
	private ResumeOpenCompnyDAO resumeOpenCompnyDAO;

	@Override
	public int insertResumeOpenCompny(ResumeOpenCompnyBean param) {
		return resumeOpenCompnyDAO.insertResumeOpenCompny(param);
	}

}
