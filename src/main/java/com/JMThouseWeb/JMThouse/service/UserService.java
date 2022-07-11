package com.JMThouseWeb.JMThouse.service;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
=======
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
>>>>>>> feature_login

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

<<<<<<< HEAD
	@Transactional(readOnly = true)
	public User login(User user) {
		// repository select 요청
		return userRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
	}
}
=======
	@Transactional
	public void updateUserInfo(User user) {

		User userEntity = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("존재하지 않는 회원입니다.");
		});
		
		String rawPassword = user.getPassword();
		String hashPassword = encoder.encode(rawPassword);
		
		userEntity.setPassword(hashPassword);
		userEntity.setEmail(user.getEmail());
		userEntity.setPhoneNumber(user.getPhoneNumber());
		
	}

}
>>>>>>> feature_login
