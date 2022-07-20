package com.JMThouseWeb.JMThouse.dto;

import java.sql.Timestamp;

import com.JMThouseWeb.JMThouse.model.RoleType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
	private int id;
	private Timestamp creationDate;
	private String email;
	private String phoneNumber;
	private RoleType role;
	private String username;
	private String oauth;
}
