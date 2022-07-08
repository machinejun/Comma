package com.JMThouseWeb.JMThouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.JMThouseWeb.JMThouse.service.GuestService;

@Controller
@RequestMapping("/guest")
public class GuestController {

	@Autowired
	private GuestService guestService;
	
	@GetMapping("/login_form")
	public String loginForm() {
		return "user/login_form";
	}
	
	@GetMapping("/join_form")
	public String joinForm() {
		return "user/join_form";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "redirect:/";
	}
}
