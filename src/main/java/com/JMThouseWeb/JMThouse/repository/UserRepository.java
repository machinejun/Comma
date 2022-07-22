package com.JMThouseWeb.JMThouse.repository;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.JMThouseWeb.JMThouse.model.RoleType;
import com.JMThouseWeb.JMThouse.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	Optional<User> findByUsername(String username);
	Optional<User> findByCreationDate(Timestamp creationDate);
	Optional<User> findByEmail(String email);
	Optional<User> findByPhoneNumber(String phoneNumber);
	Optional<User> findByRole(RoleType role);
	
	//boolean existsByUsername(String username);
	
	@Query(value = "select * \r\n"
			+ "from user \r\n"
			+ "where username like %:name% \r\n"
			+ "And role = :role", nativeQuery = true)
	List<User> findByRoleAndUserName(@Param(value = "role") String role, @Param(value = "name")  String name);
	
	@Query(value = "select * \r\n"
			+ "from user \r\n"
			+ "where username like %:name% \r\n", nativeQuery = true)
	List<User> findByUserName(@Param(value = "name")  String name);

}
