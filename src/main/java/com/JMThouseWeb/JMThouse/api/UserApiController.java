package com.JMThouseWeb.JMThouse.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.dto.ResponseDto;
import com.JMThouseWeb.JMThouse.model.RoleType;
import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.service.GuestService;
import com.JMThouseWeb.JMThouse.service.UserService;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;

	
}
