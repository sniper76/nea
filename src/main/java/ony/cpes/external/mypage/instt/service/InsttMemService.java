package ony.cpes.external.mypage.instt.service;



import java.util.List;

import ony.cpes.external.mypage.instt.bean.CondInsttMemBean;
import ony.cpes.external.mypage.instt.bean.EduTrnngHistBean;
import ony.cpes.external.mypage.instt.bean.InsttMemBean;

public interface InsttMemService {
	/**
	 * 교육기관 조회
	 * Institution member view
	 * @param param
	 * @return InsttMemBean
	 */
	public InsttMemBean selectInsttMember(CondInsttMemBean param) throws Exception;

	/**
	 * 교육기관 저장
	 * Institution member update
	 * @param param
	 * @return int
	 */
	public int updateInsttMember(InsttMemBean param) throws Exception;



	/**
	 * 교육훈련 이력 목록 조회
	 * education history list
	 * @param param
	 * @return List<EduTrnngHistBean>
	 */
	public List<EduTrnngHistBean> selectEduTrnngHistList(CondInsttMemBean param) throws Exception;


	/**
	 * 교육기관정보 프로파일 수정
	 * education profile update
	 * @param param
	 * @return int
	 */
	public int updateProfile(InsttMemBean param) throws Exception;

	public int updateInsttLogoImg(InsttMemBean param);
}
