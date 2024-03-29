package com.CommaWeb.Comma.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.CommaWeb.Comma.model.House;

public interface HouseRepository extends JpaRepository<House, Integer> {

	// 현재 조회 중인 숙소 제외 같은 지역 숙소 리스트 별점 높은 순으로 가져오기
	@Query(value = "SELECT * FROM house WHERE address = ? AND id <> ? ORDER BY starScore DESC LIMIT 4", nativeQuery = true)
	Optional<List<House>> findAllByAddress(String address, int houseId);

	@Query(value = "SELECT * FROM house WHERE hostId = ?1 ORDER BY id DESC", nativeQuery = true)
	List<House> findAllByHostId(@Param(value = "hostId") int hostId);

	List<House> findAllByAddressAndTypeOrderByIdDesc(String address, String type);
	
	List<House> findAllByAddressOrTypeOrderByIdDesc(String address, String type);

	@Query(value = "SELECT * FROM house ORDER BY starscore DESC LIMIT 3;", nativeQuery = true)
	List<House> findAllByStarScore();

}
