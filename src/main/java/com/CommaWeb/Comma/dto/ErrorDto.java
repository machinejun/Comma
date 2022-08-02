package com.CommaWeb.Comma.dto;

import lombok.Data;

@Data
public class ErrorDto {
	private String errorClass;
	private String errorMessage;
	private String errorCause;

}
