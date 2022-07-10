package com.JMThouseWeb.JMThouse.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.JMThouseWeb.JMThouse.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{
	
	// select * from review where houseId = 'houseId';
	List<Review> findByHouseId(int houseId);

}
