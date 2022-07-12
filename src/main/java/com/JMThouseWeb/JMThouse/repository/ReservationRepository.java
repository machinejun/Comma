package com.JMThouseWeb.JMThouse.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.JMThouseWeb.JMThouse.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Integer>{
	
	@Query(value = "SELECT * FROM reservation WHERE userId = ?1", nativeQuery = true)
	Optional<Reservation> findByGuestId(@Param(value = "userId")int userId);
	
	@Query(value = "SELECT * FROM reservation WHERE hostId = ?1", nativeQuery = true)
	Optional<Reservation> findByHostId(@Param(value = "hostId")int id);
}
