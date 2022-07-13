package com.JMThouseWeb.JMThouse.dto;

import java.math.BigInteger;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HoustWaitDto {
	private BigInteger houseId;
	private Integer wait;

}
