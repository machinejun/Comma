package com.JMThouseWeb.JMThouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {
	
	@GetMapping("/")
	public String home() {
		
		return "home";
	}
	
	@GetMapping("/user/bookForm")
	public String reserveHouse() {
		
		return "input";
	}
	
	@GetMapping("/reserve/host")
	public String reserveTable() {
		return "reservation/hostReserveTable";
	}

}
