package com.CommaWeb.Comma.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ErrorAdvice {
	
	@ExceptionHandler(value = Exception.class)
	public String showError(Exception e) {
		return "/advice/errorPage";
	}
}
