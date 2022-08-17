package com.CommaWeb.Comma.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.CommaWeb.Comma.model.LikeHouse;

public interface LikeHouseRepository extends JpaRepository<LikeHouse, Integer> {

	void deleteByHouseIdAndGuestId(int houseId, int guestId);
	
	Optional<LikeHouse> findByHouseIdAndGuestId(int houseId, int guestId);

	List<LikeHouse> getWishListByGuestId(int guestId);
	
	@Query(value = "SELECT COUNT(*) FROM likehouse WHERE houseId = ? ", nativeQuery = true)
	int getLikeCount(int houseId);

}
