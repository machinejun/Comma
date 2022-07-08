package com.JMThouseWeb.JMThouse.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JMThouseWeb.JMThouse.model.Guest;
import com.JMThouseWeb.JMThouse.repository.GuestRepository;

@Service
public class GuestService {

	@Autowired
	private GuestRepository guestRepository;
	
	@Transactional
	public int saveGuest(Guest guest) {
		try {
			guestRepository.save(guest);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
}
