package ony.cpes.external.mypage.privt.service.impl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import ony.cmm.common.service.CommonService;
import ony.cpes.external.mypage.privt.bean.MatchingBean;
import ony.cpes.external.mypage.privt.bean.MatchingEduDegreeBean;
import ony.cpes.external.mypage.privt.bean.MatchingIscoBean;
import ony.cpes.external.mypage.privt.bean.MatchingLangBean;
import ony.cpes.external.mypage.privt.bean.MatchingLocBean;
import ony.cpes.external.mypage.privt.bean.MatchingPrivilegeBean;
import ony.cpes.external.mypage.privt.bean.MatchingSrchBean;
import ony.cpes.external.mypage.privt.dao.PrivtMatchingDAO;
import ony.cpes.external.mypage.privt.service.PrivtMatchingService;
import ony.cpes.external.vacancy.bean.VacancyBean;

@Service("PrivtMatchingService")
public class PrivtMatchingServiceImpl implements PrivtMatchingService {

	@Autowired
	private PrivtMatchingDAO matchingDAO;

	@Autowired
	private CommonService commonService;

	@Override
	public int selectMatchingCnt(MatchingBean param) throws Exception {
		return matchingDAO.selectMatchingCnt(param);
	}

	@Override
	public MatchingBean selectMatchingResumeByUser(MatchingBean param) throws Exception {
		return matchingDAO.selectMatchingResumeByUser(param);
	}

	@Override
	public MatchingBean selectMatchingMst(MatchingBean param) throws Exception {
		return matchingDAO.selectMatchingMst(param);
	}

	@Override
	public List<MatchingIscoBean> selectMatchingIscoList(MatchingBean param) throws Exception {
		return matchingDAO.selectMatchingIscoList(param);
	}

	@Override
	public List<MatchingLocBean> selectMatchingLocList(MatchingBean param) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MatchingLangBean> selectMatchingLangList(MatchingBean param) throws Exception {
		return matchingDAO.selectMatchingLangList(param);
	}

	@Override
	public List<MatchingEduDegreeBean> selectMatchingEduDegreeList(MatchingBean param) throws Exception {
		return matchingDAO.selectMatchingEduDegreeList(param);
	}

	@Override
	public int updateMatching(MatchingBean param) throws Exception {
		int result = matchingDAO.selectMatchingCnt(param);
		int saveResult = -1;

		if ( result > 0 ) {
			//update
			saveResult = matchingDAO.updateMatchingMst(param);

			matchingDAO.deleteMatchingEduDegree(param);
			matchingDAO.deleteMatchingPreferntCond(param);
			matchingDAO.deleteMatchingLang(param);
			matchingDAO.deleteMatchingLoc(param);
			matchingDAO.deleteMatchingIsco(param);

			insertMatchingDatas(param);
		}
		else {
			saveResult = matchingDAO.insertMatchingMst(param);
			if ( saveResult == 1 ) {
				insertMatchingDatas(param);
			}
		}

		return saveResult;
	}

	private void insertMatchingDatas(MatchingBean param) throws IOException, JsonParseException, JsonMappingException {
		ObjectMapper mapper = new ObjectMapper();

		List<MatchingIscoBean> iscoList = mapper.readValue(param.getIscoCdStr(), new TypeReference<List<MatchingIscoBean>>(){});
		for (MatchingIscoBean matchingIscoBean : iscoList) {
			matchingIscoBean.setJobskMatchSetSeq(param.getJobskMatchSetSeq());
			matchingDAO.insertMatchingIsco(matchingIscoBean);
		}

		List<MatchingLocBean> locList = mapper.readValue(param.getLocCdStr(), new TypeReference<List<MatchingLocBean>>(){});
		for (MatchingLocBean matchingLocBean : locList) {
			matchingLocBean.setJobskMatchSetSeq(param.getJobskMatchSetSeq());
			matchingDAO.insertMatchingLoc(matchingLocBean);
		}

		List<MatchingLangBean> langList = mapper.readValue(param.getLangCdStr(), new TypeReference<List<MatchingLangBean>>(){});
		for (MatchingLangBean matchingLangBean : langList) {
			matchingLangBean.setJobskMatchSetSeq(param.getJobskMatchSetSeq());
			matchingDAO.insertMatchingLang(matchingLangBean);
		}

		List<MatchingEduDegreeBean> eduDegreeList = mapper.readValue(param.getEduDegreeCdStr(), new TypeReference<List<MatchingEduDegreeBean>>(){});
		for (MatchingEduDegreeBean matchingEduDegreeBean : eduDegreeList) {
			matchingEduDegreeBean.setJobskMatchSetSeq(param.getJobskMatchSetSeq());
			matchingDAO.insertMatchingEduDegree(matchingEduDegreeBean);
		}

		List<MatchingPrivilegeBean> privilList = mapper.readValue(param.getPrivilegeCdStr(), new TypeReference<List<MatchingPrivilegeBean>>(){});
		for (MatchingPrivilegeBean privilegeBean : privilList) {
			privilegeBean.setJobskMatchSetSeq(param.getJobskMatchSetSeq());
			matchingDAO.insertMatchingPreferntCond(privilegeBean);
		}

	}

	@Override
	public int selectMatchingByVacancysCnt(MatchingSrchBean param) throws Exception {
		return matchingDAO.selectMatchingByVacancysCnt(param);
	}

	@Override
	public List<VacancyBean> selectMatchingByVacancys(MatchingSrchBean param) throws Exception {
		return matchingDAO.selectMatchingByVacancys(param);
	}

	/**
	 * select resume information by prior resume
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@Override
	public MatchingBean selectMatchingResume(String userSeq, String langCd) throws Exception {
		MatchingBean param = new MatchingBean();
		param.setUserSeq(userSeq);
		param.setLangCd(langCd);

		return matchingDAO.selectMatchingResume(param);
	}

	/**
	 * select vacancy count of auto matching
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectMatchingAutoCnt(MatchingBean param) throws Exception {
		return matchingDAO.selectMatchingAutoCnt(param);
	}

	/**
	 * select vacancy list of auto matching
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<VacancyBean> selectMatchingAutoList(MatchingBean param) throws Exception {
		return matchingDAO.selectMatchingAutoList(param);
	}

}
