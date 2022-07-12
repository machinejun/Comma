package com.JMThouseWeb.JMThouse.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.dto.ReserveDto;
import com.JMThouseWeb.JMThouse.model.Reservation;
import com.JMThouseWeb.JMThouse.service.ReservationService;

@RestController
@RequestMapping("/test/api/reserve")
public class ReservationApiController {
	@Autowired
	private ReservationService reservationService;
	
	@PostMapping("/house")
	public int reserveHouse(@RequestBody Reservation reservation) {
		System.out.println(reservation);
		reservationService.makeReservation(reservation);
		
		return 1;
	}
	
}
