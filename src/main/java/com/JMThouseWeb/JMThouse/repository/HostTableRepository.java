package com.JMThouseWeb.JMThouse.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.stereotype.Repository;

import com.JMThouseWeb.JMThouse.dto.HostTableDto;
import com.JMThouseWeb.JMThouse.dto.HoustWaitDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class HostTableRepository {
	
	private final EntityManager entityManager;
	
	public List<HostTableDto> getlist(int hostid, int houseid) {
		
		String sql= "SELECT r.id as id,username, headCount, checkInDate, checkOutDate, phoneNumber, request, approvalStatus, h.id as houseId, h.name as houseName \r\n"
				+ "FROM reservation r\r\n"
				+ "INNER JOIN house h\r\n"
				+ "ON r.houseId = h.id\r\n"
				+ "INNER JOIN user u\r\n"
				+ "ON r.guestId = u.id\r\n"
				+ "where r.hostId = "+hostid+"\r\n"
				+ "and h.id = "+houseid;
		
		Query nativeQuery = entityManager.createNativeQuery(sql);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.list(nativeQuery, HostTableDto.class);
		
	}
	
public List<HoustWaitDto> getWaitCount(int id) {
	
		String sql="select count(id) as wait, houseId\r\n"
				+ "from reservation\r\n"
				+ "where hostId ="+id+"\r\n"
				+ "and approvalStatus like 'WAITING'\r\n"
				+ "group by houseId";
		
		Query nativeQuery = entityManager.createNativeQuery(sql);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return jpaResultMapper.list(nativeQuery, HoustWaitDto.class);
		
	}

}
