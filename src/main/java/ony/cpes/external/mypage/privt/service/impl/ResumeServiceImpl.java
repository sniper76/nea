package ony.cpes.external.mypage.privt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.CommDtlCdBean;
import ony.cmm.common.bean.ConditionBean;
import ony.cmm.common.service.CommonService;
import ony.cpes.external.mypage.privt.bean.JobskReqBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;
import ony.cpes.external.mypage.privt.bean.ResumeDisablBean;
import ony.cpes.external.mypage.privt.bean.ResumeGenrlEduBean;
import ony.cpes.external.mypage.privt.bean.ResumeHopeWorkLocBean;
import ony.cpes.external.mypage.privt.bean.ResumeIscoBean;
import ony.cpes.external.mypage.privt.bean.ResumeLangBean;
import ony.cpes.external.mypage.privt.bean.ResumeOtherTrnngBean;
import ony.cpes.external.mypage.privt.bean.ResumeRefManBean;
import ony.cpes.external.mypage.privt.bean.ResumeSkillBean;
import ony.cpes.external.mypage.privt.bean.ResumeSpecialStudyBean;
import ony.cpes.external.mypage.privt.bean.ResumeWorkExpBean;
import ony.cpes.external.mypage.privt.dao.ResumeDAO;
import ony.cpes.external.mypage.privt.service.ResumeService;
import ony.framework.util.StringUtil;

@Service("ResumeService")
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private ResumeDAO resumeDAO;

	@Autowired
	private CommonService commonService;

	/**
	 * skill_cd 리스트 그룹화를 위한 별도 분리
	 */
	@Override
	public List<CommDtlCdBean> selectSkillCdList(ConditionBean conditionBean) throws Exception {
		List<CommDtlCdBean> resultList = new ArrayList<CommDtlCdBean>();
		List<CommDtlCdBean> skillCdList = commonService.selectCommCdList(conditionBean);

		for(CommDtlCdBean cdBean : skillCdList) {
			int cd = Integer.parseInt(cdBean.getDtlCd().substring(3));
			int check = cd % 100;

			/*
			 *  10으로 나누어 떨어질때
			 *  DTL_CD 의 문자열 부분을 지우고 (SKI)
			 *  나머지 숫자 부분의 끝자리가 0인지 체크
			 *
			 */
			if(check == 0) {
				cdBean.setList(new ArrayList<CommDtlCdBean>());
				resultList.add(cdBean);
			}else {
				for(CommDtlCdBean checkBean : resultList) {
					int sameCheck = Integer.parseInt(checkBean.getDtlCd().substring(3));

					if((cd / 100) == (sameCheck / 100)) {
						checkBean.getList().add(cdBean);
					}
				}
			}

		}

		return resultList;
	}

	@Override
	public int insertResume(ResumeBean param){
		int result = 0;

		int totCnt = resumeDAO.selectResumeTotCnt(param);

		if(totCnt < 5) {
			result = resumeDAO.insertResume(param);

			if(result == 1) {
				ObjectMapper mapper = new ObjectMapper();

				try {
					// 희망 근무 지역 등록
					List<ResumeHopeWorkLocBean> hopeLockList = mapper.readValue(param.getHopeWorkLocListStr(), new TypeReference<List<ResumeHopeWorkLocBean>>(){});

					for(ResumeHopeWorkLocBean hopeLockBean : hopeLockList) {
						hopeLockBean.setResumeSeq(param.getResumeSeq());
						hopeLockBean.setRegUserSeq(param.getRegUserSeq());
						hopeLockBean.setModUserSeq(param.getModUserSeq());
						hopeLockBean.setTempFlag(param.getTempFlag());
						resumeDAO.insertResumeHopeWorkLoc(hopeLockBean);
					}

					// 연구 및 전문분야 등록
					List<ResumeSpecialStudyBean> specialStudyList = mapper.readValue(param.getSpecialStudyListStr(), new TypeReference<List<ResumeSpecialStudyBean>>(){});

					for(ResumeSpecialStudyBean specialStudyBean : specialStudyList) {
						specialStudyBean.setResumeSeq(param.getResumeSeq());
						specialStudyBean.setRegUserSeq(param.getRegUserSeq());
						specialStudyBean.setModUserSeq(param.getModUserSeq());
						specialStudyBean.setTempFlag(param.getTempFlag());
						resumeDAO.insertResumeSpecialStudy(specialStudyBean);
					}

					// 자격증 보유 여부 등록

					// 기타교육 등록
					List<ResumeOtherTrnngBean> otherTrnngList = mapper.readValue(param.getOtherTrnngListStr(), new TypeReference<List<ResumeOtherTrnngBean>>(){});

					for(ResumeOtherTrnngBean otherTrnngBean : otherTrnngList) {
						otherTrnngBean.setResumeSeq(param.getResumeSeq());
						otherTrnngBean.setRegUserSeq(param.getRegUserSeq());
						otherTrnngBean.setModUserSeq(param.getModUserSeq());
						otherTrnngBean.setTempFlag(param.getTempFlag());
						resumeDAO.insertResumeOtherTrnng(otherTrnngBean);
					}

					// 어학 등록
					List<ResumeLangBean> langList = mapper.readValue(param.getLangListStr(), new TypeReference<List<ResumeLangBean>>(){});

					for(ResumeLangBean langBean : langList) {
						langBean.setResumeSeq(param.getResumeSeq());
						langBean.setRegUserSeq(param.getRegUserSeq());
						langBean.setModUserSeq(param.getModUserSeq());
						langBean.setTempFlag(param.getTempFlag());

						if(ConstVal.LANG_TYPE_NM_NATIVE.equals(langBean.getLangTypeCd())) {
							langBean.setLangTypeCd(ConstVal.LANG_TYPE_CD_NATIVE);
						}else if(ConstVal.LANG_TYPE_NM_FOREIGN_LANGUAGE.equals(langBean.getLangTypeCd())){
							langBean.setLangTypeCd(ConstVal.LANG_TYPE_CD_FOREIGN_LANGUAGE);
						}
						resumeDAO.insertResumeLang(langBean);
					}

					// 경력 등록
					List<ResumeWorkExpBean> workExpList = mapper.readValue(param.getWorkExpListStr(), new TypeReference<List<ResumeWorkExpBean>>(){});

					for(ResumeWorkExpBean workExpBean : workExpList) {
						workExpBean.setResumeSeq(param.getResumeSeq());
						workExpBean.setRegUserSeq(param.getRegUserSeq());
						workExpBean.setModUserSeq(param.getModUserSeq());
						workExpBean.setTempFlag(param.getTempFlag());
						resumeDAO.insertResumeWorkExp(workExpBean);
					}

					// skill 등록
					List<String> skillList = mapper.readValue(param.getSkillListStr(), new TypeReference<List<String>>(){});

					for(String skillCd : skillList) {

						ResumeSkillBean skillBean = new ResumeSkillBean();
						skillBean.setResumeSeq(param.getResumeSeq());
						skillBean.setRegUserSeq(param.getRegUserSeq());
						skillBean.setModUserSeq(param.getModUserSeq());
						skillBean.setSkillCd(skillCd);
						skillBean.setTempFlag(param.getTempFlag());
						resumeDAO.insertResumeSkill(skillBean);
					}

					// 추천인 등록
					List<ResumeRefManBean> refManList = mapper.readValue(param.getRefManListStr(), new TypeReference<List<ResumeRefManBean>>(){});

					for(ResumeRefManBean refManBean : refManList) {
						refManBean.setResumeSeq(param.getResumeSeq());
						refManBean.setRegUserSeq(param.getRegUserSeq());
						refManBean.setModUserSeq(param.getModUserSeq());
						refManBean.setTempFlag(param.getTempFlag());
						resumeDAO.insertResumeRefMan(refManBean);
					}

					// 장애 여부 등록
					List<String> disableList = mapper.readValue(param.getDisableListStr(), new TypeReference<List<String>>(){});

					for(String disableCd : disableList) {
						ResumeDisablBean disableBean = new ResumeDisablBean();
						disableBean.setResumeSeq(param.getResumeSeq());
						disableBean.setRegUserSeq(param.getRegUserSeq());
						disableBean.setModUserSeq(param.getModUserSeq());
						disableBean.setDisableCd(disableCd);
						disableBean.setTempFlag(param.getTempFlag());
						resumeDAO.insertResumeDisable(disableBean);
					}

					// 일반교육 등록
					ResumeGenrlEduBean genrlBean = new ResumeGenrlEduBean();
					genrlBean.setResumeSeq(param.getResumeSeq());
					genrlBean.setRegUserSeq(param.getRegUserSeq());
					genrlBean.setModUserSeq(param.getModUserSeq());
					genrlBean.setEduDegreeCd(param.getGenrlEduListStr());
					genrlBean.setTempFlag(param.getTempFlag());
					resumeDAO.insertResumeGenrlEdu(genrlBean);

					// 직종
					List<ResumeIscoBean> iscoCdList = mapper.readValue(param.getIscoCdListStr(), new TypeReference<List<ResumeIscoBean>>(){});

					for(ResumeIscoBean iscoBean : iscoCdList) {
						iscoBean.setResumeSeq(param.getResumeSeq());
						iscoBean.setRegUserSeq(param.getRegUserSeq());
						iscoBean.setModUserSeq(param.getModUserSeq());
						iscoBean.setTempFlag(param.getTempFlag());
						resumeDAO.insertResumeIsco(iscoBean);
					}

				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}else {
			result = 99;
		}

		return result;
	}

	@Override
	public List<ResumeBean> selectMyResumeList(ResumeBean param) {
		return resumeDAO.selectMyResumeList(param);
	}

	@Override
	public int updateResume(ResumeBean param) {
		int result = 0;
		String tempResumeCheck = resumeDAO.selectTempResumeCheck(param);

		if("10".equals(tempResumeCheck)) {
			result = resumeDAO.updateResume(param);
		}else if("20".equals(tempResumeCheck)) {
			if("1".equals(param.getTempFlag())) {
				result = resumeDAO.updateResume(param);
			}else {
				resumeDAO.deleteResume(param);
				result = resumeDAO.insertResume(param);
			}
		}else {
			result = 99;
		}

		ObjectMapper mapper = new ObjectMapper();

		try {
			// 희망 근무 지역
			if(!StringUtil.isEmpty(param.getHopeWorkLocListStr())) {
				resumeDAO.deleteResumeHopeWorkLoc(param);
				List<ResumeHopeWorkLocBean> hopeLockList = mapper.readValue(param.getHopeWorkLocListStr(), new TypeReference<List<ResumeHopeWorkLocBean>>(){});

				for(ResumeHopeWorkLocBean hopeLockBean : hopeLockList) {
					hopeLockBean.setResumeSeq(param.getResumeSeq());
					hopeLockBean.setRegUserSeq(param.getRegUserSeq());
					hopeLockBean.setModUserSeq(param.getModUserSeq());
					hopeLockBean.setTempFlag(param.getTempFlag());
					resumeDAO.insertResumeHopeWorkLoc(hopeLockBean);
				}
			}

			// 연구 및 전문분야 등록
			if(!StringUtil.isEmpty(param.getSpecialStudyListStr())) {
				resumeDAO.deleteResumeSpecialStudy(param);
				List<ResumeSpecialStudyBean> specialStudyList = mapper.readValue(param.getSpecialStudyListStr(), new TypeReference<List<ResumeSpecialStudyBean>>(){});

				for(ResumeSpecialStudyBean specialStudyBean : specialStudyList) {
					specialStudyBean.setResumeSeq(param.getResumeSeq());
					specialStudyBean.setRegUserSeq(param.getRegUserSeq());
					specialStudyBean.setModUserSeq(param.getModUserSeq());
					specialStudyBean.setTempFlag(param.getTempFlag());
					resumeDAO.insertResumeSpecialStudy(specialStudyBean);
				}
			}


			// 자격증 보유 여부 등록

			// 기타교육 등록
			if(!StringUtil.isEmpty(param.getOtherTrnngListStr())) {
				resumeDAO.deleteResumeOtherTrnng(param);
				List<ResumeOtherTrnngBean> otherTrnngList = mapper.readValue(param.getOtherTrnngListStr(), new TypeReference<List<ResumeOtherTrnngBean>>(){});

				for(ResumeOtherTrnngBean otherTrnngBean : otherTrnngList) {
					otherTrnngBean.setResumeSeq(param.getResumeSeq());
					otherTrnngBean.setRegUserSeq(param.getRegUserSeq());
					otherTrnngBean.setModUserSeq(param.getModUserSeq());
					otherTrnngBean.setTempFlag(param.getTempFlag());
					resumeDAO.insertResumeOtherTrnng(otherTrnngBean);
				}
			}

			// 어학 등록
			if(!StringUtil.isEmpty(param.getLangListStr())) {
				resumeDAO.deleteResumeLang(param);
				List<ResumeLangBean> langList = mapper.readValue(param.getLangListStr(), new TypeReference<List<ResumeLangBean>>(){});

				for(ResumeLangBean langBean : langList) {
					langBean.setResumeSeq(param.getResumeSeq());
					langBean.setRegUserSeq(param.getRegUserSeq());
					langBean.setModUserSeq(param.getModUserSeq());
					langBean.setTempFlag(param.getTempFlag());

					if(ConstVal.LANG_TYPE_NM_NATIVE.equals(langBean.getLangTypeCd())) {
						langBean.setLangTypeCd(ConstVal.LANG_TYPE_CD_NATIVE);
					}else if(ConstVal.LANG_TYPE_NM_FOREIGN_LANGUAGE.equals(langBean.getLangTypeCd())){
						langBean.setLangTypeCd(ConstVal.LANG_TYPE_CD_FOREIGN_LANGUAGE);
					}
					resumeDAO.insertResumeLang(langBean);
				}
			}

			// 경력 등록
			if(!StringUtil.isEmpty(param.getWorkExpListStr())) {
				resumeDAO.deleteResumeWorkExp(param);
				List<ResumeWorkExpBean> workExpList = mapper.readValue(param.getWorkExpListStr(), new TypeReference<List<ResumeWorkExpBean>>(){});

				for(ResumeWorkExpBean workExpBean : workExpList) {
					workExpBean.setResumeSeq(param.getResumeSeq());
					workExpBean.setRegUserSeq(param.getRegUserSeq());
					workExpBean.setModUserSeq(param.getModUserSeq());
					workExpBean.setTempFlag(param.getTempFlag());
					resumeDAO.insertResumeWorkExp(workExpBean);
				}
			}

			// skill 등록
			if(!StringUtil.isEmpty(param.getSkillListStr())) {
				resumeDAO.deleteResumeSkill(param);
				List<String> skillList = mapper.readValue(param.getSkillListStr(), new TypeReference<List<String>>(){});

				for(String skillCd : skillList) {

					ResumeSkillBean skillBean = new ResumeSkillBean();
					skillBean.setResumeSeq(param.getResumeSeq());
					skillBean.setRegUserSeq(param.getRegUserSeq());
					skillBean.setModUserSeq(param.getModUserSeq());
					skillBean.setSkillCd(skillCd);
					skillBean.setTempFlag(param.getTempFlag());
					resumeDAO.insertResumeSkill(skillBean);
				}
			}

			// 추천인 등록
			if(!StringUtil.isEmpty(param.getRefManListStr())) {
				resumeDAO.deleteResumeRefMan(param);
				List<ResumeRefManBean> refManList = mapper.readValue(param.getRefManListStr(), new TypeReference<List<ResumeRefManBean>>(){});

				for(ResumeRefManBean refManBean : refManList) {
					refManBean.setResumeSeq(param.getResumeSeq());
					refManBean.setRegUserSeq(param.getRegUserSeq());
					refManBean.setModUserSeq(param.getModUserSeq());
					refManBean.setTempFlag(param.getTempFlag());
					resumeDAO.insertResumeRefMan(refManBean);
				}
			}

			// 장애 여부 등록
			if(!StringUtil.isEmpty(param.getDisableListStr())) {
				resumeDAO.deleteResumeDisabl(param);
				List<String> disableList = mapper.readValue(param.getDisableListStr(), new TypeReference<List<String>>(){});

				for(String disableCd : disableList) {
					ResumeDisablBean disableBean = new ResumeDisablBean();
					disableBean.setResumeSeq(param.getResumeSeq());
					disableBean.setRegUserSeq(param.getRegUserSeq());
					disableBean.setModUserSeq(param.getModUserSeq());
					disableBean.setDisableCd(disableCd);
					disableBean.setTempFlag(param.getTempFlag());
					resumeDAO.insertResumeDisable(disableBean);
				}
			}

			// 일반교육 등록
			if(!StringUtil.isEmpty(param.getGenrlEduListStr())) {
				resumeDAO.deleteResumeGenrlEdu(param);
				ResumeGenrlEduBean genrlBean = new ResumeGenrlEduBean();
				genrlBean.setResumeSeq(param.getResumeSeq());
				genrlBean.setRegUserSeq(param.getRegUserSeq());
				genrlBean.setModUserSeq(param.getModUserSeq());
				genrlBean.setEduDegreeCd(param.getGenrlEduListStr());
				genrlBean.setTempFlag(param.getTempFlag());
				resumeDAO.insertResumeGenrlEdu(genrlBean);
			}

			// 직종
			if(!StringUtil.isEmpty(param.getIscoCdListStr())) {
				resumeDAO.deleteResumeIsco(param);
				List<ResumeIscoBean> iscoCdList = mapper.readValue(param.getIscoCdListStr(), new TypeReference<List<ResumeIscoBean>>(){});

				for(ResumeIscoBean iscoBean : iscoCdList) {
					iscoBean.setResumeSeq(param.getResumeSeq());
					iscoBean.setRegUserSeq(param.getRegUserSeq());
					iscoBean.setModUserSeq(param.getModUserSeq());
					iscoBean.setTempFlag(param.getTempFlag());
					resumeDAO.insertResumeIsco(iscoBean);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int resetPriResumeYn(ResumeBean param) {
		return resumeDAO.resetPriResumeYn(param);
	}

	/**
	 * 이력서 삭제
	 * result
	 * 10 : 입사지원 중
	 * 20 : 채용알선이 진행중
	 * 30 : 입사지원 and 채용알선 진행중
	 * 40 : 데이터 오류 (이력서 / 임시 이력서 둘 다 존재하거나, 둘 다 존재하지 않음)
	 * 50 : 삭제 처리 실패
	 * 99 : 삭제 처리 완료
	 */
	@Override
	public String deleteResume(ResumeBean param) {
		String result = "";

		String tempResumeCheck = resumeDAO.selectTempResumeCheck(param);
		param.setTempCheck(tempResumeCheck);

		if("10".equals(tempResumeCheck)) {
			String deleteValidateion = resumeDAO.selectDeleteValidation(param);
			if(!"99".equals(deleteValidateion)) {
				result = deleteValidateion;
				return result;
			}

		}else if("30".equals(tempResumeCheck)){
			result = "40";
			return result;
		}

		int deleteCnt = resumeDAO.deleteResume(param);

		if(deleteCnt > 0) {
			result = "99";
		}else {
			result = "50";
		}

		return result;
	}

	@Override
	public ResumeBean selectResumeDetail(ResumeBean param) {
		ResumeBean result = resumeDAO.selectResumeDetail(param);
		if(result.getResumeKeyword() != null && !"".equals(result.getResumeKeyword())) {
			result.setResumeKeywordList(result.getResumeKeyword().split(","));
		}

		if(result.getProLicnsSpec() != null && !"".equals(result.getProLicnsSpec())) {
			result.setProLicnsSpecList(result.getProLicnsSpec().split(","));
		}
		return result;
	}

	@Override
	public List<ResumeHopeWorkLocBean> selectResumeHopeWorkLocDetail(ResumeBean param) {
		return resumeDAO.selectResumeHopeWorkLocDetail(param);
	}

	@Override
	public List<ResumeSpecialStudyBean> selectResumeSpecialStudyDetail(ResumeBean param) {
		return resumeDAO.selectResumeSpecialStudyDetail(param);
	}

	@Override
	public List<ResumeOtherTrnngBean> selectResumeOtherTrnngDetail(ResumeBean param) {
		return resumeDAO.selectResumeOtherTrnngDetail(param);
	}

	@Override
	public ResumeLangBean selectResumeLangDetail(ResumeBean param) {
		List<ResumeLangBean> result = resumeDAO.selectResumeLangDetail(param);
		ResumeLangBean resultBean = null;
		List<ResumeLangBean> resultList = new ArrayList<ResumeLangBean>();
		for(ResumeLangBean resumeLangBean : result) {
			if(ConstVal.LANG_TYPE_CD_NATIVE.equals(resumeLangBean.getLangTypeCd())) {
				resultBean = resumeLangBean;
			}else if(ConstVal.LANG_TYPE_CD_FOREIGN_LANGUAGE.equals(resumeLangBean.getLangTypeCd())) {
				resultList.add(resumeLangBean);
			}
		}

		if(resultBean != null) {
			resultBean.setList(resultList);
		}

		return resultBean;
	}

	@Override
	public List<ResumeWorkExpBean> selectResumeWorkExpDetail(ResumeBean param) {
		return resumeDAO.selectResumeWorkExpDetail(param);
	}

	@Override
	public List<ResumeSkillBean> selectResumeSkillDetail(ResumeBean param) {
		return resumeDAO.selectResumeSkillDetail(param);
	}

	@Override
	public List<ResumeRefManBean> selectResumeRefManDetail(ResumeBean param) {
		return resumeDAO.selectResumeRefManDetail(param);
	}

	@Override
	public List<ResumeDisablBean> selectResumeDisableDetail(ResumeBean param) {
		return resumeDAO.selectResumeDisableDetail(param);
	}

	@Override
	public ResumeGenrlEduBean selectResumeGenrlEduDetail(ResumeBean param) {
		return resumeDAO.selectResumeGenrlEduDetail(param);
	}

	@Override
	public String selectTempResumeCheck(ResumeBean param) {
		return resumeDAO.selectTempResumeCheck(param);
	}

	@Override
	public JobskReqBean selectJobskReqDetail(ResumeBean param) {
		return resumeDAO.selectJobskReqDetail(param);
	}

	@Override
	public int updateJobskReq(ResumeBean param) {
		return resumeDAO.updateJobskReq(param);
	}

	@Override
	public List<CommDtlCdBean> selectResumeSkillForDetail(ResumeBean param) throws Exception {
		List<ResumeSkillBean> rskList = resumeDAO.selectResumeSkillDetail(param);

		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCondGrpCd(ConstVal.GRP_CD_SKILL_CD_VAL);
		List<CommDtlCdBean> skillCdList = selectSkillCdList(conditionBean);
		List<CommDtlCdBean> removeList = null;

		for(CommDtlCdBean skillBean : skillCdList) {
			removeList = new ArrayList<CommDtlCdBean>();

			for(CommDtlCdBean skill : skillBean.getList()) {
				boolean flag = false;
				for(ResumeSkillBean rsk : rskList) {
					if(skill.getDtlCd().equals(rsk.getSkillCd())) {
						flag = true;
					}
				}
				if(!flag) {
					removeList.add(skill);
				}
			}

			skillBean.getList().removeAll(removeList);
		}

		removeList = new ArrayList<CommDtlCdBean>();
		for(CommDtlCdBean skillBean : skillCdList) {

			if(skillBean.getList().size() == 0) {
				removeList.add(skillBean);
			}
		}

		skillCdList.removeAll(removeList);
		return skillCdList;
	}

	@Override
	public List<ResumeIscoBean> selectResumeIsco(ResumeBean param) {
		return resumeDAO.selectResumeIsco(param);
	}

	@Override
	public int selectPriResumeYnValidation(String param) {
		return resumeDAO.selectPriResumeYnValidation(param);
	}

	@Override
	public int deleteJobskReq(String param) {
		return resumeDAO.deleteJobskReq(param);
	}

	@Override
	public int deleteApplic(String param) {
		return resumeDAO.deleteApplic(param);
	}

	@Override
	public int deleteOffer(String param) {
		return resumeDAO.deleteOffer(param);
	}

	@Override
	public int deleteIntvw(String param) {
		return resumeDAO.deleteIntvw(param);
	}

	@Override
	public String selectPriResumeSeq(String param) {
		return resumeDAO.selectPriResumeSeq(param);
	}

}
