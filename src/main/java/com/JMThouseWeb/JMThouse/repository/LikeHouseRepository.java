package com.JMThouseWeb.JMThouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.JMThouseWeb.JMThouse.model.LikeHouse;

public interface LikeHouseRepository extends JpaRepository<LikeHouse, Integer> {

	// Delete from LikeHouse where houseId = 'houseId' and guestId = 'guestId';
	void deleteByHouseIdAndGuestId(int houseId, int guestId);

}
