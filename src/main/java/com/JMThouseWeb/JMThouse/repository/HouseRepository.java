package com.JMThouseWeb.JMThouse.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.JMThouseWeb.JMThouse.model.House;

public interface HouseRepository extends JpaRepository<House, Integer> {

	// TODO 숙소유형별 숙소 조회
	// select * from house where type = '게스트 하우스';

	// 현재 조회 중인 숙소 제외 같은 지역 숙소 리스트 가져오기
	@Query(value = "SELECT * FROM house WHERE address = ? AND id <> ? LIMIT 4", nativeQuery = true)
	Optional<List<House>> findAllByAddress(String address, int houseId);

	@Query(value = "SELECT * FROM house WHERE hostId = ?1", nativeQuery = true)
	List<House> findAllByHostId(@Param(value = "hostId") int hostId);

	List<House> findAllByAddressAndType(String address, String type);
	
	List<House> findAllByAddressOrType(String address, String type);
}