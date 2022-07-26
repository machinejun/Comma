package com.CommaWeb.Comma.dto;

import java.math.BigInteger;

import lombok.ToString;

@ToString
public class BestHouseDto {
	private String name;
	private String username;
	private int numberOfReservation;
	
	public BestHouseDto(String name, String username, BigInteger numberOfReservation) {
		this.name = name;
		this.username = username;
		this.numberOfReservation = numberOfReservation.intValue();
	}
}
