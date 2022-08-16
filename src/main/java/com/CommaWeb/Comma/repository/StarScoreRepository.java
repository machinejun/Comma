package com.CommaWeb.Comma.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.CommaWeb.Comma.dto.HouseScoreDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class StarScoreRepository {
	
	private final EntityManager entityManager;
	
	public List<HouseScoreDto> getAvgStarScoreByHouse(int houseId) {
		String sql = "SELECT houseId, ROUND(AVG(starScore), 1) AS score "
				+ "FROM review "
				+ "WHERE houseId = "+houseId+" "
				+ "GROUP BY houseId ";
		
		Query nativeQuery = entityManager.createNativeQuery(sql);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		List<HouseScoreDto> avgDto = jpaResultMapper.list(nativeQuery, HouseScoreDto.class);

		return avgDto;
		
	}
}
