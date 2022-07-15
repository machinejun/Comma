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

	// select * from house where address = '서울';
	@Query(value = "SELECT * FROM house WHERE address = ? AND id <> ? LIMIT 4", nativeQuery = true)
	Optional<List<House>> findAllByAddress(String address, int houseId);

	@Query(value = "SELECT * FROM house WHERE hostId = ?1", nativeQuery = true)
	List<House> findAllByHostId(@Param(value = "hostId") int hostId);
}
