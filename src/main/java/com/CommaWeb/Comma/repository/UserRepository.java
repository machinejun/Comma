package com.CommaWeb.Comma.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CommaWeb.Comma.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	Optional<User> findByUsername(String username);
	
	//boolean existsByUsername(String username);

}
