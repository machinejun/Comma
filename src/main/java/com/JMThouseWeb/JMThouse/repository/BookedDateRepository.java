package com.JMThouseWeb.JMThouse.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.JMThouseWeb.JMThouse.model.BookedDate;

public interface BookedDateRepository extends JpaRepository<BookedDate, Integer>{
	
	@Query(value = "SELECT * FROM bookeddate WHERE houseId = ?1", nativeQuery = true)
	List<BookedDate> findAllByHouseId(@Param(value = "houseId")int id);
}
