package com.CommaWeb.Comma.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.CommaWeb.Comma.dto.adminDto.AdmintableDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminTableDtoRepository {
	
	private final EntityManager entityManager;
	
	public List<AdmintableDto> findByMonthBestHouse(String month, int limit ){
		String cMonth = month.length() == 1 ? "0" + month : month;
		String queryText = "select h.name, u.username, count(r.id) as count "
				+ "from house as h "
				+ "inner join reservation as r "
				+ "on h.id = r.houseId "
				+ "inner join user as u "
				+ "on h.hostId = u.id "
				+ "where r.checkInDate like \"%-"+ cMonth +"-%\" "
				+ "group by h.id "
				+ "order by count desc "
				+ "limit " + limit;
		
		Query query = entityManager.createNativeQuery(queryText);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.list(query, AdmintableDto.class);	
	}
	
	public List<AdmintableDto> loadMonthTableCount(String table){
		String queryText ="select month(creationDate) as month , count(id) as count "
				+ "from " + table + " "
				+ "group by month(creationDate) order by month;";
		Query query = entityManager.createNativeQuery(queryText);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.list(query, AdmintableDto.class);
	}
	
	public List<AdmintableDto> loadAddressHouseCount(){
		String queryText ="select address, count(address) as count "
				+ "from house "
				+ "group by address order by count desc;";
		Query query = entityManager.createNativeQuery(queryText);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.list(query, AdmintableDto.class);
	}
}
