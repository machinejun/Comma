package com.JMThouseWeb.JMThouse.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.service.LikeHouseService;
import com.JMThouseWeb.JMThouse.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private LikeHouseService likeHouseService;

	@GetMapping({ "", "/" })
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
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		return "redirect:/";
	}

	@PostMapping("/auth/joinProc")
	public String saveUser(User user) {
		userService.saveUser(user);
		return "redirect:/";
	}

	@GetMapping("/reservation-history/{guestId}")
	public String reservationHistory(@PathVariable int guestId) {
		return "user/reservation_history_form";
	}

	// 위시리스트 페이지 호출
	@GetMapping("/wish-list/{guestId}")
	public String getWishList(@PathVariable int guestId, Model model) {
		model.addAttribute("wishList", likeHouseService.getWishListById(guestId));
		return "user/wish_list_form";
	}

	// 관리자페이지 호출
	@GetMapping("/admin_form")
	public String adminForm(Model model) {

		model.addAttribute(userService.showAllUser());
		return "user/admin_form";
	}

	// 유저 검색
	@GetMapping("/user/searchUsername")
	public String searchUsername(@RequestParam Map<String, String> map, Model model) {
		
		String role = map.get("role") == null ? "" : map.get("role");
		String q = map.get("q") == null ? "" : map.get("q");
		System.out.println(role +"/" +q);
		// User user; <------ List<User>
		List<User> user;
		System.out.println("aaaaaaaaaaa");
		if (role.equals("") || role == null) {
			try {
				user = userService.searchUserOnly(q);
				System.out.println("userlist: " + user);
				model.addAttribute("users", user);
				System.out.println("3333333333333333");
			} catch (Exception e) {
				
				System.out.println("bbbbbbbbbbbbb");
				e.printStackTrace();
			}
			
		} else {
			System.out.println("cccccccccccc");
			try {
				user = userService.searchRoleAndUser(role, q);
				System.out.println("userlist: " + user);
				model.addAttribute("users", user);
				System.out.println("44444444444444444");
			} catch (Exception e) {
				System.out.println("dddddddddd");
				e.printStackTrace();
			}
			
		}
		return "user/admin_form";
	}

//	// 유저 검색
//	@GetMapping("/user/search")
//	public String searchCreationDate(String q, Model model) {
//
//		TimeStamp searchUser = q == null ? "" : q;
//		User user;
//		try {
//			user = userService.searchUserByCreationDate(searchUser).orElseThrow(() -> new Exception("해당유저가 없습니다"));
//			model.addAttribute("user", user);
//			System.out.println(userService.searchUserByCreationDate(searchUser));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "user/admin_form";
//	}

	// 유저 검색
	@GetMapping("/user/searchEmail")
	public String searchEmail(String q, Model model) {

		String searchUser = q == null ? "" : q;
		User user;
		try {
			user = userService.searchUserByEmail(searchUser).orElseThrow(() -> new Exception("해당유저가 없습니다"));
			model.addAttribute("user", user);
			System.out.println(userService.searchUserByEmail(searchUser));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/admin_form";
	}

	// 유저 검색
	@GetMapping("/user/searchPhoneNumber")
	public String searchPhoneNumber(String q, Model model) {

		String searchUser = q == null ? "" : q;
		User user;
		try {
			user = userService.searchUserByPhoneNumber(searchUser).orElseThrow(() -> new Exception("해당유저가 없습니다"));
			model.addAttribute("user", user);
			System.out.println(userService.searchUserByPhoneNumber(searchUser));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/admin_form";
	}

//	// 유저 검색
//	@GetMapping("/user/search")
//	public String searchRole(String q, Model model) {
//
//		String searchUser = q == null ? "" : q;
//		User user;
//		try {
//			user = userService.searchUserByRole(searchUser).orElseThrow(() -> new Exception("해당유저가 없습니다"));
//			model.addAttribute("user", user);
//			System.out.println(userService.searchUserByRole(searchUser));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "user/admin_form";
//	}

}
