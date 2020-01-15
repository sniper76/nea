package ony.cpes.external.mypage.privt.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.ConstVal;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ReferralBean;
import ony.cpes.external.mypage.privt.bean.ResumeOpenCompnyBean;
import ony.cpes.external.mypage.privt.dao.ApplicDAO;
import ony.cpes.external.mypage.privt.service.ApplicService;
import ony.framework.util.StringUtil;

@Service("ApplicService")
public class ApplicServiceImpl implements ApplicService {
	@Autowired
	private ApplicDAO applicDAO;


	/**
	 * 입사지원 count정보
	 * applic list
	 * @param param
	 * @return ApplicBean
	 */
	public ApplicBean selectApplicStatCnt(CondApplicBean param)  throws Exception {
		return applicDAO.selectApplicStatCnt(param);
	}

	/**
	 * 입사지원 목록
	 * applic list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectApplicListCnt(CondApplicBean param) throws Exception {
		return applicDAO.selectApplicListCnt(param);
	}


	/**
	 * 입사지원 목록
	 * applic list
	 * @param param
	 * @return List<ApplicBean>
	 */
	@Override
	public List<ApplicBean> selectApplicList(CondApplicBean param) throws Exception {
		return applicDAO.selectApplicList(param);
	}


	/**
	 * 입사지원 취소
	 * applic cancel
	 * @param param
	 * @return int
	 */
	@Override
	public int updateCancelApplic(CondApplicBean param) throws Exception {
		return applicDAO.updateCancelApplic(param);
	}

	/**
	 * Delete Application
	 * @param applicSeqArr
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public int deleteApplic(String[] applicSeqArr, String userSeq) throws Exception {
		int ret = 0;

		ApplicBean param = new ApplicBean();
		for(String applicSeq : applicSeqArr) {
			param.setApplicSeq(applicSeq);
			param.setModUserSeq(userSeq);

			ret += applicDAO.deleteApplic(param);
		}
		return ret;
	}

	/**
	 * 입사제의 목록 count
	 * offer list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectOfferListCnt(CondApplicBean param) throws Exception {
		return applicDAO.selectOfferListCnt(param);
	}


	/**
	 * 입사제의 목록
	 * offer list
	 * @param param
	 * @return int
	 */
	@Override
	public List<OfferBean> selectOfferList(CondApplicBean param) throws Exception {
		return applicDAO.selectOfferList(param);
	}


	/**
	 * 면접제의 목록 count
	 * interview list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectIntvwListCnt(CondApplicBean param) throws Exception {
		return applicDAO.selectIntvwListCnt(param);
	}


	/**
	 * 면접제의 목록
	 * interview list
	 * @param param
	 * @return List<IntvwBean>
	 */
	@Override
	public List<IntvwBean> selectIntvwList(CondApplicBean param) throws Exception {
		return applicDAO.selectIntvwList(param);
	}


	/**
	 * 면접제의 상세
	 * interview detail
	 * @param param
	 * @return IntvwBean
	 */
	@Override
	public IntvwBean selectIntvw(CondApplicBean param) throws Exception {
		return applicDAO.selectIntvw(param);
	}

	/**
	 * 입사제의 삭제
	 * offer delete
	 * @param param
	 * @return int
	 */
	@Override
	public int deleteOffer(CondApplicBean param) throws Exception {
    	int result = 0;

    	if(StringUtil.isEmpty(param.getCondStr())) {
    		return 0;
    	} else {
    		String[] strArr = param.getCondStr().split(ConstVal.COMMA_VAL);

    		if(strArr != null && strArr.length > 0) {
        		for(int i=0; i<strArr.length; i++) {

        			param.setCondSeq(strArr[i].split(ConstVal.UNDER_VAR_VAL)[0]);
        			param.setCondSeq2(strArr[i].split(ConstVal.UNDER_VAR_VAL)[1]);

        			result = result + applicDAO.deleteOffer(param);

        		}
    		}
    	}

    	return result;
	}

	/**
	 * 이력서 열람 기업 목록
	 * cv open compny list
	 * @param param
	 * @return List<ResumeOpenCompnyBean>
	 */
	@Override
	public List<ResumeOpenCompnyBean> selectOpenResumeCompnyList(CondApplicBean param) throws Exception {
		return applicDAO.selectOpenResumeCompnyList(param);
	}


	/**
	 * 이력서 열람 기업 목록  count
	 * cv open compny list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectOpenResumeCompnyListCnt(CondApplicBean param) throws Exception {
		return applicDAO.selectOpenResumeCompnyListCnt(param);
	}

	/**
	 * 이력서 열람 기업 삭제
	 * cv open resume compny delete
	 * @param param
	 * @return int
	 */
	@Override
	public int deleteResumeOpenCompny(CondApplicBean param) throws Exception {
    	int result = 0;

    	if(StringUtil.isEmpty(param.getCondStr())) {
    		return 0;
    	} else {
    		String[] strArr = param.getCondStr().split(ConstVal.COMMA_VAL);


    		if(strArr != null && strArr.length > 0) {
        		for(int i=0; i<strArr.length; i++) {

        			param.setCondSeq(strArr[i].split(ConstVal.UNDER_VAR_VAL)[0]);
        			param.setCondSeq2(strArr[i].split(ConstVal.UNDER_VAR_VAL)[1]);

        			result = result + applicDAO.deleteResumeOpenCompny(param);

        		}
    		}
    	}


    	return result;

	}


	/**
	 * 알선 목록  count
	 * referral list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectReferralListCnt(CondApplicBean param) throws Exception {
		return applicDAO.selectReferralListCnt(param);
	}


	/**
	 * 알선 목록
	 * referral list
	 * @param param
	 * @return List<ReferralBean>
	 */
	@Override
	public List<ReferralBean> selectReferralList(CondApplicBean param) throws Exception {
		return applicDAO.selectReferralList(param);
	}

	/**
	 * 알선 수락
	 * reffer ok
	 * @param param
	 * @param param2
	 * @return int
	 */
	@Override
	public int updateReferralOk(ReferralBean param, ApplicBean param2) throws Exception {
		int result = applicDAO.updateReferralOk(param);
		if(result > 0) {
			param2.setReferralYn(ConstVal.YES_VAL);
			applicDAO.insertApplic(param2);
		}

		return result;
	}

	/**
	 * 알선 삭제
	 * reffer ok delete
	 * @param param
	 * @return int
	 */
	@Override
	public int deleteReferral(CondApplicBean param) throws Exception {
    	int result = 0;

    	if(StringUtil.isEmpty(param.getCondStr())) {
    		return 0;
    	} else {
    		String[] strArr = param.getCondStr().split(ConstVal.COMMA_VAL);


    		if(strArr != null && strArr.length > 0) {
        		for(int i=0; i<strArr.length; i++) {

        			param.setCondSeq(strArr[i].split(ConstVal.UNDER_VAR_VAL)[0]);
        			param.setCondSeq2(strArr[i].split(ConstVal.UNDER_VAR_VAL)[1]);

        			result = result + applicDAO.deleteReferral(param);

        		}
    		}
    	}

    	return result;
	}

	/**
	 * 알선 거부
	 * reffer no
	 * @param param
	 * @return int
	 */
	@Override
	public int updateReferralNo(ReferralBean param) throws Exception {
		return applicDAO.updateReferralNo(param);
	}


	/**
	 * 입사지원 등록
	 * applic insert
	 * @param param
	 * @return int
	 */
	@Override
	public int insertApplic(ApplicBean param) throws Exception {
		param.setReferralYn(ConstVal.NO_VAL);
		return applicDAO.insertApplic(param);
	}


	/**
	 * 입사제의 수락,거절
	 * offer ok,reject
	 * @param param
	 * @return int
	 */
	@Override
	public int updateOfferUser(OfferBean param) throws Exception {
		int result = applicDAO.updateOfferUser(param);

		if(result > 0 && StringUtils.equals(ConstVal.YES_VAL, param.getOfferAcptYn())) {//입사제의 수락일경우 입사제의 테이블 insert
			ApplicBean param2 = new ApplicBean();
			param2.setVacancySeq(param.getVacancySeq());
			param2.setRegUserSeq(param.getRegUserSeq());
			param2.setModUserSeq(param.getModUserSeq());

			applicDAO.insertApplicOffer(param2);//입사제의 수락후 입력
		}

		return result;
	}

	/**
	 * select application summary by process code
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> selectApplicSmry(String userSeq) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("userSeq", userSeq);
		return applicDAO.selectApplicSmry(param);
	}

	/**
	 * 인터뷰 수락
	 * interview ok
	 * @param param
	 * @return int
	 */
	@Override
	public int updateIntvwOk(IntvwBean param) throws Exception {
		return applicDAO.updateIntvwOk(param);
	}


	/**
	 * 인터뷰 거절
	 * interview reject
	 * @param param
	 * @return int
	 */
	public int updateIntvwReject(IntvwBean param) throws Exception {
		return applicDAO.updateIntvwReject(param);
	}

}
