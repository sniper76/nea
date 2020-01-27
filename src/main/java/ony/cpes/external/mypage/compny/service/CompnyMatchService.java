package ony.cpes.external.mypage.compny.service;

import java.util.List;

import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetEduDegreeBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetIscoBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetLangBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetLocBean;
import ony.cpes.external.mypage.compny.bean.VacancyMatchSetPreferntCondBean;
import ony.cpes.external.mypage.privt.bean.ResumeBean;

public interface CompnyMatchService {

	/**
	 * 해당 기업의 채용공고 목록
	 * @param userSeq
	 * @param langCd
	 * @param stsCd
	 * @return
	 * @throws Exception
	 */
	public List<VacancyBean> selectCompnyVacancyList(String userSeq, String langCd, String stsCd) throws Exception;
	public List<VacancyBean> selectCompnyVacancyList(String userSeq, String langCd) throws Exception;

	/**
	 *
	 * 해당 기업의 채용공고 정보 조회
	 * @param vacancySeq
	 * @param langCd
	 * @return
	 * @throws Exception
	 */
	public VacancyBean selectCompnyVacancy(String vacancySeq, String langCd) throws Exception;

	/**
	 * 기업의 오토매칭 총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectAutoMatchingResumeListCnt(CondVacancyBean param) throws Exception;

	/**
	 * 기업의 오토매칭 목록
	 * @param userSeq
	 * @param langCd
	 * @return
	 * @throws Exception
	 */
	public List<ResumeBean> selectAutoMatchingResumeList(CondVacancyBean param) throws Exception;

	/**
	 * 맞춤 인재정보 설정 조회
	 * @param userSeq
	 * @return
	 * @throws Exception
	 */
	public VacancyMatchSetBean selectVacancyMatchSet(String userSeq) throws Exception;

	/**
	 * 맞춤 인재정보 설정 조회::학력
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetEduDegreeBean> selectVacancyMatchSetEduDegreeList(String vacancyMatchSetSeq) throws Exception;

	/**
	 * 맞춤 인재정보 설정 조회::직종
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetIscoBean> selectVacancyMatchSetIscoList(String vacancyMatchSetSeq) throws Exception;

	/**
	 * 맞춤 인재정보 설정 조회::외국어
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetLangBean> selectVacancyMatchSetLangList(String vacancyMatchSetSeq) throws Exception;

	/**
	 * 맞춤 인재정보 설정 조회::지역
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetLocBean> selectVacancyMatchSetLocList(String vacancyMatchSetSeq) throws Exception;

	/**
	 * 맞춤 인재정보 설정 조회::우대조건
	 * @param vacancyMatchSetSeq
	 * @return
	 * @throws Exception
	 */
	public List<VacancyMatchSetPreferntCondBean> selectVacancyMatchSetPreferntCondList(String vacancyMatchSetSeq) throws Exception;

	/**
	 * 맞춤 인재정보 설정::입력
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer insertCompnyMatchVacancy(VacancyMatchSetBean param) throws Exception;

	/**
	 * 맞춤 인재정보 설정::수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer updateCompnyMatchVacancy(VacancyMatchSetBean param) throws Exception;

	/**
	 * 맞춤 인재정보::총건수
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Integer selectVacancyMatchListCnt(VacancyMatchSetBean param) throws Exception;

	/**
	 * 맞춤 인재정보::목록 (페이징)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<ResumeBean> selectVacancyMatchList(VacancyMatchSetBean param) throws Exception;

}
