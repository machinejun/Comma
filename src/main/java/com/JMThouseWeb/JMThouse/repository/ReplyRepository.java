package com.JMThouseWeb.JMThouse.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.model.Reply;
import com.JMThouseWeb.JMThouse.model.Review;

public interface ReplyRepository extends JpaRepository<Reply, Integer>{

	/*
	List<Review> findAllByHouseId(int houseId);
	*/
}
