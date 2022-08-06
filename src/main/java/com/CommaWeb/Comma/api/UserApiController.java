package com.CommaWeb.Comma.api;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.ResponseDto;
import com.CommaWeb.Comma.dto.adminDto.BestHouseDto;
import com.CommaWeb.Comma.model.RoleType;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.service.UserService;

@RestController
public class UserApiController {
	
	@Value("${kakao.key}")
	private String kakaoPassword;
	
	@Autowired
	private UserService userService;

	@Autowired
	private AuthenticationManager authenticationManager;	

	@PutMapping("/user/update")
	public ResponseDto<Integer> updateUserInfo(@RequestBody User user) {

		User newUser = userService.updateUserInfo(user);
		System.out.println("newUser" + newUser);

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(newUser.getUsername(), kakaoPassword));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/auth/username-check")
	public ResponseDto<User> joinCheck(@RequestBody User user) {
		User userEntity = userService.checkUsername(user.getUsername());
		return new ResponseDto<>(HttpStatus.OK.value(), userEntity);
	}

	@GetMapping("/be-host")
	public String beHost(@AuthenticationPrincipal PrincipalDetail principalDetail) {
		User hostEntity = new User();
		principalDetail.getUser().setRole(RoleType.HOST);
		hostEntity = principalDetail.getUser();
		Collection<GrantedAuthority> collectors = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		collectors.forEach((element) -> {
			element.getAuthority().replace("GUEST", "HOST");
		});

		return "<script>location.href='/user/behost'</script>";

	}

	@GetMapping("/be-guest")
	public String beguest(@AuthenticationPrincipal PrincipalDetail principalDetail) {
		principalDetail.getUser().setRole(RoleType.GUEST);

		Collection<GrantedAuthority> collectors = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		collectors.forEach((element) -> {
			element.getAuthority().replace("HOST", "GUEST");
		});
		return "<script>location.href='/user/beguest'</script>";
	}
	
	@GetMapping("/test/user/adminTable")
	public ResponseDto<List<BestHouseDto>> loadTableData(@RequestParam String month, @RequestParam int limit){
		System.out.println("ㅋㅋㅋㅋ");
		List<BestHouseDto> list = userService.loadHouseDtolist(month, limit);
		return new ResponseDto<List<BestHouseDto>>(HttpStatus.OK.value(), list);
	}

}
