package com.JMThouseWeb.JMThouse.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.dto.HostTableDto;
import com.JMThouseWeb.JMThouse.model.Reservation;
import com.JMThouseWeb.JMThouse.service.ReservationService;

@RestController
@RequestMapping("/test/api/reserve")
public class ReservationApiController {
	@Autowired
	private ReservationService reservationService;
	
	// /test/api/reserve/house/${houseId}
	
	@PostMapping("/house")
	public int reserveHouse(@RequestBody Reservation reservation) {
		System.out.println(reservation);
		reservationService.makeReservation(reservation);
		
		return 1;
	}
	
	@GetMapping("/house/{hostId}/{houseId}")
	public List<HostTableDto> getHouseReservation(@PathVariable int hostId, @PathVariable int houseId){
		System.out.println(">> "+hostId+"+" + houseId);
		
		List<HostTableDto> result = reservationService.getTableInfo(hostId, houseId);
		return result;
		
	}
	
}
