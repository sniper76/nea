package ony.cpes.external.compny.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.bean.FileBean;
import ony.cmm.common.service.CommonService;
import ony.cpes.external.compny.dao.CompnyDAO;
import ony.cpes.external.compny.service.CompnyService;
import ony.cpes.external.mypage.compny.bean.CompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.framework.util.StringUtil;





@Service("CompnyService")
public class CompnyServiceImpl implements CompnyService {
	@Autowired
	private CompnyDAO compnyDAO;

	@Autowired
	private CommonService commonService;


	/**
	 * 기업정보 조회
	 * company member view
	 * @param param
	 * @return CompnyMemBean
	 */
	@Override
	public CompnyMemBean selectCompnyInfo(CondCompnyMemBean param) throws Exception {
		CompnyMemBean result = compnyDAO.selectCompnyInfo(param);

		if(!StringUtil.isEmpty(result.getFileGrpSeq())) {
			FileBean fileBean = new FileBean();
			fileBean.setFileGrpSeq(result.getFileGrpSeq());
			result.setFileList(commonService.selectAttachFilesList(fileBean));
		}

		return result;
	}



	/**
	 * 구인 목록 조회 count
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectVacancyContinueListCnt(CondVacancyBean param) throws Exception {
		return compnyDAO.selectVacancyContinueListCnt(param);
	}

	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	@Override
	public List<VacancyBean> selectVacancyContinueList(CondVacancyBean param) throws Exception {
		return compnyDAO.selectVacancyContinueList(param);
	}

	/**
	 * Company Information by user
	 */
	public CompnyMemBean selectCompnyByUserSeq(String userSeq, String langCd) throws Exception {
		return compnyDAO.selectCompnyByUserSeq(userSeq, langCd);
	}

}
