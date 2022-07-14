package com.JMThouseWeb.JMThouse.repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.JMThouseWeb.JMThouse.dto.HouseScoreDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class StarScoreRepository {
	
	private final EntityManager entityManager;
	
	public HouseScoreDto getAvgStarScoreByHouse(int houseId) {
		String sql = "SELECT houseId, ROUND(AVG(starScore), 1) AS score\r\n"
				+ "FROM review\r\n"
				+ "WHERE houseId = "+houseId+"\r\n"
				+ "GROUP BY houseId";
		
		Query nativeQuery = entityManager.createNativeQuery(sql);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.uniqueResult(nativeQuery, HouseScoreDto.class);
		
	}
}
