package ony.cpes.external.counsel.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import ony.cmm.common.bean.CertifyBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.bean.FileBean;
import ony.cmm.common.dao.CommDAO;
import ony.cmm.common.service.CommonService;
import ony.cpes.external.counsel.bean.CondCounselBean;
import ony.cpes.external.counsel.bean.CounselBean;
import ony.cpes.external.counsel.dao.CounselDAO;
import ony.cpes.external.counsel.service.CounselService;
import ony.cpes.external.member.bean.CompanyBean;
import ony.cpes.external.member.bean.InstitutionBean;
import ony.cpes.external.member.bean.MemberBean;
import ony.cpes.external.member.dao.MemberDAO;
import ony.cpes.external.member.service.MemberService;
import ony.cpes.external.user.bean.UserBean;
import ony.framework.util.StringUtil;

@Service("CounselService")
public class CounselServiceImpl implements CounselService {

	@Autowired
	private CounselDAO counselDAO;

	@Autowired
	private CommDAO commDAO;

	@Autowired
	private CommonService commonService;

	@Autowired
	private MemberDAO memberDAO;

	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;




	/**
	 * 상담 등록
	 * counsel insert
	 * @param param
	 * @return int
	 */
    @Override
	public int insertCounsel(CounselBean param) throws Exception {
    	String uuid =  memberDAO.selectUUID(null);
    	param.setCounselSeq(uuid);
    	int result = 0;

    	if(!StringUtil.isEmpty(param.getUploadResult())) {

    		String fileGrpSeq = commonService.dext5UploadInsert(param.getUploadResult(), param.getUserSeq(), param.getQustFileGrpSeq());
    		param.setQustFileGrpSeq(fileGrpSeq);
		}

    	result = counselDAO.insertCounsel(param);

    	return result;
	}


	/**
	 * 상담 목록 count
	 * counsel list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectCounselListCnt (CondCounselBean param) throws Exception {
    	return counselDAO.selectCounselListCnt(param);
    }


	/**
	 * 상담 목록
	 * counsel list
	 * @param param
	 * @return List<CounselBean>
	 */
    @Override
	public List<CounselBean> selectCounselList (CondCounselBean param) throws Exception {
		return counselDAO.selectCounselList(param);
	}


	/**
	 * 상담 상세
	 * counsel detail view
	 * @param param
	 * @return CounselBean
	 */
    @Override
	public CounselBean selectCounsel (CondCounselBean param) throws Exception {

    	counselDAO.updateViewCnt(param);

		return counselDAO.selectCounsel(param);
	}


	/**
	 * 상담 삭제
	 * counsel delete
	 * @param param
	 * @return int
	 */
    @Override
	public int deleteCounsel(CondCounselBean param) throws Exception {
    	return counselDAO.deleteCounsel(param);
	}


	/**
	 * 상담 수정
	 * counsel update
	 * @param param
	 * @return int
	 */
    @Override
	public int updateCounsel(CounselBean param) throws Exception {
    	return counselDAO.updateCounsel(param);
	}
}
