package com.CommaWeb.Comma.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
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
import org.springframework.web.client.RestTemplate;

import com.CommaWeb.Comma.auth.PrincipalDetailService;
import com.CommaWeb.Comma.dto.KakaoProfile;
import com.CommaWeb.Comma.dto.OAuthToken;
import com.CommaWeb.Comma.model.LoginType;
import com.CommaWeb.Comma.model.RoleType;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.service.HouseService;
import com.CommaWeb.Comma.service.LikeHouseService;
import com.CommaWeb.Comma.service.UserService;

@Controller
public class UserController {

	@Value("${kakao.key}")
	private String kakaoPassword;

	@Autowired
	private UserService userService;

	@Autowired
	private LikeHouseService likeHouseService;

	@Autowired
	private HouseService houseService;

	@Autowired
	private AuthenticationManager authenticationManager;
	@Autowired
	PrincipalDetailService detailService;

	@GetMapping({ "", "/" })
	public String home(Model model) {
		// Best 3 가져오기
		model.addAttribute("houses", houseService.getHouseOrderByStarScore());
		return "home";
	}

	@GetMapping("/user/login_form")
	public String loginForm() {
		return "user/login_form";
	}

	@GetMapping("/user/join_form")
	public String joinForm(User user) {
		return "user/join_form";
	}

	@GetMapping("/user/update_form")
	public String updateForm() {
		return "user/update_user_form";
	}

	@GetMapping("/user/join-complete/{userId}")
	public String completeJoinForm(@PathVariable int userId, Model model) {
		model.addAttribute("user", userService.getUserById(userId));
		return "user/join_complete_form";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		return "redirect:/";
	}

	@PostMapping("/user/joinProc")
	public String saveUser(User user) {
		userService.saveUser(user);
		return "redirect:/user/join-complete/" + user.getId();
	}

	// 위시리스트 페이지 호출
	@GetMapping("/guest/wish-list/{guestId}")
	public String getWishList(@PathVariable int guestId, Model model) {
		model.addAttribute("wishList", likeHouseService.getWishListById(guestId));
		return "user/wish_list_form";
	}

	// 회원 관리 페이지 호출
	@GetMapping("/admin/user-management")
	public String adminForm(@RequestParam Map<String, String> map, Model model) {

		String role = map.get("role") == null ? "" : map.get("role");
		String q = map.get("q") == null ? "" : map.get("q");
		System.out.println(role + "/" + q);
		List<User> user;
		if (role.equals("") || role == null) {
			try {
				user = userService.searchUserOnly(q);
				model.addAttribute("users", user);
			} catch (Exception e) {
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

		return "admin/admin_form";
	}

	@GetMapping("/auth/kakao/login_proc")
	public String kakaoCallback(@RequestParam String code) {

		RestTemplate restTemplate = new RestTemplate();
		// 헤더
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();

		params.add("grant_type", "authorization_code");
		params.add("client_id", "485a62ce5a393a9978ea206241668428");
		params.add("redirect_uri", "http://localhost:9090/auth/kakao/login_proc");
		params.add("code", code);

		HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<MultiValueMap<String, String>>(params,
				headers);

		ResponseEntity<OAuthToken> response = restTemplate.exchange("https://kauth.kakao.com/oauth/token",
				HttpMethod.POST, tokenRequest, OAuthToken.class);

		System.out.println(response);

		RestTemplate kakaoUserInfoRestTemplate = new RestTemplate();

		HttpHeaders kakaoUserInfoHeaders = new HttpHeaders();
		kakaoUserInfoHeaders.add("Authorization", "Bearer " + response.getBody().getAccessToken());

		HttpEntity<MultiValueMap<String, String>> kakaoUserInfoRequest = new HttpEntity<>(kakaoUserInfoHeaders);

		ResponseEntity<KakaoProfile> kakaoUserInfoResponse = kakaoUserInfoRestTemplate.exchange(
				"https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoUserInfoRequest, KakaoProfile.class);

		KakaoProfile kakaoAccount = kakaoUserInfoResponse.getBody();
		System.out.println(kakaoAccount);

		User kakaoUser = User.builder().username("kakao_" + kakaoAccount.getProperties().getNickname())
				.email(kakaoUserInfoResponse.getBody().getKakaoAccount().getEmail()).password(kakaoPassword)
				.phoneNumber("폰 번호 재설정 필요").role(RoleType.GUEST).loginType(LoginType.KAKAO).build();

		System.out.println("kakaoUser" + kakaoUser);

		if (userService.checkUsername(kakaoUser.getUsername()).getUsername() == null) {
			userService.saveUser(kakaoUser);
			Authentication authentication = authenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUsername(), kakaoPassword));
			SecurityContextHolder.getContext().setAuthentication(authentication);
			return "redirect:/auth/update_form/";
		}

		detailService.loadUserByUsername(kakaoUser.getUsername());

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUsername(), kakaoPassword));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";
	}

	@GetMapping("/user/behost")
	public String behost() {
		return "/advice/beHost";
	}

	@GetMapping("/user/beguest")
	public String beguest() {
		return "/advice/beGuest";
	}

	@GetMapping("/user/error")
	public String error() {
		return "/advice/errorPage";
	}

	@GetMapping("/admin/show-statistics")
	public String getAdminTable() {
		return "/user/admin_table";
	}

	@GetMapping("/user/my-page")
	public String getMyPage() {
		return "user/my_page_form";
	}

	@GetMapping("/test/map-api")
	public String loadMapForm() {
		return "/house/houseMap";
	}

}
