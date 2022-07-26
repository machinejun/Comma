package com.CommaWeb.Comma.repository;

import java.util.ArrayList;
import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.CommaWeb.Comma.dto.BestHouseDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BestHoustDtoRepository {
	
	private final EntityManager entityManager;
	
	public List<BestHouseDto> findByMonthBestHouse(String month, int limit ){
		String cMonth = month.length() == 1 ? "0" + month : month;
		String queryText = "select h.name, u.username, count(r.id) as numberOfReservation "
				+ "from house as h "
				+ "inner join reservation as r "
				+ "on h.id = r.houseId "
				+ "inner join user as u "
				+ "on h.hostId = u.id "
				+ "where r.checkInDate like \"%-"+ cMonth +"-%\" "
				+ "group by h.id "
				+ "order by numberOfReservation desc "
				+ "limit " + limit;
		
		Query query = entityManager.createNativeQuery(queryText);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.list(query, BestHouseDto.class);	
	}
}
