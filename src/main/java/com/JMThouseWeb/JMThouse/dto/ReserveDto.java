package com.JMThouseWeb.JMThouse.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReserveDto {
	private int userId;
	private int houseId;
	private int hostId;
}	
