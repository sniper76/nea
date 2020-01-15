package ony.cpes.external.mypage.compny.service;

import java.util.List;

import ony.cpes.external.mypage.compny.bean.CondVacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyBean;
import ony.cpes.external.mypage.compny.bean.VacancyLangBean;
import ony.cpes.external.mypage.compny.bean.VacancyPreferntBean;
import ony.cpes.external.mypage.privt.bean.CondApplicBean;
import ony.cpes.external.mypage.privt.bean.IntvwBean;

public interface CompnyVacancyService {
	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancySimpleList(CondVacancyBean param) throws Exception;


	/**
	 * 구인 신규 등록
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
	public String insertVacancy(VacancyBean vacancyBean) throws Exception;


	/**
	 * 구인 복사 기능
	 * offer of a job copy
	 * @param param
	 * @return VacancyBean
	 */
	public VacancyBean selectVacancy(CondVacancyBean param) throws Exception;



	/**
	 * 구인 신규 등록
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
	public String insertVacancyTemp(VacancyBean vacancyBean) throws Exception;



	/**
	 * 구인 목록 조회
	 * offer of a job list
	 * @param param
	 * @return List<VacancyBean>
	 */
	public List<VacancyBean> selectVacancyList(CondVacancyBean param) throws Exception;


	/**
	 * 구인 목록 조회 count
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
	public int selectVacancyListCnt(CondVacancyBean param) throws Exception;


	/**
	 * 구인 수정
	 * offer of a job update
	 * @param vacancyBean
	 * @return int
	 */
	public int updateVacancy(VacancyBean vacancyBean) throws Exception;


	/**
	 * 구인 수정
	 * offer of a job update
	 * @param vacancyBean
	 * @return int
	 */
	public int updateVacancyTemp(VacancyBean vacancyBean) throws Exception;


	/**
	 * 구인 삭제
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
	public int deleteVacancyTemp(VacancyBean vacancyBean) throws Exception;


	/**
	 * 구인 삭제
	 * offer of a job insert
	 * @param vacancyBean
	 * @return String
	 */
	public int deleteVacancy(VacancyBean vacancyBean) throws Exception;


	/**
	 * 기업별 채용공고 상태 count
	 * offer of a job list count
	 * @param param
	 * @return int
	 */
	public VacancyBean selectVacancyCntInfo(CondVacancyBean param) throws Exception;


	/**
	 * 채용마감
	 * vacancy close process
	 * @param param
	 * @return int
	 */
	public int closeVacancy(CondVacancyBean param) throws Exception;


	/**
	 * 면접제의 목록 조회 count
	 * interview  list count
	 * @param param
	 * @return List<IntvwBean>
	 */
	public int selectIntvwListCnt(CondVacancyBean param) throws Exception;


	/**
	 * 면접제의 목록 조회
	 * interview  list
	 * @param param
	 * @return List<IntvwBean>
	 */
	public List<IntvwBean> selectIntvwList(CondVacancyBean param) throws Exception;
}
