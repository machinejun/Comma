package com.JMThouseWeb.JMThouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/auth/login_form")
	public String loginForm() {
		return "user/login_form";
	}
	
	@GetMapping("/auth/join_form")
	public String save(User user) {
		return "user/join_form";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "redirect:/";
	}
	
	@PostMapping("/auth/joinProc")
	public String saveUser(User user) {
		userService.saveUser(user);
		return "redirect:/";
	}

}
