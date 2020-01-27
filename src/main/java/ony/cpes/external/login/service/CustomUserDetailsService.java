package ony.cpes.external.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import ony.cmm.common.bean.CustomUserDetailsBean;
import ony.cmm.common.util.EncryptUtil;
import ony.cpes.external.login.dao.LoginDAO;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	LoginDAO userAuthDAO;

	/**
     * inquiry user information
     * @param userName
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

    	// 여기서의 username 은 mngId 이다.
    	username = EncryptUtil.getAes256Enc(username);
        CustomUserDetailsBean user = userAuthDAO.selectUserById(username);

        if(user==null) {
        	// not found mngId
            throw new InternalAuthenticationServiceException(username);
        }

        return user;
    }


}