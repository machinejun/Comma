package com.CommaWeb.Comma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.model.LikeHouse;
import com.CommaWeb.Comma.repository.LikeHouseRepository;

@Service
public class LikeHouseService {

	@Autowired
	private LikeHouseRepository likeHouseRepository;

	@Transactional(readOnly = true)
	public LikeHouse checkWishList(int houseId, int guestId) {
		return likeHouseRepository.findByHouseIdAndGuestId(houseId, guestId).orElseGet(() -> {
			return new LikeHouse();
		});
	}

	@Transactional(readOnly = true)
	public List<LikeHouse> getWishListById(int guestId) {
		return likeHouseRepository.getWishListByGuestId(guestId);
	}
}
