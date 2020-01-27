package ony.cpes.external.mypage.compny.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.bean.FileBean;
import ony.cmm.common.dao.CommDAO;
import ony.cmm.common.service.CommonService;
import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyLangBean;
import ony.cpes.external.mypage.compny.bean.VacancyLocBean;
import ony.cpes.external.mypage.compny.bean.VacancyPreferntBean;
import ony.cpes.external.mypage.compny.dao.CompnyVacancyDAO;
import ony.cpes.external.mypage.compny.service.CompnyVacancyService;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;
import ony.framework.util.StringUtil;


@Service("CompnyVacancyService")
public class CompnyVacancyServiceImpl implements CompnyVacancyService {

	@Autowired
	private CompnyVacancyDAO compnyVacancyDAO;

	@Autowired
	private CommDAO commDAO;

	@Autowired
	private CommonService commonService;

	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;

	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
    @Override
	public List<VacancyBean> selectVacancySimpleList(CondVacancyBean param) throws Exception {
		return compnyVacancyDAO.selectVacancySimpleList(param);
	}



	/**
	 * 구인 신규 등록
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
    @Override
	public String insertVacancy(VacancyBean vacancyBean) throws Exception {
		String uuid = "";
    	ConditionBean conditionBean = new ConditionBean();
    	uuid = commDAO.selectUUID(conditionBean);
    	vacancyBean.setVacancySeq(uuid);

    	if(!StringUtil.isEmpty(vacancyBean.getTempSeq())) {//임시저장번호가 존재할경우
    		compnyVacancyDAO.deleteVacancyLangTemp(vacancyBean);
    		compnyVacancyDAO.deleteVacancyPreferntTemp(vacancyBean);
    		compnyVacancyDAO.deleteVacancyLocTemp(vacancyBean);
    		compnyVacancyDAO.deleteVacancyTemp(vacancyBean);

    	}

    	String vacancyCertNo = compnyVacancyDAO.selectVacancyNum(null);
    	vacancyBean.setVacancyCertNo(vacancyCertNo);

    	int cnt = compnyVacancyDAO.insertVacancy(vacancyBean);
    	if(cnt > 0) {

    		VacancyLangBean vacancyLangBean = vacancyBean.getVacancyLangBean();
    		vacancyLangBean.setVacancySeq(uuid);
    		VacancyPreferntBean vacancyPreferntBean = vacancyBean.getVacancyPreferntBean();
    		vacancyPreferntBean.setVacancySeq(uuid);


    		String[] langCdArr = vacancyLangBean.getLangCd().split(ConstVal.COMMA_VAL);
    		String[] langLvlCdArr = vacancyLangBean.getLangLvlCdStr().split(ConstVal.COMMA_VAL);

    		if(langCdArr != null && langCdArr.length > 0) {
	    		for(int i=0; i<langCdArr.length; i++) {
	    			String langCd = langCdArr[i];
	    			String langLvlCd = langLvlCdArr[i];
	    			vacancyLangBean.setLangCd(langCd);
	    			vacancyLangBean.setLangLvlCd(langLvlCd);

	    			compnyVacancyDAO.insertVacancyLang(vacancyLangBean);
	    		}
    		}

    		String[] preferntCondCdArr = vacancyPreferntBean.getPreferntCondCd().split(ConstVal.COMMA_VAL);

    		if(preferntCondCdArr != null && preferntCondCdArr.length > 0) {
    			for(int i=0; i<preferntCondCdArr.length; i++) {
    				vacancyPreferntBean.setPreferntCondCd(preferntCondCdArr[i]);
    				compnyVacancyDAO.insertVacancyPrefernt(vacancyPreferntBean);
    			}
    		}
    		ObjectMapper mapper = new ObjectMapper();
    		List<VacancyLocBean> vacancyLocBeanList = mapper.readValue(vacancyBean.getAddrCd(), new TypeReference<List<VacancyLocBean>>(){});

    		for(VacancyLocBean vacancyLocBean : vacancyLocBeanList) {
    			vacancyLocBean.setVacancySeq(uuid);
    			vacancyLocBean.setRegUserSeq(vacancyBean.getRegUserSeq());
    			vacancyLocBean.setModUserSeq(vacancyBean.getModUserSeq());
    			compnyVacancyDAO.insertVacancyLoc(vacancyLocBean);
    		}


    		if(!StringUtil.isEmpty(vacancyBean.getUploadResult())) {
    			String resumeFileGrpSeq = commonService.dext5UploadInsert(vacancyBean.getUploadResult(), vacancyBean.getRegUserSeq(), "");
    			vacancyBean.setResumeFileGrpSeq(resumeFileGrpSeq);

    			compnyVacancyDAO.updateVacancy(vacancyBean);
    		}

    	} else {
    		uuid = "";
    	}


    	return uuid;
	}

	/**
	 * 구인 상세
	 * offer of a job detail
	 * @param param
	 * @return VacancyBean
	 */
    @Override
	public VacancyBean selectVacancy(CondVacancyBean param) throws Exception {
    	VacancyBean vacancyBean = null;
    	ObjectMapper mapper = new ObjectMapper();

    	if(StringUtils.pathEquals(ConstVal.NO_VAL, param.getCondTempYn())) {
    		vacancyBean =  compnyVacancyDAO.selectVacancy(param);
    		if(!StringUtils.isEmpty(vacancyBean)) {
    			vacancyBean.setVacancyLocBeanList(compnyVacancyDAO.selectVacancyLocList(param));
    			vacancyBean.setVacancyLangBeanList(compnyVacancyDAO.selectVacancyLangList(param));
    			vacancyBean.setVacancyPreferntBeanList(compnyVacancyDAO.selectVacancyPreferntList(param));
    		}
    	} else {//임시저장일경우 case temp
    		vacancyBean =  compnyVacancyDAO.selectVacancyTemp(param);
    		if(!StringUtils.isEmpty(vacancyBean)) {
    			vacancyBean.setVacancyLocBeanList(compnyVacancyDAO.selectVacancyLocTempList(param));
    			vacancyBean.setVacancyLangBeanList(compnyVacancyDAO.selectVacancyLangTempList(param));
    			vacancyBean.setVacancyPreferntBeanList(compnyVacancyDAO.selectVacancyPreferntTempList(param));
    		}
    	}



		return vacancyBean;
	}

	/**
	 * 구인 신규 등록
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
    @Override
	public String insertVacancyTemp(VacancyBean vacancyBean) throws Exception {
		String uuid = "";
    	ConditionBean conditionBean = new ConditionBean();
    	uuid = commDAO.selectUUID(conditionBean);
    	vacancyBean.setVacancySeq(uuid);

    	if(!StringUtil.isEmpty(vacancyBean.getTempSeq())) {//임시저장번호가 존재할경우
    		compnyVacancyDAO.deleteVacancyLangTemp(vacancyBean);
    		compnyVacancyDAO.deleteVacancyPreferntTemp(vacancyBean);
    		compnyVacancyDAO.deleteVacancyLocTemp(vacancyBean);
    		compnyVacancyDAO.deleteVacancyTemp(vacancyBean);
    	}

    	int cnt = compnyVacancyDAO.insertVacancyTemp(vacancyBean);
    	if(cnt > 0) {

    		VacancyLangBean vacancyLangBean = vacancyBean.getVacancyLangBean();
    		vacancyLangBean.setVacancySeq(uuid);
    		VacancyPreferntBean vacancyPreferntBean = vacancyBean.getVacancyPreferntBean();
    		vacancyPreferntBean.setVacancySeq(uuid);


    		if(!StringUtil.isEmpty(vacancyLangBean.getLangCd()) && !StringUtils.pathEquals(ConstVal.SPACE_VAL, vacancyLangBean.getLangCd())) {
	    		String[] langCdArr = vacancyLangBean.getLangCd().split(ConstVal.COMMA_VAL);
	    		String[] langLvlCdArr = vacancyLangBean.getLangLvlCdStr().split(ConstVal.COMMA_VAL);

	    		for(int i=0; i<langCdArr.length; i++) {
	    			String langCd = langCdArr[i];
	    			String langLvlCd = langLvlCdArr[i];
	    			vacancyLangBean.setLangCd(langCd);
	    			vacancyLangBean.setLangLvlCd(langLvlCd);

	    			compnyVacancyDAO.insertVacancyLangTemp(vacancyLangBean);
	    		}
    		}

    		if(!StringUtil.isEmpty(vacancyPreferntBean.getPreferntCondCd()) && !StringUtils.pathEquals(ConstVal.SPACE_VAL, vacancyPreferntBean.getPreferntCondCd())) {

	    		String[] preferntCondCdArr = vacancyPreferntBean.getPreferntCondCd().split(ConstVal.COMMA_VAL);


    			for(int i=0; i<preferntCondCdArr.length; i++) {
    				vacancyPreferntBean.setPreferntCondCd(preferntCondCdArr[i]);
    				compnyVacancyDAO.insertVacancyPreferntTemp(vacancyPreferntBean);
    			}

    		}

    		ObjectMapper mapper = new ObjectMapper();
    		List<VacancyLocBean> vacancyLocBeanList = mapper.readValue(vacancyBean.getAddrCd(), new TypeReference<List<VacancyLocBean>>(){});

    		for(VacancyLocBean vacancyLocBean : vacancyLocBeanList) {
    			vacancyLocBean.setVacancySeq(uuid);
    			vacancyLocBean.setRegUserSeq(vacancyBean.getRegUserSeq());
    			vacancyLocBean.setModUserSeq(vacancyBean.getModUserSeq());
    			compnyVacancyDAO.insertVacancyLocTemp(vacancyLocBean);
    		}

    		if(!StringUtil.isEmpty(vacancyBean.getUploadResult())) {
    			String resumeFileGrpSeq = commonService.dext5UploadInsert(vacancyBean.getUploadResult(), vacancyBean.getRegUserSeq(), "");
    			vacancyBean.setResumeFileGrpSeq(resumeFileGrpSeq);

    			compnyVacancyDAO.updateVacancyTemp(vacancyBean);
    		}

    	} else {
    		uuid = "";
    	}


    	return uuid;
	}


	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
    @Override
	public List<VacancyBean> selectVacancyList(CondVacancyBean param) throws Exception {
		if(StringUtils.pathEquals(ConstVal.TEMP_VAL, param.getCondStatCd())) {//임시 저장
			return  compnyVacancyDAO.selectVacancyTempList(param);
		} else {
			return  compnyVacancyDAO.selectVacancyList(param);
		}
	}


	/**
	 * 구인 목록 조회 count
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectVacancyListCnt(CondVacancyBean param) throws Exception {
		if(StringUtils.pathEquals(ConstVal.TEMP_VAL, param.getCondStatCd())) {//임시 저장
			return  compnyVacancyDAO.selectVacancyTempListCnt(param);
		} else {
			return  compnyVacancyDAO.selectVacancyListCnt(param);
		}
	}


	/**
	 * 구인 수정
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
    @Override
	public int updateVacancy(VacancyBean vacancyBean) throws Exception {

    	int result = compnyVacancyDAO.updateVacancy(vacancyBean);
    	if(result > 0) {
    		VacancyLangBean vacancyLangBean = vacancyBean.getVacancyLangBean();

    		VacancyPreferntBean vacancyPreferntBean = vacancyBean.getVacancyPreferntBean();

    		VacancyLocBean vacancyLocBean = vacancyBean.getVacancyLocBean();

    		compnyVacancyDAO.deleteVacancyLang(vacancyBean);
    		compnyVacancyDAO.deleteVacancyPrefernt(vacancyBean);
    		compnyVacancyDAO.deleteVacancyLoc(vacancyBean);


    		String[] langCdArr = vacancyLangBean.getLangCd().split(ConstVal.COMMA_VAL);
    		String[] langLvlCdArr = vacancyLangBean.getLangLvlCdStr().split(ConstVal.COMMA_VAL);

    		if(langCdArr != null && langCdArr.length > 0) {
	    		for(int i=0; i<langCdArr.length; i++) {
	    			String langCd = langCdArr[i];
	    			String langLvlCd = langLvlCdArr[i];
	    			vacancyLangBean.setLangCd(langCd);
	    			vacancyLangBean.setLangLvlCd(langLvlCd);

	    			compnyVacancyDAO.insertVacancyLang(vacancyLangBean);
	    		}
    		}

    		String[] preferntCondCdArr = vacancyPreferntBean.getPreferntCondCd().split(ConstVal.COMMA_VAL);

    		if(preferntCondCdArr != null && preferntCondCdArr.length > 0) {
    			for(int i=0; i<preferntCondCdArr.length; i++) {
    				vacancyPreferntBean.setPreferntCondCd(preferntCondCdArr[i]);
    				compnyVacancyDAO.insertVacancyPrefernt(vacancyPreferntBean);
    			}
    		}

    		ObjectMapper mapper = new ObjectMapper();
    		List<VacancyLocBean> vacancyLocBeanList = mapper.readValue(vacancyBean.getAddrCd(), new TypeReference<List<VacancyLocBean>>(){});

    		for(VacancyLocBean vacancyLoc : vacancyLocBeanList) {
    			vacancyLoc.setVacancySeq(vacancyBean.getVacancySeq());
    			vacancyLoc.setRegUserSeq(vacancyBean.getRegUserSeq());
    			vacancyLoc.setModUserSeq(vacancyBean.getModUserSeq());
    			compnyVacancyDAO.insertVacancyLoc(vacancyLoc);
    		}

    		if(!StringUtil.isEmpty(vacancyBean.getUploadResult())) {
    			String resumeFileGrpSeq = commonService.dext5UploadInsert(vacancyBean.getUploadResult(), vacancyBean.getRegUserSeq(), vacancyBean.getResumeFileGrpSeq());
    			vacancyBean.setResumeFileGrpSeq(resumeFileGrpSeq);

    			compnyVacancyDAO.updateVacancy(vacancyBean);
    		}

    	}


    	return result;
	}


	/**
	 * 구인 수정
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
    @Override
	public int updateVacancyTemp(VacancyBean vacancyBean) throws Exception {

    	int result = compnyVacancyDAO.updateVacancyTemp(vacancyBean);
    	if(result > 0) {
    		VacancyLangBean vacancyLangBean = vacancyBean.getVacancyLangBean();

    		VacancyPreferntBean vacancyPreferntBean = vacancyBean.getVacancyPreferntBean();

    		VacancyLocBean vacancyLocBean = vacancyBean.getVacancyLocBean();

    		compnyVacancyDAO.deleteVacancyLangTemp(vacancyBean);
    		compnyVacancyDAO.deleteVacancyPreferntTemp(vacancyBean);
    		compnyVacancyDAO.deleteVacancyLocTemp(vacancyBean);


    		if(!StringUtil.isEmpty(vacancyLangBean.getLangCd()) && !StringUtils.pathEquals(ConstVal.SPACE_VAL, vacancyLangBean.getLangCd())) {
	    		String[] langCdArr = vacancyLangBean.getLangCd().split(ConstVal.COMMA_VAL);
	    		String[] langLvlCdArr = vacancyLangBean.getLangLvlCdStr().split(ConstVal.COMMA_VAL);

	    		if(langCdArr != null && langCdArr.length > 0) {
		    		for(int i=0; i<langCdArr.length; i++) {
		    			String langCd = langCdArr[i];
		    			String langLvlCd = langLvlCdArr[i];
		    			vacancyLangBean.setLangCd(langCd);
		    			vacancyLangBean.setLangLvlCd(langLvlCd);

		    			compnyVacancyDAO.insertVacancyLangTemp(vacancyLangBean);
		    		}
	    		}
    		}

    		if(!StringUtil.isEmpty(vacancyPreferntBean.getPreferntCondCd()) && !StringUtils.pathEquals(ConstVal.SPACE_VAL, vacancyPreferntBean.getPreferntCondCd())) {
	    		String[] preferntCondCdArr = vacancyPreferntBean.getPreferntCondCd().split(ConstVal.COMMA_VAL);

	    		if(preferntCondCdArr != null && preferntCondCdArr.length > 0) {
	    			for(int i=0; i<preferntCondCdArr.length; i++) {
	    				vacancyPreferntBean.setPreferntCondCd(preferntCondCdArr[i]);
	    				compnyVacancyDAO.insertVacancyPreferntTemp(vacancyPreferntBean);
	    			}
	    		}
    		}

    		ObjectMapper mapper = new ObjectMapper();
    		List<VacancyLocBean> vacancyLocBeanList = mapper.readValue(vacancyBean.getAddrCd(), new TypeReference<List<VacancyLocBean>>(){});

    		for(VacancyLocBean vacancyLoc : vacancyLocBeanList) {
    			vacancyLoc.setVacancySeq(vacancyBean.getVacancySeq());
    			vacancyLoc.setRegUserSeq(vacancyBean.getRegUserSeq());
    			vacancyLoc.setModUserSeq(vacancyBean.getModUserSeq());
    			compnyVacancyDAO.insertVacancyLoc(vacancyLoc);
    		}

    		if(!StringUtil.isEmpty(vacancyBean.getUploadResult())) {
    			String resumeFileGrpSeq = commonService.dext5UploadInsert(vacancyBean.getUploadResult(), vacancyBean.getRegUserSeq(), vacancyBean.getResumeFileGrpSeq());
    			vacancyBean.setResumeFileGrpSeq(resumeFileGrpSeq);

    			compnyVacancyDAO.updateVacancyTemp(vacancyBean);
    		}

    	}


    	return result;
	}


	/**
	 * 구인 삭제
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
    @Override
	public int deleteVacancyTemp(VacancyBean vacancyBean) throws Exception {
    	compnyVacancyDAO.deleteVacancyLangTemp(vacancyBean);
    	compnyVacancyDAO.deleteVacancyPreferntTemp(vacancyBean);
    	compnyVacancyDAO.deleteVacancyLocTemp(vacancyBean);
    	return compnyVacancyDAO.deleteVacancyTemp(vacancyBean);
    }


	/**
	 * 구인 삭제
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
    @Override
	public int deleteVacancy(VacancyBean vacancyBean) throws Exception {
    	return compnyVacancyDAO.deleteVacancy(vacancyBean);
    }

	/**
	 * 기업별 채용공고 상태 count
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
    @Override
	public VacancyBean selectVacancyCntInfo(CondVacancyBean param) throws Exception {
    	return compnyVacancyDAO.selectVacancyCntInfo(param);
	}


	/**
	 * 채용마감
	 * vacancy close process
	 * @param param
	 * @return int
	 */
    @Override
	public int closeVacancy(CondVacancyBean param) throws Exception {
    	return compnyVacancyDAO.closeVacancy(param);
	}


	/**
	 * 면접제의 목록 조회 count
	 * interview  list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectIntvwListCnt(CondVacancyBean param) throws Exception {
    	return compnyVacancyDAO.selectIntvwListCnt(param);
	}


	/**
	 * 면접제의 목록 조회
	 * interview  list
	 * @param param
	 * @return List<IntvwBean>
	 */
    @Override
	public List<IntvwBean> selectIntvwList(CondVacancyBean param) throws Exception {
    	return compnyVacancyDAO.selectIntvwList(param);
	}


	/**
	 * 면접 삭제
	 * interview delete
	 * @param param
	 * @return int
	 */
	public int deleteIntvw(CondApplicBean param) throws Exception {
    	int result = 0;

    	if(StringUtil.isEmpty(param.getCondStr())) {
    		return 0;
    	} else {
    		String[] strArr = param.getCondStr().split(ConstVal.COMMA_VAL);

    		if(strArr != null && strArr.length > 0) {
        		for(int i=0; i<strArr.length; i++) {

        			param.setCondSeq(strArr[i].split(ConstVal.UNDER_VAR_VAL)[0]);
        			param.setCondSeq2(strArr[i].split(ConstVal.UNDER_VAR_VAL)[1]);

        			result = result + compnyVacancyDAO.deleteIntvw(param);

        		}
    		}
    	}

    	return result;
	}
}
