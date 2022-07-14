package com.JMThouseWeb.JMThouse.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.JMThouseWeb.JMThouse.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{
	
	// select * from review where houseId = 'houseId';
	List<Review> findByHouseId(int houseId);
	
	// TODO houseId 넣어서 수정하기
	@Query(value = "SELECT * FROM review LIMIT 3", nativeQuery = true)
	List<Review> findAllByHouseIdLmit();
	
	// TODO houseId 넣어서 수정하기
	// select count(*) from review where houseId = 1;
	@Query(value = "SELECT COUNT(*) FROM review", nativeQuery = true)
	int getReviewCount();

}
