package ony.cpes.external.login.dao;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import ony.cmm.common.bean.CustomUserDetailsBean;
import ony.cpes.external.login.bean.LoginBean;
import ony.cpes.external.user.bean.UserBean;


@Repository("LoginDAO")
public class LoginDAO extends EgovAbstractMapper{


	/**
	 * 사용자정보 조회
	 * user info search
	 * @param userEmail
	 * @return CustomUserDetailsBean
	 */
	public CustomUserDetailsBean selectUserById(String userEmail) {
        return getSqlSession().selectOne("login.selectUserById", userEmail);
    }

	/**
	 * 사용자 아이디 패스워드 조회
	 * search User Id password - inquiry Mng Id
	 * @param param
	 * @return UserBean
	 */
	public UserBean selectSearchIdPwd(UserBean param) {
        return getSqlSession().selectOne("login.selectSearchIdPwd", param);
    }


	/**
	 * 사용자 로그인 성공 update
	 * login success update
	 * @param param
	 * @return int
	 */
	public int updateLogin(UserBean param) {
        return getSqlSession().update("setLogin.updateLogin", param);
    }



	/**
	 * 사용자 로그인 실패 update
	 * login fail update
	 * @param param
	 * @return int
	 */
	public int updateLoginFail(UserBean param) {
        return getSqlSession().update("setLogin.updateLoginFail", param);
    }


	/**
	 * 사용자 정보 조회
	 * select user info
	 * @param param
	 * @return LoginBean
	 */
	public LoginBean selectUser(LoginBean param) {
		return getSqlSession().selectOne("login.selectUser", param);
    }


	/**
	 * 사용자 비밀번호 변경
	 * user pwd change update
	 * @param param
	 * @return int
	 */
	public int updatePwd(LoginBean param) {
        return getSqlSession().update("setLogin.updatePwd", param);
    }

	/**
	 * 사용자 휴면해제
	 * user Dormancy released
	 * @param param
	 * @return int
	 */
	public int updateDormancy(LoginBean param) {
        return getSqlSession().update("setLogin.updateDormancy", param);
    }


	/**
	 * 사용자 아이디 찾기  일반,학생
	 * find user id public,student
	 * @param param
	 * @return LoginBean
	 */
	public LoginBean selectFindIdTypeG(LoginBean param) {
		return getSqlSession().selectOne("login.selectFindIdTypeG", param);
    }

	/**
	 * 사용자 아이디 찾기 기업
	 * find user id company
	 * @param param
	 * @return LoginBean
	 */
	public LoginBean selectFindIdTypeC(LoginBean param) {
		return getSqlSession().selectOne("login.selectFindIdTypeC", param);
    }


	/**
	 * 사용자 아이디 찾기 기관
	 * find user id instt
	 * @param param
	 * @return LoginBean
	 */
	public LoginBean selectFindIdTypeT(LoginBean param) {
		return getSqlSession().selectOne("login.selectFindIdTypeT", param);
    }


	/**
	 * 사용자 비밀번호 찾기  일반,학생
	 * find user password public,student
	 * @param param
	 * @return LoginBean
	 */
	public LoginBean selectFindPwdTypeG(LoginBean param) {
		return getSqlSession().selectOne("login.selectFindPwdTypeG", param);
    }

	/**
	 * 사용자 비밀번호 찾기 기업
	 * find user password company
	 * @param param
	 * @return LoginBean
	 */
	public LoginBean selectFindPwdTypeC(LoginBean param) {
		return getSqlSession().selectOne("login.selectFindPwdTypeC", param);
    }



	/**
	 * 사용자 비밀번호 찾기 기관
	 * find user password TRNCT
	 * @param param
	 * @return LoginBean
	 */
	public LoginBean selectFindPwdTypeT(LoginBean param) {
		return getSqlSession().selectOne("login.selectFindPwdTypeT", param);
    }



}
