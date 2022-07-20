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

	public int saveUser(User user) {
		try {
			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);
			user.setPassword(encPassword);
			user.setRole(RoleType.GUEST);
<<<<<<< HEAD
			userRepository.save(user);
=======
			/*
			 * save() 메소드에는 @Transactional이 달려있으므로 외부 어노테이션은 선언하지 않음
			 * 중복체크 메소드와 함께 실행될 시의 오류 방지
			 */
			userRepository.save(user); 
>>>>>>> aeef87eda6e5a819e058acafc4bf5cf7f0385a18

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}

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

	@Transactional
	public User checkUsername(String username) {
		User checkUser = userRepository.findByUsername(username).orElseGet(() -> {
			return new User();
		});
		
		return checkUser;
	}
	
	public User findByUserId(int id) {
		return userRepository.findById(id).get();
	}

}