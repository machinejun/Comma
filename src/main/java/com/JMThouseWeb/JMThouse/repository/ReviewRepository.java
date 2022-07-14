package com.JMThouseWeb.JMThouse.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.JMThouseWeb.JMThouse.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {

	// select * from review where houseId = 'houseId';
	List<Review> findByHouseId(int houseId);

	@Query(value = "SELECT * FROM review WHERE houseId = ? LIMIT 3", nativeQuery = true)
	List<Review> findAllByHouseIdLmit(int houseId);

	@Query(value = "SELECT COUNT(*) FROM review WHERE houseId = ?", nativeQuery = true)
	int getReviewCount(int houseId);

}
