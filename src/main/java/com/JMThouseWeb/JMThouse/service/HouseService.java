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
		House houseEntity = houseRepository.findById(houseId).orElseThrow(() -> {
			return new IllegalArgumentException("해당하는 숙소를 찾을 수 없습니다.");
		});
		return houseEntity;
	}

	@Transactional
	public void updateHouse(int houseId, House house) {
		House houseEntity = houseRepository.findById(houseId).orElseThrow(() -> {
			return new IllegalArgumentException("해당하는 숙소를 찾을 수 없습니다.");
		});
		
		houseEntity.setName(house.getName());
		houseEntity.setInfoText(house.getInfoText());
		houseEntity.setAddress(house.getAddress());
		houseEntity.setType(house.getType());
		houseEntity.setImage(house.getImage());
		
	}

	@Transactional
	public void deleteHouse(int houseId) {
		// TODO Auto-generated method stub
		
	}

}
