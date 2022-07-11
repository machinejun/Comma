package com.JMThouseWeb.JMThouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {
	
	@GetMapping("/house/reserve")
	public String reserveHouse() {
		
		return "/reservation/bookForm";
	}

}
