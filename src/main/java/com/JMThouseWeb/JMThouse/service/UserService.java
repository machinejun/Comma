package com.JMThouseWeb.JMThouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.model.RoleType;
import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	public int saveUser(User user) {
		try {
			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);
			user.setPassword(encPassword);
			user.setRole(RoleType.GUEST);
			userRepository.save(user);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}

	@Transactional(readOnly = true)
	public User login(User user) {
		// repository select 요청
		return userRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
	}
}
