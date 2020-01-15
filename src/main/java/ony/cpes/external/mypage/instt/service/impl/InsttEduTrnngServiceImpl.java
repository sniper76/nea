package ony.cpes.external.mypage.instt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.dao.CommDAO;
import ony.cpes.external.mypage.compny.dao.CompnyApplicDAO;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.dao.InsttEduTrnngDAO;
import ony.cpes.external.mypage.instt.service.InsttEduTrnngService;

@Service("InsttEduTrnngService")
public class InsttEduTrnngServiceImpl implements InsttEduTrnngService {
	@Autowired
	private InsttEduTrnngDAO insttEduTrnngDAO;

	@Autowired
	private CommDAO commDAO;


	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;


	/**
	 * 교육 프로그램  상태별 cnt
	 * education tranning status cnt
	 * @param param
	 * @return EduTrnngBean
	 */
    @Override
	public EduTrnngBean selectEduTrnngStatCnt(CondEduTrnngBean param) throws Exception {
		return insttEduTrnngDAO.selectEduTrnngStatCnt(param);
	}


	/**
	 * 교육 프로그램  목록 count
	 * education tranning list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectEduTrnngListCnt(CondEduTrnngBean param) throws Exception {
		return insttEduTrnngDAO.selectEduTrnngListCnt(param);
	}

	/**
	 * 교육 프로그램  목록
	 * education tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
    @Override
	public List<EduTrnngBean> selectEduTrnngList(CondEduTrnngBean param) throws Exception {
		return insttEduTrnngDAO.selectEduTrnngList(param);
	}


	/**
	 * 교육 프로그램  등록
	 * education tranning insert
	 * @param param
	 * @return int
	 */
    @Override
	public int insertEduTrnng(EduTrnngBean param) throws Exception {
		String uuid = "";
    	ConditionBean conditionBean = new ConditionBean();
    	uuid = commDAO.selectUUID(conditionBean);
    	param.setEduTrnngSeq(uuid);

    	String programCertNum = insttEduTrnngDAO.selectEduTrnngNum(null);
    	param.setProgramCertNum(programCertNum);

    	int result = insttEduTrnngDAO.insertEduTrnng(param);
    	if(result > 0) {
    		if(param.getTeachAddrCd() != null) {
    			String[] teachAddrCdArr = param.getTeachAddrCd().split(ConstVal.COMMA_VAL);
    			if(teachAddrCdArr != null && teachAddrCdArr.length > 0) {

    				for(int i=0; i<teachAddrCdArr.length; i++) {
    					param.setAddrCd(teachAddrCdArr[i]);
    					insttEduTrnngDAO.insertEduTrnngAddr(param);
    				}
    			}
    		}

    		insttEduTrnngDAO.insertEduTrnngSub(param);
    	}

    	return result;
    }


	/**
	 * 교육 프로그램 상세
	 * education tranning detail
	 * @param param
	 * @return EduTrnngBean
	 */
    @Override
	public EduTrnngBean selectEduTrnng(CondEduTrnngBean param) throws Exception {
		return insttEduTrnngDAO.selectEduTrnng(param);
	}


	/**
	 * 교육 프로그램 주소 목록
	 * education tranning address list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
    @Override
	public List<EduTrnngBean> selectEduTrnngAddrList(CondEduTrnngBean param) throws Exception {
		return insttEduTrnngDAO.selectEduTrnngAddrList(param);
	}

	/**
	 * 교육 프로그램  수정
	 * education tranning update
	 * @param param
	 * @return int
	 */
    @Override
	public int updateEduTrnng(EduTrnngBean param) throws Exception {

    	int result = insttEduTrnngDAO.updateEduTrnng(param);
    	if(result > 0) {
    		insttEduTrnngDAO.updateEduTrnngSub(param);
    		insttEduTrnngDAO.deleteEduTrnngAddrAll(param);//교육프로그램 삭제

    		if(param.getTeachAddrCd() != null) {
    			String[] teachAddrCdArr = param.getTeachAddrCd().split(ConstVal.COMMA_VAL);
    			if(teachAddrCdArr != null && teachAddrCdArr.length > 0) {

    				for(int i=0; i<teachAddrCdArr.length; i++) {
    					param.setAddrCd(teachAddrCdArr[i]);
    					insttEduTrnngDAO.insertEduTrnngAddr(param);
    				}
    			}
    		}


    	}

    	return result;
	}

	/**
	 * 교육 프로그램  삭제
	 * education tranning delete
	 * @param param
	 * @return int
	 */
    @Override
	public int deleteEduTrnng(CondEduTrnngBean param) throws Exception {
    	return insttEduTrnngDAO.deleteEduTrnng(param);
	}


	/**
	 * 교육 프로그램  마감
	 * education tranning close
	 * @param param
	 * @return int
	 */
    @Override
	public int updateEduTrnngClose(CondEduTrnngBean param) throws Exception {
    	return insttEduTrnngDAO.updateEduTrnngClose(param);
	}
}
