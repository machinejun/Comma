package com.CommaWeb.Comma.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.model.Guest;
import com.CommaWeb.Comma.model.Host;
import com.CommaWeb.Comma.model.LoginType;
import com.CommaWeb.Comma.model.RoleType;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.repository.GuestRepository;
import com.CommaWeb.Comma.repository.HostRepository;
import com.CommaWeb.Comma.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private GuestRepository guestRepository;
	
	@Autowired
	private HostRepository hostRepository;

	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	public int saveUser(User user) {
		try {
			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);
			user.setPhoneNumber(changePhoneNumFormat(user.getPhoneNumber()));
			user.setPassword(encPassword);
			user.setRole(RoleType.GUEST);
			user.setLoginType(LoginType.ORIGIN);
			userRepository.save(user);
			User tempUser = userRepository.findByUsername(user.getUsername()).get();
			System.out.println("tempUser : " + tempUser);
			Guest guest = new Guest();
			guest.setUser(tempUser);
			guestRepository.save(guest);

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}

	@Transactional
	public User updateUserInfo(User user) {

		User userEntity = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("존재하지 않는 회원입니다.");
		});
		System.out.println("update : " + userEntity);
		if(userEntity.getLoginType() == LoginType.KAKAO) {
			userEntity.setEmail(user.getEmail());
			userEntity.setPhoneNumber(user.getPhoneNumber());
			
		}else {
			String rawPassword = user.getPassword();
			String hashPassword = encoder.encode(rawPassword);
			userEntity.setPassword(hashPassword);
			userEntity.setEmail(user.getEmail());
			userEntity.setPhoneNumber(user.getPhoneNumber());
		}
		return userEntity;
		

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
	
	private String changePhoneNumFormat(String phoneNum) {
		if(phoneNum.length() != 11) {
			return phoneNum;
		}
		// 012 3456 78910
		String newPhoneNum = phoneNum.substring(0, 2) + "-" + phoneNum.subSequence(3, 6) + "-" + phoneNum.subSequence(7, 10);
		return newPhoneNum;
	}

	@Transactional
	public boolean saveHost(Host hostEntity) {	
		try {
			Host host = hostRepository.findById(hostEntity.getUserId()).get();
			return false;
		} catch (Exception e) {
			hostRepository.save(hostEntity);
			return true;		
		}	

	}

	@Transactional
	public List<User> showAllUser() {
		return userRepository.findAll();
	}
	
//	@Transactional
//	public List<User> searchUserByUsername(String username){
//		return userRepository.findByUsername(username);
//	}
//	
//	@Transactional
//	public Optional<User> searchUserByRole(RoleType role){
//		return userRepository.findByRole(role);
//	}
	
	@Transactional
	public List<User> searchRoleAndUser(String role, String name){
		List<User> users = userRepository.findByRoleAndUserName(role, name);
		return sortUserList(users);
	}
	
	@Transactional
	public List<User> searchUserOnly(String name){
		List<User> users = userRepository.findByUsernameContaining(name);
		return sortUserList(users);
	}
	
	private List<User> sortUserList(List<User> users) {
		users.sort( (o1, o2) -> {
			if(o1.getId() < o2.getId()) {
				return 1;
			}else if(o1.getId() > o2.getId()){
				return -1;
			}else {
				return 0;
			}
		}); 
		return users;
	}

}