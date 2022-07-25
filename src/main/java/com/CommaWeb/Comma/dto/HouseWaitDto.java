package com.CommaWeb.Comma.dto;

import java.math.BigInteger;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HouseWaitDto {
	private BigInteger wait;
	private Integer houseId;
}
