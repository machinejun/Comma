package com.JMThouseWeb.JMThouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/house")
public class HouseController {
	
	@GetMapping("/list")
	public String houseList() {
		return "house/list_form";
	}

}
