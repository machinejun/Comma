package com.JMThouseWeb.JMThouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/house")
public class HouseController {
	
	// 숙소 리스트 페이지 호출
	@GetMapping("/list")
	public String getHouseList() {
		return "house/list_form";
	}
	
	// 숙소 등록 페이지 호출
	@GetMapping("/post")
	public String getPostingForm() {
		return "house/posting_form";
	}

	// 숙소 글 수정 페이지 호출
	@GetMapping("/update_form")
	public String getUpdateForm() {
		return "house/update_form";
	}
	
}
