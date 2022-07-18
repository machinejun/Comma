package com.JMThouseWeb.JMThouse.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.JMThouseWeb.JMThouse.dto.HostTableDto;
import com.JMThouseWeb.JMThouse.model.Reservation;

import lombok.RequiredArgsConstructor;


public interface ReservationRepository extends JpaRepository<Reservation, Integer>{
	

	
	
	@Query(value = "SELECT * FROM reservation WHERE guestId = ?1", nativeQuery = true)
	List<Reservation> findByGuestId(@Param(value = "guestId")int guestId);
	
	@Query(value = "SELECT * FROM reservation WHERE hostId = ?1", nativeQuery = true)
	List<Reservation> findByHostId(@Param(value = "hostId")int id);
	
	@Query(value = "SELECT username, headCount, checkInDate, checkOutDate, phoneNumber, request, approvalStatus, h.id as houseId, h.name as houseName \r\n"
			+ "FROM reservation r\r\n"
			+ "INNER JOIN house h\r\n"
			+ "ON r.houseId = h.id\r\n"
			+ "INNER JOIN user u\r\n"
			+ "ON r.guestId = u.id\r\n"
			+ "where r.hostId = ?", nativeQuery = true)
	@Modifying
	List<HostTableDto> mSelectReservation(@Param(value = "hostId") int hostId);
}
