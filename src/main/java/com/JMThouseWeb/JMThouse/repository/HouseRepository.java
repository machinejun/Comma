package com.JMThouseWeb.JMThouse.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.JMThouseWeb.JMThouse.model.House;

public interface HouseRepository extends JpaRepository<House, Integer> {

	// TODO 지역별, 숙소유형별 숙소 조회 쿼리문 작성

	// select * from house where address = '서울';
	List<House> findAllByAddress(String address);

	// select * from house where type = '게스트 하우스';

}
