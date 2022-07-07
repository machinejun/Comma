package com.JMThouseWeb.JMThouse.api;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.model.Reservation;

@RestController
@RequestMapping("/api/house")
public class ReservationApiController {
	
	@PostMapping("/reserve")
	public int reserveHouse(@RequestBody Reservation reservation) {
		System.out.println(reservation);
		return 1;
	}
}
