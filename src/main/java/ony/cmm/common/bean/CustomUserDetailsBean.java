package ony.cmm.common.bean;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class CustomUserDetailsBean implements UserDetails {

		private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;


	 	private String id			="";
	    private String password		="";
	    private String username		="";
	    private String authority 	= "";
	    private String mngId		= "";
	    private String pwdChgYn		= "";
	    private int pwdFailCnt		= 0;
	    private String userEmail	= "";
	    private String accntLockStsCd	= "";
	    private String userSeq		=	"";
	    private String dormancyYn		=	"";



	    @Override
	    public Collection<? extends GrantedAuthority> getAuthorities() {
	        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
	        auth.add(new SimpleGrantedAuthority(authority));
	        return auth;
	    }

	    /*
	    @Override
	    public Collection<? extends GrantedAuthority> getAuthorities() {
	        ArrayList<SimpleGrantedAuthority> grants = new ArrayList<SimpleGrantedAuthority>();

	        for(String role : roles) {
	            grants.add(new SimpleGrantedAuthority(role));
	        }

	        return grants;
	    }*/




	    public String getId() {
			return id;
		}

		public String getUserSeq() {
			return userSeq;
		}

		public void setUserSeq(String userSeq) {
			this.userSeq = userSeq;
		}

		public String getAccntLockStsCd() {
			return accntLockStsCd;
		}

		public void setAccntLockStsCd(String accntLockStsCd) {
			this.accntLockStsCd = accntLockStsCd;
		}

		public String getUserEmail() {
			return userEmail;
		}

		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}

		public int getPwdFailCnt() {
			return pwdFailCnt;
		}

		public void setPwdFailCnt(int pwdFailCnt) {
			this.pwdFailCnt = pwdFailCnt;
		}

		public String getPwdChgYn() {
			return pwdChgYn;
		}

		public void setPwdChgYn(String pwdChgYn) {
			this.pwdChgYn = pwdChgYn;
		}

		public String getMngId() {
			return mngId;
		}

		public void setMngId(String mngId) {
			this.mngId = mngId;
		}


		public void setUsername(String username) {
			this.username = username;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getDormancyYn() {
			return dormancyYn;
		}

		public void setDormancyYn(String dormancyYn) {
			this.dormancyYn = dormancyYn;
		}

		@Override
	    public String getPassword() {
	        return password;
	    }

	    @Override
	    public String getUsername() {
	        return id;
	    }

	    @Override
	    public boolean isAccountNonExpired() {
	        return true;
	    }

	    @Override
	    public boolean isAccountNonLocked() {
	        return true;
	    }

	    @Override
	    public boolean isCredentialsNonExpired() {
	        return true;
	    }

	    @Override
	    public boolean isEnabled() {
	        return true;
	    }

}