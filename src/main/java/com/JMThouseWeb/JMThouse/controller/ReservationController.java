package com.JMThouseWeb.JMThouse.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.JMThouseWeb.JMThouse.dto.DateModelDto;	
import com.JMThouseWeb.JMThouse.dto.HoustWaitDto;
import com.JMThouseWeb.JMThouse.dto.KaKaoPayDto;
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
	
	@GetMapping("/test/reserveTable/host/{hostid}")
	public String reserveHostTable(@PathVariable int hostid, Model model) {
		
		List<HoustWaitDto> count = reservationService.getWaitCount(hostid);
		List<House> houses =  houseService.findAllByHostId(hostid);
		System.out.println(count);
		model.addAttribute("houses", houses);
		model.addAttribute("count", count);
		return "reservation/hostReserveTable";
	}
	
	@GetMapping("/test/reserveTable/user/{guestid}")
	public String reserveUserTable(@PathVariable int guestid, Model model) {
		
		return "reservation/guestReserveTable";
	}
	
	@GetMapping("/test/reserve/kakao")
	public String kakaoPay() {
		System.out.println("들어옴");
		RestTemplate message = new RestTemplate();
//		message.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
//		message.setErrorHandler(new DefaultResponseErrorHandler() {
//			public boolean hasErro(ClientHttpResponse response) throws IOException {			
//				HttpStatus code = response.getStatusCode();
//				return code.series() == HttpStatus.Series.SERVER_ERROR;
//			}
//		});
		
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "KakaoAK " + "﻿079a6ef1fe80237bf7f3bd09be12beb0");
		header.add("Content-type","application/x-www-form-urlencoded; charset=utf-8");
		
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "tenco");
        params.add("item_name", "갤럭시S9");
        params.add("quantity", "1");
        params.add("total_amount", "2100");
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:9090/test/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:9090/test//kakaoPayCancel");
        params.add("fail_url", "http://localhost:9090/test/kakaoPaySuccessFail");
		

		HttpEntity<MultiValueMap<String, String>> kakaoRequest = new HttpEntity<MultiValueMap<String, String>>(params, header);
		try {
			ResponseEntity<KaKaoPayDto> response 
			= message.exchange("https://kapi.kakao.com/v1/payment/ready", HttpMethod.POST, kakaoRequest, KaKaoPayDto.class);
			return response.getBody().getNext_redirect_pc_url();
		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ResponseEntity<KaKaoPayDto> response 
				= message.exchange("https://kapi.kakao.com/v1/payment/ready", HttpMethod.POST, kakaoRequest, KaKaoPayDto.class);
		
		
		return response.toString();
	}
	
	@GetMapping("/test/kakaoPaySuccess")
	@ResponseBody
	public void kakaoPaySuccess(@RequestBody KaKaoPayDto pg_token) {
		System.out.println("sssss " + pg_token);
	        
	}

}
