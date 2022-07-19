package com.JMThouseWeb.JMThouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.JMThouseWeb.JMThouse.auth.PrincipalDetail;
import com.JMThouseWeb.JMThouse.model.Review;
import com.JMThouseWeb.JMThouse.service.ReservationService;
import com.JMThouseWeb.JMThouse.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 리뷰 작성 폼 호출
	// TODO house 데이터 같이 보내야함
	@GetMapping("/post_form")
	public String getReviewForm(Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		// model.addAttribute("reservation",
		// reservationService.getReservation(principalDetail.getUser()));
		return "review/review_post_form";
	}

	// 리뷰 수정 폼
	@GetMapping("/update_form/{reviewId}")
	public String getReviewUpdateForm(@PathVariable int reviewId, Model model) {
		model.addAttribute("reivew", reviewService.getReviewDetail(reviewId));
		return "review/review_update_form";
	}

	// 리뷰 관리 폼 호출 (호스트)
	@GetMapping("/management/{houseId}")
	public String getMyHouseReviewList(@PathVariable int houseId, Model model,
			@PageableDefault(size = 5, sort = "id", direction = Direction.DESC) Pageable pageable) {
		Page<Review> reviews = reviewService.getReviewPageByHouseId(houseId, pageable);
		model.addAttribute("houseId", houseId);
		model.addAttribute("reviews", reviews);
		return "review/review_management_form";
	}

}
