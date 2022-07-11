package com.JMThouseWeb.JMThouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.model.Review;
import com.JMThouseWeb.JMThouse.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 리뷰 작성 폼 호출
	@GetMapping("/post_form")
	public String getReviewForm() {
		return "review/review_form";
	}

	// 리뷰 관리 폼 호출
	@GetMapping("/list/{houseId}")
	public String getHouseList(@PathVariable int houseId, Model model) {
		List<Review> reviews = reviewService.getReviewList(houseId);
		model.addAttribute("reviews", reviews);
		return "review/management_form";
	}

	// 상세 리뷰 보기
	@GetMapping("/detail/{reviewId}")
	public void getReviewDetail(@PathVariable int reviewId, Model model) {
		Review reviewEntity = reviewService.getReviewDetail(reviewId);
		model.addAttribute("review", reviewEntity);
	}

	// test
	@GetMapping("/list")
	public String getHouseList() {
		return "review/management_form";
	}

}
