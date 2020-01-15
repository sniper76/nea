package ony.cpes.external.mypage.compny.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cmm.common.ConstVal;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.dao.CompnyFairDAO;
import ony.cpes.external.mypage.compny.service.CompnyFairService;
import ony.cpes.external.mypage.privt.bean.CondFairBean;
import ony.cpes.external.mypage.privt.bean.FairBean;
import ony.framework.util.StringUtil;


@Service("CompnyFairService")
public class CompnyFairServiceImpl implements CompnyFairService {


	@Autowired
	private CompnyFairDAO compnyFairDAO;


	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;


	/**
	 * 초청받은 채용행사 목록 count
	 * invite fair list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectInviteListCnt(CondFairBean param) throws Exception {
		return compnyFairDAO.selectInviteListCnt(param);
	}

	/**
	 * 초청받은 채용행사 목록
	 * invite fair list
	 * @param param
	 * @return List<FairBean>
	 */
    @Override
	public List<FairBean> selectInviteList(CondFairBean param) throws Exception {
		return compnyFairDAO.selectInviteList(param);
	}


	/**
	 * 초청받은 채용행사 신청
	 * invite fair request
	 * @param param
	 * @return int
	 */
    @Override
	public int updateInviteOk(CondFairBean param) throws Exception {
		return compnyFairDAO.updateInviteOk(param);
	}


	/**
	 * 초청받은 채용행사 삭제
	 * invite fair delete
	 * @param param
	 * @return int
	 */
    @Override
	public int deleteInvite(CondFairBean param) throws Exception {
    	int result = 0;

    	if(StringUtil.isEmpty(param.getCondSeqStr())) {
    		return 0;
    	} else {
    		String[] strArr = param.getCondSeqStr().split(ConstVal.COMMA_VAL);


    		if(strArr != null && strArr.length > 0) {
        		for(int i=0; i<strArr.length; i++) {

        			param.setCondSeq(strArr[i].split(ConstVal.UNDER_VAR_VAL)[0]);
        			param.setCondSeq2(strArr[i].split(ConstVal.UNDER_VAR_VAL)[1]);

        			result = result + compnyFairDAO.deleteInvite(param);

        		}
    		}
    	}


    	return result;

	}


	/**
	 * 참가 채용행사 목록 count
	 * join fair list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectJoinListCnt(CondFairBean param) throws Exception {
    	param.setCondTypeCd(ConstVal.JOIN_VAL);//참가구분
		return compnyFairDAO.selectInviteListCnt(param);
	}

	/**
	 * 참가 채용행사 목록
	 * join fair list
	 * @param param
	 * @return List<FairBean>
	 */
    @Override
	public List<FairBean> selectJoinList(CondFairBean param) throws Exception {
    	param.setCondTypeCd(ConstVal.JOIN_VAL);//참가구분
		return compnyFairDAO.selectInviteList(param);
	}

	/**
	 * 채용행사 상세
	 * fair detail
	 * @param param
	 * @return FairBean
	 */
    @Override
	public FairBean selectFair(CondFairBean param) throws Exception {
		return compnyFairDAO.selectFair(param);
	}


	/**
	 * 채용행사별 채용공고 목록
	 * fair from vacancy list
	 * @param param
	 * @return List<VacancyBean>
	 */
    @Override
	public List<VacancyBean> selectVacancyList(CondFairBean param) throws Exception {
		return compnyFairDAO.selectVacancyList(param);
	}


	/**
	 * 채용행사 참가취소
	 * invite fair cancel
	 * @param param
	 * @return int
	 */
    @Override
	public int updateInviteCancel(CondFairBean param) throws Exception {
		return compnyFairDAO.updateInviteCancel(param);
	}


	/**
	 * 채용행사 채용공고 삭제
	 * fair vacancy delete
	 * @param param
	 * @return int
	 */
    @Override
	public int deleteVacancyMulti(CondFairBean param) throws Exception {
		int result = 0;


		if(!StringUtil.isEmpty(param.getCondSeqStr())) {
			String[] strArr = param.getCondSeqStr().split(ConstVal.COMMA_VAL);

			if(strArr != null && strArr.length > 0) {
	    		for(int i=0; i<strArr.length; i++) {

	    			param.setCondSeq(strArr[i].split(ConstVal.UNDER_VAR_VAL)[0]);
	    			param.setCondSeq2(strArr[i].split(ConstVal.UNDER_VAR_VAL)[1]);

	    			result = result + compnyFairDAO.deleteFairVacancy(param);

	    		}
			}
		}

		return result;
	}


	/**
	 * 부스신청 목록 count
	 * fair booth list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectBoothListCnt(CondFairBean param) throws Exception {
		return compnyFairDAO.selectBoothListCnt(param);
	}

	/**
	 * 부스신청 목록
	 * fair booth list
	 * @param param
	 * @return List<FairBean>
	 */
    @Override
	public List<FairBean> selectBoothList(CondFairBean param) throws Exception {
		return compnyFairDAO.selectBoothList(param);
	}

	/**
	 * 채용행사 부스 취소
	 * fair booth cancel
	 * @param param
	 * @return int
	 */
    @Override
	public int updateBoothCancel(CondFairBean param) throws Exception {
		return compnyFairDAO.updateBoothCancel(param);
	}
}
