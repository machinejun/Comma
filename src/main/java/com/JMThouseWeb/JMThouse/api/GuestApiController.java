package com.JMThouseWeb.JMThouse.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.dto.ResponseDto;
import com.JMThouseWeb.JMThouse.model.Guest;
import com.JMThouseWeb.JMThouse.service.GuestService;

@RestController
public class GuestApiController {

	@Autowired
	private GuestService guestService;
	
	@PostMapping("/api/guest")
	public ResponseDto<Integer> save(@RequestBody Guest guest){
		System.out.println("GuestApiController 호출");
		int result = guestService.saveGuest(guest);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
}
