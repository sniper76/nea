package ony.cpes.external.login.service;

import javax.inject.Inject;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;

import ony.cmm.common.ConstVal;
import ony.cmm.common.bean.CustomUserDetailsBean;
import ony.cmm.common.util.EncryptUtil;
import ony.cpes.external.login.bean.LoginBean;
import ony.framework.util.Encryption;


public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserDetailsService userDeSer;

    @Inject
    private LoginService loginService;


    @SuppressWarnings("unchecked")
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        CustomUserDetailsBean user = (CustomUserDetailsBean) userDeSer.loadUserByUsername(username);

        System.out.println("==================username="+username);
        System.out.println("==================password="+password);
        System.out.println("==================user.getPwdFailCnt()="+user.getPwdFailCnt()+",user.getPassword()="+user.getPassword()+",user.getAccntLockStsCd()="+user.getAccntLockStsCd());
        System.out.println("==================org password="+EncryptUtil.getSha512(password));


        if (user.getPwdFailCnt() > 4) {
    		throw new LockedException (username);
    	} else if (!"ALS0000000001".equals(user.getAccntLockStsCd())) {
    		throw new DisabledException(username);
    	} else {
    		if(!StringUtils.equals(ConstVal.YES_VAL, user.getNewPwdApplyYn())) {//예전 비밀번호일경우,old pwd
				String oldPwd = user.getUserPwdOld();


				if(!StringUtils.equals(oldPwd, EncryptUtil.getEncMD5(password))) {//예전 비밀번호일경우,old pwd
					System.out.println("==================oldPwd not match pwd");
					throw new BadCredentialsException(username);
				} else {
					LoginBean loginBean = new LoginBean();
					loginBean.setNewPwd(EncryptUtil.getSha512(password));
					loginBean.setUserSeq(user.getUserSeq());
					try {
						loginService.updatePwd(loginBean);
					} catch(Exception e) {

					}
				}

			} else {
	    		if(!matchPassword(EncryptUtil.getSha512(password), user.getPassword())) {
	    	    	System.out.println("==================not match pwd");
	    	        throw new BadCredentialsException(username);
	    		}
			}
    	}


        if(!user.isEnabled()) {
            throw new BadCredentialsException(username);
        }

        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }

    private boolean matchPassword(String loginPwd, String password) {
        return loginPwd.equals(password);
    }

}


