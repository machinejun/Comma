package com.JMThouseWeb.JMThouse.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.JMThouseWeb.JMThouse.model.User;

import lombok.Data;

@Data
public class PrincipalDetail implements UserDetails {

	private static final long serialVersionUID = 1L;

	private User user;
	
	public PrincipalDetail(User user) {
		this.user = user;
	}
	
	@Override
	public String getPassword() {	
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
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
<<<<<<< HEAD
		
=======
>>>>>>> feature_login
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collectors = new ArrayList<GrantedAuthority>();

		collectors.add(() -> {
			return "ROLE_" + user.getRole();
		});
		return collectors;
	}
}
