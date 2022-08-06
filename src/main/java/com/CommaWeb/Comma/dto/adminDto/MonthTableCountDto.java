package com.CommaWeb.Comma.dto.adminDto;

import java.math.BigInteger;

public class MonthTableCountDto {
	private int month;
	private int count;
	
	public MonthTableCountDto(int month, BigInteger count) {
		this.month = month;
		this.count = count.intValue();
	}
}
