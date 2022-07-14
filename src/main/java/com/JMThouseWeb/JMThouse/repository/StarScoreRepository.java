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
	
	public HouseScoreDto AvgStarScoreByHouse(int houseid) {
		String sql = "select houseId ,avg(starScore) as score\r\n"
				+ "from review\r\n"
				+ "where houseid = "+houseid+"\r\n"
				+ "group by houseId";
		
		Query nativeQuery = entityManager.createNativeQuery(sql);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.uniqueResult(nativeQuery, HouseScoreDto.class);
		
	}
}
