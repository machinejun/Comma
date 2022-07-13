package com.JMThouseWeb.JMThouse.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HostTableDto {
	private int id;
	private String username;
	private int headCount;
	private Date checkInDate;
	private Date checkOutDate;
	private String phoneNumber;
	private String request;
	private String approvalStatus;
	private int houseId;
	private String houseName;
}
