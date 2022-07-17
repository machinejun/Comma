package com.JMThouseWeb.JMThouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping({"", "/"})
	public String home() {
		return "home";
	}
	
	@GetMapping("/auth/login_form")
	public String loginForm() {
		return "user/login_form";
	}

	@GetMapping("/auth/join_form")
	public String joinForm(User user) {
		return "user/join_form";
	}
	
	@GetMapping("/auth/update_form")
	public String updateForm() {
		return "user/update_user_form";
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
	
	@GetMapping("/reservation-history/{guestId}")
	public String reservationHistory(@PathVariable int guestId) {
		return "user/reservation_history";
	}
	
	// test
	@GetMapping("/reservation-info")
	public String reservationHistory() {
		return "user/history_form";
	}
	
	// 위시리스트 페이지 호출
	@GetMapping("/wish-list")
	public String getWishList(Model model) {
		// TODO
		return "user/wish_list_form";
	}
}
