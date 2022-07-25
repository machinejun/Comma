package com.CommaWeb.Comma.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ErrorAdvice {
	
	@ExceptionHandler(value = NullPointerException.class)
	public String showError() {
		return "";
	}
}
