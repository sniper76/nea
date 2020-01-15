package ony.cpes.external.instt.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.bean.FileBean;
import ony.cmm.common.service.CommonService;
import ony.cpes.external.instt.dao.InsttDAO;
import ony.cpes.external.instt.service.InsttService;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngFreeBean;
import ony.cpes.external.mypage.instt.bean.CondInsttMemBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngHistBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;
import ony.framework.util.StringUtil;




@Service("InsttService")
public class InsttServiceImpl implements InsttService {
	@Autowired
	private InsttDAO insttDAO;

	@Autowired
	private CommonService commonService;

	/**
	 * 교육기관정보 조회
	 * education member info
	 * @param param
	 * @return PrivtMemBean
	 */
	@Override
	public InsttMemBean selectInstt(CondInsttMemBean param) throws Exception {
		InsttMemBean result = insttDAO.selectInstt(param);

		if(!StringUtil.isEmpty(result.getFileGrpSeq())) {
			FileBean fileBean = new FileBean();
			fileBean.setFileGrpSeq(result.getFileGrpSeq());
			result.setFileList(commonService.selectAttachFilesList(fileBean));
		}

		return result;
	}


	/**
	 * 교육훈련 목록 조회 count
	 * education tranning list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectEduTrnngContinueListCnt(CondEduTrnngBean param) throws Exception {
		return insttDAO.selectEduTrnngContinueListCnt(param);
	}

	/**
	 * 교육훈련 목록  조회
	 * education tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	@Override
	public List<EduTrnngBean> selectEduTrnngContinueList(CondEduTrnngBean param) throws Exception {
		return insttDAO.selectEduTrnngContinueList(param);
	}

	/**
	 * institute list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectInsttListCnt(CondEduTrnngFreeBean param) throws Exception {
		return insttDAO.selectInsttListCnt(param);
	}

	/**
	 * institute list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
	@Override
	public List<InsttMemBean> selectInsttList(CondEduTrnngFreeBean param) throws Exception {
		return insttDAO.selectInsttList(param);
	}


	/**
	 * 교육훈련 이력 목록 조회
	 * education history list
	 * @param param
	 * @return List<EduTrnngHistBean>
	 */
	@Override
	public List<EduTrnngHistBean> selectEduTrnngHistList(CondInsttMemBean param) throws Exception {
		return insttDAO.selectEduTrnngHistList(param);
	}

	/**
	 * Institute information by user
	 */
	public InsttMemBean selectInsttByUser(String userSeq, String langCd) throws Exception {
		return insttDAO.selectInsttByUser(userSeq, langCd);
	}

}
