package com.JMThouseWeb.JMThouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.repository.HouseRepository;

@Service
public class HouseService {
	
	@Autowired
	private HouseRepository houseRepository;

	@Transactional
	public void addHouse(House house) {
		houseRepository.save(house);
	}

	@Transactional
	public House getHouseDetail(int houseId) {
		// TODO Auto-generated method stub
		return null;
	}

}
