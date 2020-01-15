package ony.cpes.external.mypage.compny.dao;



import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cpes.external.mypage.compny.bean.CondCompnyMemBean;
import ony.cpes.external.mypage.compny.bean.CompnyMemBean;


@Repository("CompnyMemDAO")
public class CompnyMemDAO  extends EgovAbstractMapper {
	/**
	 * 기업정보 조회
	 * company member info
	 * @param param
	 * @return CompnyMemBean
	 */
	public CompnyMemBean selectMember(CondCompnyMemBean param) {
		return getSqlSession().selectOne("compnyMem.selectMember", param);
	}

	/**
	 * 기업정보 저장
	 * company member update
	 * @param param
	 * @return int
	 */
	public int updateMember(CompnyMemBean param) {
		return getSqlSession().update("setCompnyMem.updateMember", param);
	}


	/**
	 * 기업정보 프로파일 저장
	 * company member profile update
	 * @param param
	 * @return int
	 */
	public int updateProfile(CompnyMemBean param) {
		return getSqlSession().update("setCompnyMem.updateProfile", param);
	}

	/**
	 * 기업 로고 이미지 저장
	 * @param param
	 * @return
	 */
	public int updateCompanyLogoImg(CompnyMemBean param) {
		return getSqlSession().update("setCompnyMem.updateCompanyLogoImg", param);
	}
}
