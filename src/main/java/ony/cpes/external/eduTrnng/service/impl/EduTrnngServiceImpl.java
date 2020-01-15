package ony.cpes.external.eduTrnng.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cpes.external.eduTrnng.dao.EduTrnngDAO;
import ony.cpes.external.eduTrnng.service.EduTrnngService;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngBean;
import ony.cpes.external.mypage.instt.bean.CondEduTrnngFreeBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngNeaBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngSoftSkillBean;

@Service("EduTrnngService")
public class EduTrnngServiceImpl implements EduTrnngService {
	@Autowired
	private EduTrnngDAO eduTrnngDAO;


	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;



	/**
	 * 교육 프로그램 상세
	 * education tranning detail
	 * @param param
	 * @return EduTrnngBean
	 */
    @Override
	public EduTrnngBean selectEduTrnng(CondEduTrnngBean param) throws Exception {
		return eduTrnngDAO.selectEduTrnng(param);
	}

    /**
     * education soft skill detail
     * @param param
     * @return EduTrnngBean
     */
    @Override
    public EduTrnngSoftSkillBean selectEduTrnngSoftSkill(CondEduTrnngBean param) throws Exception {
    	return eduTrnngDAO.selectEduTrnngSoftSkill(param);
    }

	/**
	 * edu training user count
	 * @param param
	 * @return
	 */
    @Override
    public int selectEduTrnngByTrnngUserCnt(CondEduTrnngBean param) throws Exception {
    	return eduTrnngDAO.selectEduTrnngByTrnngUserCnt(param);
    }

    @Override
    public int insertEduTrnngByTrnngUser(EduTrnngBean param) throws Exception {
    	return eduTrnngDAO.insertEduTrnngByTrnngUser(param);
    }

	/**
	 * 교육 프로그램 목록 count
	 * education tranning list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectEduTrnngListCnt(CondEduTrnngBean param) throws Exception {
		return eduTrnngDAO.selectEduTrnngListCnt(param);
	}


	/**
	 * 교육 프로그램 목록
	 * education tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
    @Override
	public List<EduTrnngBean> selectEduTrnngList(CondEduTrnngBean param) throws Exception {
		return eduTrnngDAO.selectEduTrnngList(param);
	}

    /**
     * education tranning free list count
     * @param param
     * @return int
     */
    @Override
    public int selectEduTrnngFreeListCnt(CondEduTrnngFreeBean param) throws Exception {
    	return eduTrnngDAO.selectEduTrnngFreeListCnt(param);
    }

    /**
     * education tranning free list
     * @param param
     * @return List<EduTrnngBean>
     */
    @Override
    public List<EduTrnngBean> selectEduTrnngFreeList(CondEduTrnngFreeBean param) throws Exception {
    	return eduTrnngDAO.selectEduTrnngFreeList(param);
    }

    /**
     * education tranning list count by location
     * @param param
     * @return int
     */
    @Override
    public int selectEduTrnngLocListCnt(CondEduTrnngFreeBean param) throws Exception {
    	return eduTrnngDAO.selectEduTrnngLocListCnt(param);
    }

    /**
     * education tranning list by location
     * @param param
     * @return List<EduTrnngBean>
     */
    @Override
    public List<EduTrnngBean> selectEduTrnngLocList(CondEduTrnngFreeBean param) throws Exception {
    	return eduTrnngDAO.selectEduTrnngLocList(param);
    }

	/**
	 * 직업훈련 목록 count
	 * nea tranning list count
	 * @param param
	 * @return int
	 */
    @Override
	public int selectEduTrnngNeaListCnt(CondEduTrnngFreeBean param) throws Exception {
		return eduTrnngDAO.selectEduTrnngNeaListCnt(param);
	}


	/**
	 * 직업훈련 목록
	 * nea tranning list
	 * @param param
	 * @return List<EduTrnngBean>
	 */
    @Override
	public List<EduTrnngNeaBean> selectEduTrnngNeaList(CondEduTrnngFreeBean param) throws Exception {
		return eduTrnngDAO.selectEduTrnngNeaList(param);
	}

    /**
     * soft skill tranning list count
     * @param param
     * @return int
     */
    @Override
    public int selectEduTrnngSoftSkillListCnt(CondEduTrnngFreeBean param) throws Exception {
    	return eduTrnngDAO.selectEduTrnngSoftSkillListCnt(param);
    }


    /**
     * soft skill tranning list
     * @param param
     * @return List<EduTrnngBean>
     */
    @Override
    public List<EduTrnngNeaBean> selectEduTrnngSoftSkillList(CondEduTrnngFreeBean param) throws Exception {
    	return eduTrnngDAO.selectEduTrnngSoftSkillList(param);
    }

}
