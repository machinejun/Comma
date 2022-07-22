package com.JMThouseWeb.JMThouse.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

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
			user.setRole(RoleType.ADMIN);
			/*
			 * save() 메소드에는 @Transactional이 달려있으므로 외부 어노테이션은 선언하지 않음
			 * 중복체크 메소드와 함께 실행될 시의 오류 방지
			 */
			userRepository.save(user); 

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
	
	public List<User> showAllUser() {
		return userRepository.findAll();
	}
	
	@Transactional
	public Optional<User> searchUserByUsername(String username){
		return userRepository.findByUsername(username);
	}
	
	@Transactional
	public Optional<User> searchUserByEmail(String email){
		return userRepository.findByEmail(email);
	}
	
	@Transactional
	public Optional<User> searchUserByCreationDate(Timestamp creationDate){
		return userRepository.findByCreationDate(creationDate);
	}
	
	@Transactional
	public Optional<User> searchUserByPhoneNumber(String phoneNumber){
		return userRepository.findByPhoneNumber(phoneNumber);
	}
	
	@Transactional
	public Optional<User> searchUserByRole(RoleType role){
		return userRepository.findByRole(role);
	}
	
	@Transactional
	public List<User> searchRoleAndUser(String role, String name){
		System.out.println(userRepository.findByRoleAndUserName(role, name));
		return userRepository.findByRoleAndUserName(role, name);
	}
	
	@Transactional
	public List<User> searchUserOnly(String name){
		System.out.println(userRepository.findByUserName(name));
		return userRepository.findByUserName(name);
	}

}