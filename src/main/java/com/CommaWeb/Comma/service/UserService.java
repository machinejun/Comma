package com.CommaWeb.Comma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.dto.adminDto.AdmintableDto;
import com.CommaWeb.Comma.model.LoginType;
import com.CommaWeb.Comma.model.RoleType;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.repository.QlrmRepository;
import com.CommaWeb.Comma.repository.UserRepository;
import com.CommaWeb.Comma.repository.queryStorage.AdminTableQueryStorage;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private QlrmRepository<AdmintableDto> qlrmRepository;
	
	@Autowired
	private AdminTableQueryStorage queryStorage;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Transactional
	public int saveUser(User user) {
		try {
			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);
			user.setPhoneNumber(changePhoneNumFormat(user.getPhoneNumber()));
			user.setPassword(encPassword);
			if (!user.getUsername().startsWith("kakao_")) {
				user.setLoginType(LoginType.ORIGIN);
			}
			user.setRole(RoleType.GUEST);
			userRepository.save(user);
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
		if (userEntity.getLoginType() == LoginType.KAKAO) {
			userEntity.setEmail(user.getEmail());
			userEntity.setPhoneNumber(changePhoneNumFormat(user.getPhoneNumber()));

		} else {
			String rawPassword = user.getPassword();
			String hashPassword = encoder.encode(rawPassword);
			userEntity.setPassword(hashPassword);
			userEntity.setEmail(user.getEmail());
			userEntity.setPhoneNumber(changePhoneNumFormat(user.getPhoneNumber()));
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
		if (phoneNum.length() != 11) {
			return phoneNum;
		}
		String newPhoneNum = phoneNum.substring(0, 3) + "-" + phoneNum.subSequence(3, 7) + "-"
				+ phoneNum.subSequence(7, 11);
		return newPhoneNum;
	}

	@Transactional
	public List<User> showAllUser() {
		return userRepository.findAll();
	}

	@Transactional
	public List<User> searchRoleAndUser(String role, String name) {
		List<User> users = userRepository.findByRoleAndUserName(role, name);
		return sortUserList(users);
	}

	@Transactional
	public List<User> searchUserOnly(String name) {
		List<User> users = userRepository.findByUsernameContaining(name);
		return sortUserList(users);
	}

	private List<User> sortUserList(List<User> users) {
		users.sort((o1, o2) -> {
			if (o1.getId() < o2.getId()) {
				return 1;
			} else if (o1.getId() > o2.getId()) {
				return -1;
			} else {
				return 0;
			}
		});
		return users;
	}

	public List<AdmintableDto> loadHouseDtolist(String month, String string){
		return qlrmRepository.returnDataList(queryStorage.findByMonthBestHouse(month, Integer.parseInt(string)), AdmintableDto.class);
	}
	
	public List<AdmintableDto> loadAddressHouseCount(){
		return qlrmRepository.returnDataList(queryStorage.loadAddressHouseCount(), AdmintableDto.class);
	}
	
	public List<AdmintableDto> loadMonthTableCount(String table){
		return qlrmRepository.returnDataList(queryStorage.loadMonthTableCount(table), AdmintableDto.class);
	}

	@Transactional(readOnly = true)
	public User getUserById(int userId) {
		return userRepository.findById(userId).get();
	}

	@Modifying
	@Transactional
	public void deleteUser(int id) {
		userRepository.deleteById(id);
	}

}