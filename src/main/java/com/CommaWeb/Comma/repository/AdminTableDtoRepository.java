package com.CommaWeb.Comma.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.CommaWeb.Comma.dto.adminDto.BestHouseDto;
import com.CommaWeb.Comma.dto.adminDto.HouseCountDto;
import com.CommaWeb.Comma.dto.adminDto.MonthTableCountDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminTableDtoRepository {
	
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
	
	public List<MonthTableCountDto> loadMonthTableCount(String table){
		String queryText ="select month(creationDate) as month , count(id) as count "
				+ "from " + table + " "
				+ "group by month(creationDate);";
		Query query = entityManager.createNativeQuery(queryText);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.list(query, MonthTableCountDto.class);
	}
	
	public List<HouseCountDto> loadAddressHouseCount(){
		String queryText ="select address, count(address) as count "
				+ "from house "
				+ "group by addres;";
		Query query = entityManager.createNativeQuery(queryText);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.list(query, HouseCountDto.class);
	}
}
