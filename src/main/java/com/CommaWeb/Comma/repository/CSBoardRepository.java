package com.CommaWeb.Comma.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.CommaWeb.Comma.model.CustomServiceBoard;

public interface CSBoardRepository extends JpaRepository<CustomServiceBoard, Integer>{
	
	@Query(value = "SELECT * FROM customserviceboard WHERE title like %?% order by id desc", nativeQuery = true)
	Page<CustomServiceBoard> findByTitleContaining(String title, Pageable pageable);
}
