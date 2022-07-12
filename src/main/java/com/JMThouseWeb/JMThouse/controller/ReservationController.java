package com.JMThouseWeb.JMThouse.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.JMThouseWeb.JMThouse.dto.DateModelDto;
import com.JMThouseWeb.JMThouse.model.BookedDate;
import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.service.HouseService;
import com.JMThouseWeb.JMThouse.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	private HouseService houseService;
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("/test/user/bookForm/{id}")
	public String reserveHouse(@PathVariable int id,Model model) {
		House house = houseService.getHouseDetail(id);
		model.addAttribute("house", house);
		//System.out.println(reservationService.getListBookedDate(id));
		int index = 0;
		ArrayList<DateModelDto> dates = new ArrayList<DateModelDto>();
		for(BookedDate date : reservationService.getListBookedDate(id)) {
			DateModelDto dto = new DateModelDto();
			dto.setDate(date.getBookedDate());
			dto.setIndex(index);
			dates.add(dto);
			index++;
		}
		model.addAttribute("bookedDates", dates);
		model.addAttribute("size", dates.size());

		return "input";
	}
	
	@GetMapping("/test/reserve/host")
	public String reserveTable() {
		return "reservation/hostReserveTable";
	}

}
