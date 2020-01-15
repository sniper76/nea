package ony.cpes.external.mypage.compny.service;


import ony.cpes.external.mypage.compny.bean.CompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CondCompnyMemBean;

public interface CompnyMemService {
	/**
	 * 기업정보 조회
	 * company member view
	 * @param param
	 * @return CompnyMemBean
	 */
	public CompnyMemBean selectCompnyMember(CondCompnyMemBean param) throws Exception;

	/**
	 * 기업정보 저장
	 * company member update
	 * @param param
	 * @return int
	 */
	public int updateCompnyMember(CompnyMemBean param) throws Exception;



	/**
	 * 기업정보 프로파일 저장
	 * company member profile update
	 * @param param
	 * @return int
	 */
	public int updateProfile(CompnyMemBean param) throws Exception;

	public int updateCompanyLogoImg(CompnyMemBean param) throws Exception;
}
