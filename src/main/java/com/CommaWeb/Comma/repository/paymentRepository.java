package com.CommaWeb.Comma.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CommaWeb.Comma.model.Payment;

public interface paymentRepository extends JpaRepository<Payment, Integer> {
	
	
}
