package com.CommaWeb.Comma.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.repository.UserRepository;

@Service
public class GuestService {

	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public int saveUser(User user) {
		try {
			userRepository.save(user);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
}
