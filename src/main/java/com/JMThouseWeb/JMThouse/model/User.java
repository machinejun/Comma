package com.JMThouseWeb.JMThouse.model;

import java.sql.Timestamp;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class User {

	private String username;

	private String password;

	private String email;

	private String phoneNumber;

	private Timestamp creationDate;

	private RoleType role;
}
