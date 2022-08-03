package com.CommaWeb.Comma.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	Optional<User> findByUsername(String username);

	@Transactional
	@Query(value = "select * \r\n" + "from user \r\n" + "where username like %:name% \r\n"
			+ "And role = :role", nativeQuery = true)
	List<User> findByRoleAndUserName(@Param(value = "role") String role, @Param(value = "name") String name);

	@Transactional
	List<User> findByUsernameContaining(String name);

	@Transactional
	@Query(value= "delete from user where id= :id", nativeQuery = true)
	Optional<User> deleteUserById(@Param(value= "id") int id);
}
