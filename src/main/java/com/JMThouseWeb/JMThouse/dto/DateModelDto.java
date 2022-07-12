package com.JMThouseWeb.JMThouse.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class DateModelDto {
	private int index;
	private LocalDate date;
}
