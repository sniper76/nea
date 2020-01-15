package ony.cpes.external.login.service;

import javax.servlet.http.HttpServletRequest;

import ony.cpes.external.login.bean.LoginBean;
import ony.cpes.external.user.bean.UserBean;

public interface LoginService {
	
 
	/**
	 * eamil 사용자정보 조회 
	 * search user Email
	 * @param param request
	 * @param param param
	 * @return UserBean
	 * @throws Exception
	*/
    public UserBean selectSearchId(HttpServletRequest request, UserBean param) throws Exception;    
    
    
	/**
	 * 사용자 로그인시 비밀번호 실패카운트 초기화
	 * update password for over duration
	 * @param param UserBean
	 * @return UserBean
	 * @throws Exception
	*/
    public UserBean updateLogin(HttpServletRequest request, UserBean param) throws Exception;
    
	/**
	 * 로그인실패 카운트
	 * login fail update
	 * @param param UserBean
	 * @return UserBean
	 * @throws Exception
	*/
    public UserBean updateLoginFail(HttpServletRequest request, UserBean param) throws Exception;
    
    
    
	/**
	 * 사용자 정보 조회
	 * select user info
	 * @param param UserBean
	 * @return UserBean
	 * @throws Exception
	*/
    public LoginBean selectUser(LoginBean param) throws Exception; 
    
    
	/**
	 * 비밀번호 변경
	 * pwd update
	 * @param param param
	 * @return UserBean
	 * @throws Exception
	*/
    public int updatePwd(LoginBean param) throws Exception;
    
    
	/**
	 * 사용자 휴면해제
	 * user Dormancy released
	 * @param param
	 * @return int
	 * @throws Exception
	 */
	public int updateDormancy(LoginBean param) throws Exception;
	
	/**
	 * 사용자 아이디 찾기
	 * find user id
	 * @param param
	 * @return LoginBean
	 */
	public LoginBean selectFindId(LoginBean param) throws Exception;
	
	
	/**
	 * 사용자 비밀번호 찾기
	 * find user password
	 * @param param
	 * @return LoginBean
	 */
	public LoginBean selectFindPwd(LoginBean param) throws Exception;
}
