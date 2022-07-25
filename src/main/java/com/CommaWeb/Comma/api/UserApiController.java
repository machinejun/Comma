package com.CommaWeb.Comma.api;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.RestController;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.ResponseDto;
import com.CommaWeb.Comma.model.Host;
import com.CommaWeb.Comma.model.RoleType;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.service.UserService;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;

	@Autowired
	private AuthenticationManager authenticationManager;

	@PutMapping("/user/update")
	public ResponseDto<Integer> updateUserInfo(@RequestBody User user) {
		userService.updateUserInfo(user);

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
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
		Host hostEntity = new Host();
		principalDetail.getUser().setRole(RoleType.HOST);
		hostEntity.setUser(principalDetail.getUser());
		Collection<GrantedAuthority> collectors = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		collectors.forEach((element) -> {
			element.getAuthority().replace("GUEST", "HOST");
		});

		if (!userService.saveHost(hostEntity)) {
			return "<script>location.href='/house/post_form'</script>";
		}
		return "<script>alert('호스트가 되셨습니다');" + "location.href='/'</script>";
	}

	@GetMapping("/be-guest")
	public String beguest(@AuthenticationPrincipal PrincipalDetail principalDetail) {
		principalDetail.getUser().setRole(RoleType.GUEST);

		Collection<GrantedAuthority> collectors = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		collectors.forEach((element) -> {
			element.getAuthority().replace("HOST", "GUEST");
		});
		return "<script>alert('게스트가 되셨습니다');" + "location.href='/'</script>";
	}
}
