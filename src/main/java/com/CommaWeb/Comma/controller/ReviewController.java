package com.CommaWeb.Comma.controller;

import java.util.ArrayList;

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

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.model.Review;
import com.CommaWeb.Comma.service.HouseService;
import com.CommaWeb.Comma.service.ReservationService;
import com.CommaWeb.Comma.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private HouseService houseService;

	@Autowired
	private ReservationService reservationService;

	// 리뷰 작성 폼 호출
	@GetMapping("/post_form/{reservationId}")
	public String getReviewForm(@PathVariable int reservationId,
			@AuthenticationPrincipal PrincipalDetail principalDetail, Model model) {
		model.addAttribute("reservation", reservationService.findByResId(reservationId));
		return "review/review_post_form";
	}

	// 리뷰 수정 폼 호출
	@GetMapping("/update_form/{reviewId}")
	public String getReviewUpdateForm(@PathVariable int reviewId, Model model) {
		Review reviewEntity = reviewService.getReviewDetail(reviewId);
		model.addAttribute("reviewEntity", reviewEntity);
		return "review/review_update_form";
	}

	// 리뷰 관리 폼 호출 (호스트)
	@GetMapping("/management/{houseId}")
	public String getMyHouseReviewList(@PathVariable int houseId, Model model,
			@PageableDefault(size = 5, sort = "creationDate", direction = Direction.DESC) Pageable pageable) {
		Page<Review> reviews = reviewService.getReviewPageByHouseId(houseId, pageable);

		int nowPage = reviews.getPageable().getPageNumber() + 1;
		int startPage = Math.max(nowPage - 2, 1);
		int endPage = Math.min(nowPage + 2, reviews.getTotalPages());

		int reviewCount = houseService.getReviewCount(houseId);

		// 페이지 번호
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("reviews", reviews);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("houseId", houseId);

		return "review/review_management_form";
	}

	// 내가 작성한 리뷰 목록 폼 호출 (게스트)
	@GetMapping("/my-review-list/{guestId}")
	public String getMyReviewList(@PathVariable int guestId, Model model,
			@PageableDefault(size = 5, sort = "creationDate", direction = Direction.DESC) Pageable pageable) {
		Page<Review> reviews = reviewService.getReviewListByGuestId(guestId, pageable);

		int nowPage = reviews.getPageable().getPageNumber() + 1;
		int startPage = Math.max(nowPage - 2, 1);
		int endPage = Math.min(nowPage + 2, reviews.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}

		int reviewCount = houseService.getReviewCountByGuestId(guestId);

		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("reviews", reviews);
		model.addAttribute("reviewCount", reviewCount);

		return "user/my_review_list_form";
	}

}
