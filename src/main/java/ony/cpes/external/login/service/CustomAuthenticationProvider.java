package ony.cpes.external.login.service;

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
import ony.framework.util.Encryption;


public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserDetailsService userDeSer;

    @SuppressWarnings("unchecked")
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        CustomUserDetailsBean user = (CustomUserDetailsBean) userDeSer.loadUserByUsername(username);

        System.out.println("==================username="+username);
        System.out.println("==================password="+password);
        System.out.println("==================user.getPwdFailCnt()="+user.getPwdFailCnt()+",user.getPassword()="+user.getPassword()+",user.getAccntLockStsCd()="+user.getAccntLockStsCd());
        System.out.println("==================org password="+Encryption.getSHA512(password));

        if (user.getPwdFailCnt() > 4) {
    		throw new LockedException (username);
    	} else if (!"ALS0000000001".equals(user.getAccntLockStsCd())) {
    		throw new DisabledException(username);
    	} else {
    		if(!matchPassword(Encryption.getSHA512(password), user.getPassword())) {
    	    	System.out.println("==================not match pwd");
    	        throw new BadCredentialsException(username);
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


