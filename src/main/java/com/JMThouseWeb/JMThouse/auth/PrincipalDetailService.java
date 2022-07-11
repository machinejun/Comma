package com.JMThouseWeb.JMThouse.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.repository.UserRepository;

@Service
public class PrincipalDetailService implements UserDetailsService{

	@Autowired
	UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	
		User principal = userRepository.findByUsername(username)
				.orElseThrow(() -> {
					return new UsernameNotFoundException("해당유저를 찾을 수 없습니다.");
				});
		return new PrincipalDetail(principal); 
	}

}
