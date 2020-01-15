package ony.cpes.external.mypage.compny.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.service.CommonService;
import ony.cpes.external.mypage.compny.bean.CompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyMemBean;
import ony.cpes.external.mypage.compny.dao.CompnyMemDAO;
import ony.cpes.external.mypage.compny.service.CompnyMemService;
import ony.framework.util.StringUtil;




@Service("CompnyMemService")
public class CompnyMemServiceImpl implements CompnyMemService {
	@Autowired
	private CompnyMemDAO compnyMemDAO;

	@Autowired
	private CommonService commonService;

	/**
	 * 기업정보 조회
	 * company member view
	 * @param param
	 * @return CompnyMemBean
	 */
	@Override
	public CompnyMemBean selectCompnyMember(CondCompnyMemBean param) throws Exception {
		return compnyMemDAO.selectMember(param);
	}

	/**
	 * 기업정보 저장
	 * company member update
	 * @param param
	 * @return int
	 */
	@Override
	public int updateCompnyMember(CompnyMemBean param) throws Exception {
		return compnyMemDAO.updateMember(param);
	}


	/**
	 * 기업정보 프로파일 저장
	 * company member profile update
	 * @param param
	 * @return int
	 */
	@Override
	public int updateProfile(CompnyMemBean param) throws Exception {

		if(!StringUtil.isEmpty(param.getUploadResult())) {

    		String fileGrpSeq = commonService.dext5UploadInsert(param.getUploadResult(), param.getUserSeq(), param.getFileGrpSeq());
    		param.setFileGrpSeq(fileGrpSeq);
		}

		int result = compnyMemDAO.updateProfile(param);

		return result;
	}

	@Override
	public int updateCompanyLogoImg(CompnyMemBean param) throws Exception {
		return compnyMemDAO.updateCompanyLogoImg(param);
	}
}
