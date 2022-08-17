package com.CommaWeb.Comma.advice;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.CommaWeb.Comma.dto.ResponseDto;

@RestControllerAdvice
public class RestErrorAdvice {
	
	@ExceptionHandler(value = Exception.class)
	public ResponseDto<String> error(Exception e) {
	return new ResponseDto<String>(HttpStatus.NOT_FOUND.value(), e.getMessage());
	}
}
