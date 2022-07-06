package com.JMThouseWeb.JMThouse.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.service.HouseService;

@RestController
@RequestMapping("/api/house")
public class HouseApiController {
	/**
	 * 
	 * 숙소 정보 관리와 관련된 모든 기능은
	 * 호스트 회원이어야만 가능하다.
	 */
	
	@Autowired
	private HouseService houseService;
	
	@PostMapping("/add")
	public House addHouse(@RequestBody House house) {
		// 숙소 등록 기능
		houseService.addHouse(house);
		return house;
	}
	
	@PutMapping("/update")
	public void updateHouse(@RequestBody House house) {
		// 숙소 정보 수정 기능
	}

}
