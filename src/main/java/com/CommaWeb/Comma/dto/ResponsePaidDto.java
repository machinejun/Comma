package com.CommaWeb.Comma.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResponsePaidDto {
	private int resId;
	private String guestName;
	private String hostName;
	private int houseId;
	private String houseName;
	private int price;
	private String tid;
}
