package com.CommaWeb.Comma.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.CommaWeb.Comma.dto.KakaoProfile;
import com.CommaWeb.Comma.dto.OAuthToken;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.service.HouseService;
import com.CommaWeb.Comma.service.LikeHouseService;
import com.CommaWeb.Comma.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private LikeHouseService likeHouseService;

	@Autowired
	private HouseService houseService;

	@GetMapping({ "", "/" })
	public String home(Model model) {
		// Best 3 가져오기
		model.addAttribute("houses", houseService.getHouseOrderByStarScore());
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
	/*
	 * secu
	 */
	@GetMapping("/wish-list/{guestId}")
	public String getWishList(@PathVariable int guestId, Model model) {
		model.addAttribute("wishList", likeHouseService.getWishListById(guestId));
		return "user/wish_list_form";
	}

	// 관리자페이지 호출
	@GetMapping("/admin_form")
	public String adminForm() {
		return "user/admin_form";
	}

	// 유저 검색
	@GetMapping("/user/searchUsername")
	public String searchUsername(@RequestParam Map<String, String> map, Model model) {

		String role = map.get("role") == null ? "" : map.get("role");
		String q = map.get("q") == null ? "" : map.get("q");
		System.out.println(role + "/" + q);
		List<User> user;
		if (role.equals("") || role == null) {
			try {
				user = userService.searchUserOnly(q);
				model.addAttribute("users", user);
			} catch (Exception e) {
<<<<<<< HEAD
=======

>>>>>>> c9797ebb49e478fe84dd5857cf08935130115f7d
				e.printStackTrace();
			}

		} else {
			try {
				user = userService.searchRoleAndUser(role, q);
				model.addAttribute("users", user);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return "user/admin_form";
	}
	
	
	@GetMapping("/auth/kakao/callback")
	@ResponseBody
	public String kakaoCallback(@RequestParam String code) {
		// HTTPURLConnect ...
		// Retrofit2
		// OkHttp
		// RestTemplate
		RestTemplate rt = new RestTemplate();
		
		// http 메시지 -> POST
		
		// 시작줄
		// http header
		// http body
		
		// header 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// body 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		
		params.add("grant_type", "authorization_code");
		params.add("client_id", "1e0d85577dad20bb9104174f24adbfb7");
		params.add("redirect_uri", "http://localhost:9090/auth/kakao/callback");
		params.add("code", code);
		
		// header와 body를 하나의 object로 담아야한다.
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		// 준비 끝 Http 요청 - post 방식 - 응답
		ResponseEntity<String> response = 
				rt.exchange("https://kauth.kakao.com/oauth/token", 
						HttpMethod.POST, kakaoTokenRequest, String.class);
		
		// response -> object 타입으로 변환 (Gson, Json Simple, ObjectMapper)
		OAuthToken authToken = null;
		
		ObjectMapper objectMapper = new ObjectMapper();
		// String --> Object (클래스 생성)
		try {
			authToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// 액세스 토큰 사용
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + authToken.getAccessToken()); // Bearer 무조건 한 칸 띄움
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8 ");		
		
		// body
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);
		
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", 
				HttpMethod.POST, kakaoProfileRequest, String.class);
		
		//System.out.println(response2);
		
		// data parsing 하기 (KakaoProfile.class)
		KakaoProfile kakaoProfile = null;
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// POST -->
		// 통신 -- 인증서버
		return "카카오 프로필 정보 요청 : " + kakaoProfile;
	}

}
