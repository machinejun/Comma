package com.CommaWeb.Comma.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.DateModelDto;
import com.CommaWeb.Comma.dto.HouseWaitDto;
import com.CommaWeb.Comma.dto.KaKaoPayResponseDto;
import com.CommaWeb.Comma.dto.ResponsePaidDto;
import com.CommaWeb.Comma.model.BookedDate;
import com.CommaWeb.Comma.model.House;
import com.CommaWeb.Comma.model.Reservation;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.service.HouseService;
import com.CommaWeb.Comma.service.ReservationService;
import com.CommaWeb.Comma.service.UserService;

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

	// 예약 페이지를 그려주는데 필요한 데이터를 보내주는 기능
	@GetMapping("/user/bookForm/{houseid}")
	public String reserveHouse(@PathVariable int houseid, Model model) {
		House house = houseService.getHouseDetail(houseid);
		
		int index = 0;
		ArrayList<DateModelDto> dates = new ArrayList<DateModelDto>();
		for(BookedDate date : reservationService.getListBookedDate(houseid)) {
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
	
	// 호스트 예약 테이블을 그려주는데 필요한 데이터를 보내주는 기능
	@GetMapping("/reserveTable/host")
	public String reserveHostTable(@AuthenticationPrincipal PrincipalDetail principalDetail, Model model) {
		List<HouseWaitDto> count = reservationService.getWaitCount(principalDetail.getUser().getId());
		List<House> houses =  houseService.findAllByHostId(principalDetail.getUser().getId());
		System.out.println(count);
		model.addAttribute("houses", houses);
		model.addAttribute("count", count);
		return "reservation/hostReserveTable";
	}
	
	// 유저 예약 테이블을 그려주는데 필요한 데이터를 보내주는 기능
	@GetMapping("/reserveTable/user")
	public String reserveUserTable(@AuthenticationPrincipal PrincipalDetail principalDetail, Model model) {
		User user = userService.findByUserId(principalDetail.getUser().getId());
		System.out.println(user);
		List<Reservation> res = reservationService.getReservation(user);
		model.addAttribute("reservations", res);
		return "reservation/userReservationTable";
	}
	
	// 카카오 결제 완료 시 redirect 되는 주소
	@GetMapping("/kakao/approve")
	public String approve(@RequestParam String pg_token, Model model) {
		ResponsePaidDto paidDto = (ResponsePaidDto) httpSession.getAttribute("kakao");
		httpSession.removeAttribute("kakao");
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
	
	// 카카오 결제 완료 승인을 카카오 페이에게 요청하는 기능
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
	
	// 예약완료시 예약에 관련된 어드바이스를 보여주는 기능
	@GetMapping("/user/advice")
	public String showAdvice() {
		return "/advice/reservationAdvice";
	}
}
