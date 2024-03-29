package com.CommaWeb.Comma.api;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.ResponseDto;
import com.CommaWeb.Comma.dto.adminDto.AdmintableDto;

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
				.authenticate(new UsernamePasswordAuthenticationToken(newUser.getUsername(), user.getPassword()));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/user/username-check")
	public ResponseDto<User> joinCheck(@RequestBody User user) {
		User userEntity = userService.checkUsername(user.getUsername());
		return new ResponseDto<>(HttpStatus.OK.value(), userEntity);
	}

	@GetMapping("/guest/be-host")
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

	@GetMapping("/host/be-guest")
	public String beguest(@AuthenticationPrincipal PrincipalDetail principalDetail) {
		principalDetail.getUser().setRole(RoleType.GUEST);

		Collection<GrantedAuthority> collectors = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		collectors.forEach((element) -> {
			element.getAuthority().replace("HOST", "GUEST");
		});
		return "<script>location.href='/user/beguest'</script>";
	}
	
	// index=3&month=3&limit=10
	// index=1
	// index=2
	@GetMapping("/admin/adminTable")
	public ResponseDto<Map<String, List<AdmintableDto>>> loadTableData(@RequestParam Map<String, String> data){
		Map<String, List<AdmintableDto>> maps = new LinkedMultiValueMap<>();
		switch (data.get("index")) {
		case "0":
			maps.put("user", userService.loadMonthTableCount("user"));
			maps.put("house", userService.loadMonthTableCount("house"));
			maps.put("reservation", userService.loadMonthTableCount("reservation"));
			maps.put("review", userService.loadMonthTableCount("review"));
			System.out.println(maps);
			return new ResponseDto<Map<String, List<AdmintableDto>>>(HttpStatus.OK.value(), maps);
		case "1":
			maps.put("address", userService.loadAddressHouseCount());
			System.out.println(maps);
			return new ResponseDto<Map<String,List<AdmintableDto>>>(HttpStatus.OK.value(), maps);
		default :
			maps.put("best", userService.loadHouseDtolist(data.get("month"), data.get("limit")));
			System.out.println(maps);
			return new ResponseDto<Map<String, List<AdmintableDto>>>(HttpStatus.OK.value(), maps);
		}
	}
	
	@DeleteMapping("/admin/user/delete/{id}")
	public ResponseDto<Integer> deleteUser(@PathVariable int id) {
		userService.deleteUser(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}


}
