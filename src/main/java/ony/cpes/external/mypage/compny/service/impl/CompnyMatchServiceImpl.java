package ony.cpes.external.mypage.compny.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ony.cmm.common.ConstVal;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetEduDegreeBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetIscoBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetLangBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetLocBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetPreferntCondBean;
import ony.cpes.external.mypage.compny.dao.CompnyMatchDAO;
import ony.cpes.external.mypage.compny.service.CompnyMatchService;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.framework.util.StringUtil;

@Service("CompnyMatchService")
public class CompnyMatchServiceImpl implements CompnyMatchService {

	@Autowired
	private CompnyMatchDAO compnyMatchDAO;

	/**
	 * 해당 기업의 채용공고 목록
	 * @param userSeq
	 * @param langCd
	 * @param stsCd
	 * @return
	 * @throws Exception
	 */
	public List<VacancyBean> selectCompnyVacancyList(String userSeq, String langCd, String stsCd) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("userSeq", userSeq);
		param.put("langCd", langCd);
		param.put("stsCd", stsCd);

		return compnyMatchDAO.selectCompnyVacancyList(param);
	}
	public List<VacancyBean> selectCompnyVacancyList(String userSeq, String langCd) throws Exception {
		return selectCompnyVacancyList(userSeq, langCd, null);
	}

	/**
	 *
	 * 해당 기업의 채용공고 정보 조회
	 * @param vacancySeq
	 * @param langCd
	 * @return
	 * @throws Exception
	 */
	public VacancyBean selectCompnyVacancy(String vacancySeq, String langCd) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("vacancySeq", vacancySeq);
		param.put("langCd", langCd);

		return compnyMatchDAO.selectCompnyVacancy(param);
	}

	/**
	 * 기업의 오토매칭 총건수
	 * @param userSeq
	 * @param langCd
	 * @return
	 * @throws Exception
	 */
	public Integer selectAutoMatchingResumeListCnt(CondVacancyBean param) throws Exception {
		return compnyMatchDAO.selectAutoMatchingResumeListCnt(param);
	}

	/**
	 * 기업의 오토매칭 목록
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public List<ResumeBean> selectAutoMatchingResumeList(CondVacancyBean param) throws Exception {
		return compnyMatchDAO.selectAutoMatchingResumeList(param);
	}

	/**
	 * 맞춤 인재정보 설정 조회
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public VacancyMatchSetBean selectVacancyMatchSet(String userSeq) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("userSeq", userSeq);

		return compnyMatchDAO.selectVacancyMatchSet(param);
	}

	/**
	 * 맞춤 인재정보 설정 조회::학력
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetEduDegreeBean> selectVacancyMatchSetEduDegreeList(String vacancyMatchSetSeq) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("vacancyMatchSetSeq", vacancyMatchSetSeq);

		return compnyMatchDAO.selectVacancyMatchSetEduDegreeList(param);
	}

	/**
	 * 맞춤 인재정보 설정 조회::직종
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetIscoBean> selectVacancyMatchSetIscoList(String vacancyMatchSetSeq) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("vacancyMatchSetSeq", vacancyMatchSetSeq);

		return compnyMatchDAO.selectVacancyMatchSetIscoList(param);
	}

	/**
	 * 맞춤 인재정보 설정 조회::외국어
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetLangBean> selectVacancyMatchSetLangList(String vacancyMatchSetSeq) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("vacancyMatchSetSeq", vacancyMatchSetSeq);

		return compnyMatchDAO.selectVacancyMatchSetLangList(param);
	}

	/**
	 * 맞춤 인재정보 설정 조회::지역
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetLocBean> selectVacancyMatchSetLocList(String vacancyMatchSetSeq) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("vacancyMatchSetSeq", vacancyMatchSetSeq);

		return compnyMatchDAO.selectVacancyMatchSetLocList(param);
	}

	/**
	 * 맞춤 인재정보 설정 조회::우대조건
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetPreferntCondBean> selectVacancyMatchSetPreferntCondList(String vacancyMatchSetSeq) throws Exception {
		Map<String, Object> param = null;
		param = new HashMap<String, Object>();
		param.put("vacancyMatchSetSeq", vacancyMatchSetSeq);

		return compnyMatchDAO.selectVacancyMatchSetPreferntCondList(param);
	}

	/**
	 * 맞춤 인재정보 설정::입력
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertCompnyMatchVacancy(VacancyMatchSetBean param) throws Exception {
		Integer ret = 0;
		String vacancyMatchSetSeq = "";

		// 맞춤 인재정보 설정
		ret = compnyMatchDAO.insertVacancyMatchSet(param);
		if(ret != null && ret > 0) {
			vacancyMatchSetSeq = param.getVacancyMatchSetSeq();
			// 직종
			if(!StringUtil.isEmpty(param.getIscoCd())) {
				String[] strArr = param.getIscoCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
					VacancyMatchSetIscoBean vacancyMatchSetIsco = new VacancyMatchSetIscoBean();
					vacancyMatchSetIsco.setVacancyMatchSetSeq(vacancyMatchSetSeq);
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetIsco.setIscoCd(strArr[i]);
		    			ret = ret + compnyMatchDAO.insertVacancyMatchSetIsco(vacancyMatchSetIsco);
		    		}
				}
			}
			// 지역
			if(!StringUtil.isEmpty(param.getLocCd())) {
				String[] strArr = param.getLocCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
					VacancyMatchSetLocBean vacancyMatchSetLoc = new VacancyMatchSetLocBean();
					vacancyMatchSetLoc.setVacancyMatchSetSeq(vacancyMatchSetSeq);
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetLoc.setVacancyMatchSetLocCd(strArr[i]);
		    			ret = ret + compnyMatchDAO.insertVacancyMatchSetLoc(vacancyMatchSetLoc);
		    		}
				}
			}
			// 학력
			if(!StringUtil.isEmpty(param.getMinEduDegreeCd())) {
				String[] strArr = param.getMinEduDegreeCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
					VacancyMatchSetEduDegreeBean vacancyMatchSetEduDegree = new VacancyMatchSetEduDegreeBean();
					vacancyMatchSetEduDegree.setVacancyMatchSetSeq(vacancyMatchSetSeq);
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetEduDegree.setMinEduDegreeCd(strArr[i]);
		    			ret = ret + compnyMatchDAO.insertVacancyMatchSetEduDegree(vacancyMatchSetEduDegree);
		    		}
				}
			}
			// 우대조건
			if(!StringUtil.isEmpty(param.getPreferntCondCd())) {
				String[] strArr = param.getPreferntCondCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
					VacancyMatchSetPreferntCondBean vacancyMatchSetPreferntCond = new VacancyMatchSetPreferntCondBean();
					vacancyMatchSetPreferntCond.setVacancyMatchSetSeq(vacancyMatchSetSeq);
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetPreferntCond.setPreferntCondCd(strArr[i]);
		    			ret = ret + compnyMatchDAO.insertVacancyMatchSetPreferntCond(vacancyMatchSetPreferntCond);
		    		}
				}
			}
			// 외국어
			if(!StringUtil.isEmpty(param.getLangCd())) {
				String[] strArr = param.getLangCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
					VacancyMatchSetLangBean vacancyMatchSetLang = new VacancyMatchSetLangBean();
					vacancyMatchSetLang.setVacancyMatchSetSeq(vacancyMatchSetSeq);
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetLang.setLangCd(strArr[i]);
		    			ret = ret + compnyMatchDAO.insertVacancyMatchSetLang(vacancyMatchSetLang);
		    		}
				}
			}
		}
		return ret;
	}

	/**
	 * 맞춤 인재정보 설정::수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer updateCompnyMatchVacancy(VacancyMatchSetBean param) throws Exception {
		Integer ret = 0;
		String vacancyMatchSetSeq = "";

		// 맞춤 인재정보 설정
		ret = compnyMatchDAO.updateVacancyMatchSet(param);
		if(ret != null && ret > 0) {
			vacancyMatchSetSeq = param.getVacancyMatchSetSeq();
			// 직종
			VacancyMatchSetIscoBean vacancyMatchSetIsco = new VacancyMatchSetIscoBean();
			vacancyMatchSetIsco.setVacancyMatchSetSeq(vacancyMatchSetSeq);
			compnyMatchDAO.deleteVacancyMatchSetIsco(vacancyMatchSetIsco);

			if(!StringUtil.isEmpty(param.getIscoCd())) {
				String[] strArr = param.getIscoCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetIsco.setIscoCd(strArr[i]);
		    			ret = ret + compnyMatchDAO.insertVacancyMatchSetIsco(vacancyMatchSetIsco);
		    		}
				}
			}
			// 지역
			VacancyMatchSetLocBean vacancyMatchSetLoc = new VacancyMatchSetLocBean();
			vacancyMatchSetLoc.setVacancyMatchSetSeq(vacancyMatchSetSeq);
			compnyMatchDAO.deleteVacancyMatchSetLoc(vacancyMatchSetLoc);

			if(!StringUtil.isEmpty(param.getLocCd())) {
				String[] strArr = param.getLocCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetLoc.setVacancyMatchSetLocCd(strArr[i]);
		    			ret = ret + compnyMatchDAO.insertVacancyMatchSetLoc(vacancyMatchSetLoc);
		    		}
				}
			}
			// 학력
			VacancyMatchSetEduDegreeBean vacancyMatchSetEduDegree = new VacancyMatchSetEduDegreeBean();
			vacancyMatchSetEduDegree.setVacancyMatchSetSeq(vacancyMatchSetSeq);
			compnyMatchDAO.deleteVacancyMatchSetEduDegree(vacancyMatchSetEduDegree);

			if(!StringUtil.isEmpty(param.getMinEduDegreeCd())) {
				String[] strArr = param.getMinEduDegreeCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetEduDegree.setMinEduDegreeCd(strArr[i]);
		    			ret += compnyMatchDAO.insertVacancyMatchSetEduDegree(vacancyMatchSetEduDegree);
		    		}
				}
			}
			// 우대조건
			VacancyMatchSetPreferntCondBean vacancyMatchSetPreferntCond = new VacancyMatchSetPreferntCondBean();
			vacancyMatchSetPreferntCond.setVacancyMatchSetSeq(vacancyMatchSetSeq);
			compnyMatchDAO.deleteVacancyMatchSetPreferntCond(vacancyMatchSetPreferntCond);

			if(!StringUtil.isEmpty(param.getPreferntCondCd())) {
				String[] strArr = param.getPreferntCondCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetPreferntCond.setPreferntCondCd(strArr[i]);
		    			ret = ret + compnyMatchDAO.insertVacancyMatchSetPreferntCond(vacancyMatchSetPreferntCond);
		    		}
				}
			}
			// 외국어
			VacancyMatchSetLangBean vacancyMatchSetLang = new VacancyMatchSetLangBean();
			vacancyMatchSetLang.setVacancyMatchSetSeq(vacancyMatchSetSeq);
			compnyMatchDAO.deleteVacancyMatchSetLang(vacancyMatchSetLang);

			if(!StringUtil.isEmpty(param.getLangCd())) {
				String[] strArr = param.getLangCd().split(ConstVal.COMMA_VAL);
				if(strArr != null && strArr.length > 0) {
		    		for(int i=0; i<strArr.length; i++) {
		    			vacancyMatchSetLang.setLangCd(strArr[i]);
		    			ret = ret + compnyMatchDAO.insertVacancyMatchSetLang(vacancyMatchSetLang);
		    		}
				}
			}
		}
		return ret;
	}

	/**
	 * 맞춤 인재정보::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectVacancyMatchListCnt(VacancyMatchSetBean param) throws Exception {
		return compnyMatchDAO.selectVacancyMatchListCnt(param);
	}

	/**
	 * 맞춤 인재정보 목록
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<ResumeBean> selectVacancyMatchList(VacancyMatchSetBean param) throws Exception {
		return compnyMatchDAO.selectVacancyMatchList(param);
	}

}
