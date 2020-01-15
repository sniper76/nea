package ony.cpes.external.login.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import ony.cmm.common.ConstVal;
import ony.cpes.external.login.bean.LoginBean;
import ony.cpes.external.login.dao.LoginDAO;
import ony.cpes.external.login.service.LoginService;
import ony.cpes.external.user.bean.UserBean;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO loginDao;

	@Autowired SessionLocaleResolver localeResolver;

    @Autowired MessageSource messageSource;

	/**
	 * eamil 사용자정보 조회
	 * search user Email
	 * @param param request
	 * @param param param
	 * @return UserBean
	 * @throws Exception
	*/
    @Override
    public UserBean selectSearchId(HttpServletRequest request, UserBean param) throws Exception {
		UserBean result = loginDao.selectSearchIdPwd(param);

		return result;
    }


	/**
	 * 사용자 로그인시 비밀번호 실패카운트 초기화
	 * update password for over duration
	 * @param param UserBean
	 * @return UserBean
	 * @throws Exception
	*/
    @Override
	public UserBean updateLogin(HttpServletRequest request, UserBean param) throws Exception {

		loginDao.updateLogin(param);

		return param;
	}

	/**
	 * 로그인실패 카운트
	 * login fail update
	 * @param param UserBean
	 * @return UserBean
	 * @throws Exception
	*/
    @Override
	public UserBean updateLoginFail(HttpServletRequest request, UserBean param) throws Exception {

		loginDao.updateLoginFail(param);

		return param;
	}

	/**
	 * 사용자 정보 조회
	 * select user info
	 * @param param UserBean
	 * @return UserBean
	 * @throws Exception
	*/
    @Override
	public LoginBean selectUser(LoginBean param) throws Exception {

		return loginDao.selectUser(param);
	}


	/**
	 * 비밀번호 변경
	 * pwd update
	 * @param param param
	 * @return UserBean
	 * @throws Exception
	*/
    @Override
	public int updatePwd(LoginBean param) throws Exception {

		return loginDao.updatePwd(param);

	}

	/**
	 * 사용자 휴면해제
	 * user Dormancy released
	 * @param param
	 * @return int
	 * @throws Exception
	 */
    @Override
	public int updateDormancy(LoginBean param) throws Exception {
		return loginDao.updateDormancy(param);
	}


	/**
	 * 사용자 아이디 찾기
	 * find user id
	 * @param param
	 * @return LoginBean
	 */
    @Override
	public LoginBean selectFindId(LoginBean param) throws Exception {
    	if(ConstVal.ROLE_USER_VAL.equals(param.getUserAuthCd()) || ConstVal.ROLE_STDIT_VAL.equals(param.getUserAuthCd())) {//public,student
    		return loginDao.selectFindIdTypeG(param);
    	} else if(ConstVal.ROLE_CMPNY_VAL.equals(param.getUserAuthCd())) {//company
    		return loginDao.selectFindIdTypeC(param);
    	} else {//trnct
    		return loginDao.selectFindIdTypeT(param);
    	}

	}

	/**
	 * 사용자 비밀번호 찾기
	 * find user password
	 * @param param
	 * @return LoginBean
	 */
    @Override
	public LoginBean selectFindPwd(LoginBean param) throws Exception {
    	if(ConstVal.ROLE_USER_VAL.equals(param.getUserAuthCd()) || ConstVal.ROLE_STDIT_VAL.equals(param.getUserAuthCd())) {//public,student
    		return loginDao.selectFindPwdTypeG(param);
    	} else if(ConstVal.ROLE_CMPNY_VAL.equals(param.getUserAuthCd())) {//company
    		return loginDao.selectFindPwdTypeC(param);
    	} else {//trnct
    		return loginDao.selectFindPwdTypeT(param);
    	}
	}
}
