package com.JMThouseWeb.JMThouse.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.JMThouseWeb.JMThouse.dto.DateModelDto;
import com.JMThouseWeb.JMThouse.dto.HoustWaitDto;
import com.JMThouseWeb.JMThouse.dto.KaKaoPayResponseDto;
import com.JMThouseWeb.JMThouse.dto.ResponsePaidDto;
import com.JMThouseWeb.JMThouse.model.BookedDate;
import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.model.Reservation;
import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.service.HouseService;
import com.JMThouseWeb.JMThouse.service.ReservationService;
import com.JMThouseWeb.JMThouse.service.UserService;

@Controller
public class ReservationController {
	
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private UserService userService;
	@Autowired
	private HouseService houseService;
	@Autowired
	private ReservationService reservationService;

	
	@GetMapping("/test/user/bookForm/{id}")
	public String reserveHouse(@PathVariable int id,Model model) {
		House house = houseService.getHouseDetail(id);
		
		int index = 0;
		ArrayList<DateModelDto> dates = new ArrayList<DateModelDto>();
		for(BookedDate date : reservationService.getListBookedDate(id)) {
			DateModelDto dto = new DateModelDto();
			dto.setDate(date.getBookedDate());
			dto.setIndex(index);
			dates.add(dto);
			index++;
		}
		
		model.addAttribute("house", house);
		model.addAttribute("bookedDates", dates);
		model.addAttribute("size", dates.size());

		return "input";
	}
	
	
	@GetMapping("/test/reserveTable/host/{hostid}")
	public String reserveHostTable(@PathVariable int hostid, Model model) {
		
		List<HoustWaitDto> count = reservationService.getWaitCount(hostid);
		List<House> houses =  houseService.findAllByHostId(hostid);
		System.out.println(count);
		model.addAttribute("houses", houses);
		model.addAttribute("count", count);
		return "reservation/hostReserveTable";
	}
	
	@GetMapping("/test/reserveTable/user/{userid}")
	public String reserveUserTable(@PathVariable int userid, Model model) {
		User user = userService.findByUserId(userid);
		List<Reservation> res = reservationService.getReservation(user);
		model.addAttribute("reservations", res);
		return "reservation/userReservationTable";
	}
	
	@GetMapping("/test/kakao/approve")
	public String approve(@RequestParam String pg_token, Model model) {
		System.out.println("sdfsdfsdfsdfsdsdjlksjfslkfjd");
		ResponsePaidDto paidDto = (ResponsePaidDto) httpSession.getAttribute("kakao");
		ResponseEntity<KaKaoPayResponseDto> response = requestKakaoPaymentApprove(pg_token, paidDto);
		KaKaoPayResponseDto dto = response.getBody();

		if(response.getStatusCode() == HttpStatus.OK) {
			reservationService.kakaoPaymentApprove(paidDto.getResId());
			Reservation res = reservationService.findByResId(paidDto.getResId());
			dto.setApproved_at(dto.getApproved_at().replace("T", " "));
			model.addAttribute("kakao", dto);
			model.addAttribute("reservation", res);
			
			return "/reservation/paymentCompletePage";
		}else {
			return "erroPage";
		}	
	}
	
	private ResponseEntity<KaKaoPayResponseDto> requestKakaoPaymentApprove(String pg_token, ResponsePaidDto paidDto) {
		String pgtoken = pg_token;
		RestTemplate transmitter = new RestTemplate();
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "KakaoAK d8767c47b52237a1d96cea7c9e34596b");
		header.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
		param.add("cid", "TC0ONETIME");
		param.add("tid", paidDto.getTid());
		param.add("partner_order_id", paidDto.getHostName());
		param.add("partner_user_id", paidDto.getGuestName());
		param.add("pg_token", pgtoken);
	
		HttpEntity<MultiValueMap<String, String>> message = new HttpEntity<>(param, header);
		
		ResponseEntity<KaKaoPayResponseDto> response = transmitter.exchange("https://kapi.kakao.com/v1/payment/approve", HttpMethod.POST, message, KaKaoPayResponseDto.class);
		System.out.println(response);
		return response;
	}
	
	@GetMapping("/test/complete")
	public String completePayment() {
		return "/reservation/paymentCompletePage";
	}

}
