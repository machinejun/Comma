package com.JMThouseWeb.JMThouse.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.JMThouseWeb.JMThouse.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {

	// select * from review where houseId = 'houseId';
	// List<Review> findAllByHouseId(int houseId);

	@Query(value = "SELECT * FROM review WHERE houseId = ?", nativeQuery = true)
	Page<Review> findAllByHouseId(int houseId, Pageable pageable);

	@Query(value = "SELECT COUNT(*) FROM review WHERE houseId = ?", nativeQuery = true)
	Optional<Integer> getReviewCount(int houseId);
	
	List<Review> findAllByHouseId(int houseId);

	Optional<List<Review>> findAllByGuestId(int guestId);

}
