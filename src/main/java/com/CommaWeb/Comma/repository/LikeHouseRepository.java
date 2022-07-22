package com.CommaWeb.Comma.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CommaWeb.Comma.model.LikeHouse;

public interface LikeHouseRepository extends JpaRepository<LikeHouse, Integer> {

	// Delete from LikeHouse where houseId = 'houseId' and guestId = 'guestId';
	void deleteByHouseIdAndGuestId(int houseId, int guestId);
	
	// select * from likehouse where houseId=1 and guestId=1;
	Optional<LikeHouse> findByHouseIdAndGuestId(int houseId, int guestId);

	List<LikeHouse> getWishListByGuestId(int guestId);

}
