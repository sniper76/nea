package ony.cpes.external.mypage.compny.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cmm.common.ConstVal;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.dao.CompnyApplicDAO;
import ony.cpes.external.mypage.compny.service.CompnyApplicService;
import ony.cpes.external.mypage.privt.bean.ApplicBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.cpes.external.mypage.privt.bean.OfferBean;
import ony.cpes.external.mypage.privt.bean.ReferralBean;
import ony.framework.util.StringUtil;


@Service("CompnyApplicService")
public class CompnyApplicServiceImpl implements CompnyApplicService {

	@Autowired
	private CompnyApplicDAO compnyApplicDAO;


	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;


	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
    @Override
	public List<VacancyBean> selectVacancySimpleList(CondApplicBean param) throws Exception {
		return compnyApplicDAO.selectVacancySimpleList(param);
	}


	/**
	 * 입사지원 count정보
	 * applic list
	 * @param param
	 * @return ApplicBean
	 */
    @Override
	public ApplicBean selectApplicStatCnt(CondApplicBean param) throws Exception {
		return compnyApplicDAO.selectApplicStatCnt(param);
	}

	/**
	 * 입사지원 목록 count
	 * applic list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectApplicListCnt(CondApplicBean param) throws Exception {
		return compnyApplicDAO.selectApplicListCnt(param);
	}

	/**
	 * 입사지원 엑셀 다운로드 목록
	 * applic list
	 * @param param
	 * @return List<ApplicBean>
	 */
    @Override
	public List<Map<String, Object>> selectApplicExcelList(CondApplicBean param) throws Exception {
		return compnyApplicDAO.selectApplicExcelList(param);
	}

    /**
     * 입사지원 목록
     * applic list
     * @param param
     * @return List<ApplicBean>
     */
    @Override
    public List<ApplicBean> selectApplicList(CondApplicBean param) throws Exception {
    	return compnyApplicDAO.selectApplicList(param);
    }

	/**
	 * 입사지원 상태변경
	 * applic proc stat change
	 * @param param
	 * @return int
	 */
    @Override
	public int updateProcStat(CondApplicBean param) throws Exception {
		return compnyApplicDAO.updateProcStat(param);
	}

	/**
	 * 입사지원 이력서 열람 처리
	 * appli cx read
	 * @param param
	 * @return int
	 */
    @Override
	public int updateResumeOpen(CondApplicBean param) throws Exception {
    	return compnyApplicDAO.updateResumeOpen(param);
	}

	/**
	 * 입사지원 이력서 열람 처리(다수)
	 * appli cx read(multi)
	 * @param param
	 * @return int
	 */
	public int updateResumeOpenMulti(CondApplicBean param) throws Exception {
		int result = 0;
		String[] strArr = param.getCondStr().split(ConstVal.COMMA_VAL);


		if(strArr != null && strArr.length > 0) {
    		for(int i=0; i<strArr.length; i++) {

    			param.setCondSeq(strArr[i].split(ConstVal.UNDER_VAR_VAL)[0]);
    			param.setCondSeq2(strArr[i].split(ConstVal.UNDER_VAR_VAL)[1]);

    			result = result + compnyApplicDAO.updateResumeOpen(param);

    		}
		}

		return result;
	}


	/**
	 * 입사제의 목록 count
	 * offer list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectOfferListCnt(CondApplicBean param) throws Exception {
		return compnyApplicDAO.selectOfferListCnt(param);
	}

	/**
	 * 입사제의 목록 count
	 * offer list count
	 * @param param
	 * @return int
	 */
	@Override
	public List<OfferBean> selectOfferList(CondApplicBean param) throws Exception {
		return compnyApplicDAO.selectOfferList(param);
	}

	/**
	 * 알선 목록  count
	 * referral list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectReferralListCnt(CondApplicBean param) throws Exception {
		return compnyApplicDAO.selectReferralListCnt(param);
	}


	/**
	 * 알선 목록
	 * referral list
	 * @param param
	 * @return List<ReferralBean>
	 */
	@Override
	public List<ReferralBean> selectReferralList(CondApplicBean param) throws Exception {
		return compnyApplicDAO.selectReferralList(param);
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

		if(!StringUtil.isEmpty(param.getCondStr())) {
			String[] strArr = param.getCondStr().split(ConstVal.COMMA_VAL);

			if(strArr != null && strArr.length > 0) {
	    		for(int i=0; i<strArr.length; i++) {

	    			param.setCondSeq(strArr[i].split(ConstVal.UNDER_VAR_VAL)[0]);
	    			param.setCondSeq2(strArr[i].split(ConstVal.UNDER_VAR_VAL)[1]);

	    			result = result + compnyApplicDAO.deleteReferral(param);

	    		}
			}
		}

		return result;

	}


	/**
	 * 알선 수락
	 * reffer ok
	 * @param param
	 * @param param2
	 * @return int
	 */
	@Override
	public int updateReferralOk(ReferralBean param) throws Exception {
		return compnyApplicDAO.updateReferralOk(param);
	}

	/**
	 * 알선 거부
	 * reffer no
	 * @param param
	 * @return int
	 */
	@Override
	public int updateReferralNo(ReferralBean param) throws Exception {
		return compnyApplicDAO.updateReferralNo(param);
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

		if(!StringUtil.isEmpty(param.getCondStr())) {
			String[] strArr = param.getCondStr().split(ConstVal.COMMA_VAL);

			if(strArr != null && strArr.length > 0) {
	    		for(int i=0; i<strArr.length; i++) {

	    			param.setCondSeq(strArr[i].split(ConstVal.UNDER_VAR_VAL)[0]);
	    			param.setCondSeq2(strArr[i].split(ConstVal.UNDER_VAR_VAL)[1]);

	    			result = result + compnyApplicDAO.deleteOffer(param);

	    		}
			}
		}

		return result;

	}

	/**
	 * 구인 목록 조회 count(진행중)
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
	@Override
	public int selectVacancyListCnt(CondVacancyBean param) throws Exception {
		return compnyApplicDAO.selectVacancyListCnt(param);
	}


	/**
	 * 구인 목록 조회(진행중)
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	@Override
	public List<VacancyBean> selectVacancyList(CondVacancyBean param) throws Exception {
		return compnyApplicDAO.selectVacancyList(param);
	}


	/**
	 * 알선 요청
	 * referral rquest
	 * @param param
	 * @return int
	 */
	@Override
	public int updateReferralReq(CondApplicBean param) throws Exception {
		return compnyApplicDAO.updateReferralReq(param);
	}


	/**
	 * 입사지원 불합격 처리
	 * applic fail process
	 * @param param
	 * @return int
	 */
	@Override
	public int updateFailReason(CondApplicBean param) throws Exception {
		return compnyApplicDAO.updateFailReason(param);
	}

	/**
	 * 입사지원 인터뷰 요청
	 * applic intvw process
	 * @param param
	 * @return int
	 */
	@Override
	public int updateIntvwReq(CondApplicBean param, IntvwBean param2) throws Exception {
		int result = 0;
		if(compnyApplicDAO.selectApplicIntvwDupCnt(param) > 0) {
			return -1;
		}

		if(compnyApplicDAO.updateProcStat(param) < 1) {
			return 0;
		}

		result = compnyApplicDAO.insertIntvw(param2);

		return result;
	}
}
