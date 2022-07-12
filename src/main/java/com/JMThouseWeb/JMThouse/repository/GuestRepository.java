package com.JMThouseWeb.JMThouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.JMThouseWeb.JMThouse.model.Guest;

public interface GuestRepository extends JpaRepository<Guest, Integer>{
	
	
}
