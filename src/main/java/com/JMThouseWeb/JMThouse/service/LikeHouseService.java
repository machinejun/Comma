package com.JMThouseWeb.JMThouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JMThouseWeb.JMThouse.model.LikeHouse;
import com.JMThouseWeb.JMThouse.repository.LikeHouseRepository;

@Service
public class LikeHouseService {

	@Autowired
	private LikeHouseRepository likeHouseRepository;

	public LikeHouse checkWishList(int houseId, int guestId) {
		return likeHouseRepository.findByHouseIdAndGuestId(houseId, guestId).orElseGet(() -> {
			return new LikeHouse();
		});
	}
}
