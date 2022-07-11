package com.JMThouseWeb.JMThouse.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.dto.RequestWishListDto;
import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.model.LikeHouse;
import com.JMThouseWeb.JMThouse.service.HouseService;

@RestController
@RequestMapping("/api/house")
public class HouseApiController {
	/**
	 * 
	 * 숙소 정보 관리와 관련된 모든 기능은 호스트 회원이어야만 가능하다.
	 */

	@Autowired
	private HouseService houseService;

	@PutMapping("/{houseId}")
	public House updateHouse(@PathVariable int houseId, @RequestBody House house) {
		// 숙소 정보 수정 기능
		houseService.updateHouse(houseId, house);
		return house;
	}

	@DeleteMapping("/{houseId}")
	public void deleteHouse(@PathVariable int houseId) {
		// 숙소 삭제 기능
		houseService.deleteHouse(houseId);
	}

	@PostMapping("/wishList")
	public void addWishList(@RequestBody RequestWishListDto dto) {
		// 위시리스트 추가 기능
		// TODO 게스트 객체랑 함께 보내기
		houseService.addWishList(dto);
	}

}
