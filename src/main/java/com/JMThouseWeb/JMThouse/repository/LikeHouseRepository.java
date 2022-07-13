package com.JMThouseWeb.JMThouse.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.JMThouseWeb.JMThouse.model.LikeHouse;

public interface LikeHouseRepository extends JpaRepository<LikeHouse, Integer> {

	// Delete from LikeHouse where houseId = 'houseId' and guestId = 'guestId';
	void deleteByHouseIdAndGuestId(int houseId, int guestId);
	
	// select * from likehouse where houseId=1 and guestId=1;
	Optional<LikeHouse> findByHouseIdAndGuestId(int houseId, int guestId);

}
