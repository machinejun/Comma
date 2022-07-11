package com.JMThouseWeb.JMThouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.JMThouseWeb.JMThouse.model.LikeHouse;

public interface LikeHouseRepository extends JpaRepository<LikeHouse, Integer>{

	// Id로 게스트 찾는 쿼리문
	// select * from likehouse where guest = (select * from guest where userId = 1);
	
	// Id로 하우스 찾는 쿼리문
	//select * from likehouse where house = (select * from house where id = 2);
}
