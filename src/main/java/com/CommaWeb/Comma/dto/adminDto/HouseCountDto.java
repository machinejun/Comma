package com.CommaWeb.Comma.dto.adminDto;

import java.math.BigInteger;

public class HouseCountDto {
	private String address;
	private int count;
	
	public HouseCountDto(String address, BigInteger count) {
		this.address = address;
		this.count = count.intValue();
	}

}
