package com.CommaWeb.Comma.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.CommaWeb.Comma.model.Report;

public interface ReportRepository extends JpaRepository<Report, Integer>{

	@Query(value = "SELECT * FROM report WHERE reporter = ? ", nativeQuery = true)
	List<Report> findAllByReporter(int reporterId);

	@Query(value = "SELECT * FROM report ORDER BY id DESC ", nativeQuery = true)
	List<Report> findAllOrderByIdDesc();
	
	// UPDATE report SET reportStatus = 'APPROVED' WHERE id = 3;

}
