package com.CommaWeb.Comma.advice;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.CommaWeb.Comma.dto.ErrorDto;

@ControllerAdvice
public class ErrorAdvice {
	
	@ExceptionHandler(value = Exception.class)
	public String showError(Exception e, Model model) {
		ErrorDto errorDto = new ErrorDto();
		errorDto.setErrorClass(e.getClass().toString());
		errorDto.setErrorMessage(e.getMessage());
		errorDto.setErrorCause(e.getCause().toString());
		model.addAttribute("error", errorDto);
		
		System.out.println(e);
		return "errorPage";
	}
}
