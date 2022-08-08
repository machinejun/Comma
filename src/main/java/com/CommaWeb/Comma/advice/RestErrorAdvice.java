package com.CommaWeb.Comma.advice;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class RestErrorAdvice {
	
//	@ExceptionHandler(value = Exception.class)
//	public String error() {
//		return "<script>location.href='/user/error'</script>";
//	}
}
