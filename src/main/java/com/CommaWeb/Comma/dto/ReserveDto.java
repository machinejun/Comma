package com.CommaWeb.Comma.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReserveDto<T> {
	private int userId;
	private int houseId;
	private int hostId;
	private T data;
}	
