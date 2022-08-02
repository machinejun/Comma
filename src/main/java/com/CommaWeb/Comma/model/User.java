package com.CommaWeb.Comma.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false, unique = true)
	private String username;
	
	@Column(nullable = false, length = 100)
	private String password;
	
	@Column(length = 100)
	private String email;
	
	@Column(length = 50)
	private String phoneNumber;
	
	@CreationTimestamp
	private Timestamp creationDate;
	
	@Enumerated(EnumType.STRING)
	private RoleType role;
	
	@Enumerated(EnumType.STRING)
	private LoginType loginType;
	
}
