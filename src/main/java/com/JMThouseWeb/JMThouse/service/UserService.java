package com.JMThouseWeb.JMThouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.model.Guest;
import com.JMThouseWeb.JMThouse.model.Host;
import com.JMThouseWeb.JMThouse.model.RoleType;
import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.repository.GuestRepository;
import com.JMThouseWeb.JMThouse.repository.HostRepository;
import com.JMThouseWeb.JMThouse.repository.UserRepository;

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
			return true;
		} catch (Exception e) {
			hostRepository.save(hostEntity);
			return false;		
		}	

	}

}