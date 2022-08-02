package com.CommaWeb.Comma.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.HouseScoreDto;
import com.CommaWeb.Comma.dto.RequestPostDto;
import com.CommaWeb.Comma.model.House;
import com.CommaWeb.Comma.model.LikeHouse;
import com.CommaWeb.Comma.model.Review;
import com.CommaWeb.Comma.service.HouseService;
import com.CommaWeb.Comma.service.LikeHouseService;
import com.CommaWeb.Comma.service.ReviewService;

@Controller
@RequestMapping("/house")
public class HouseController {

	@Autowired
	private HouseService houseService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private LikeHouseService likeHouseService;

	// 숙소 리스트 페이지 호출
	@GetMapping("/list")
	public String getHouseList(Model model, String address, String type) {

		// 지역별, 유형별 숙소 검색
		List<House> houseList;

		address = address == null ? "" : address;
		type = type == null ? "" : type;

		if (address == "" && type == "") {
			houseList = houseService.getHouseList();
		} else if (address == "" || type == "") {
			houseList = houseService.searchHouseByAddressOrType(address, type);
		} else {
			houseList = houseService.searchHouseByAddressAndType(address, type);
		}

		model.addAttribute("houseList", houseList);
		model.addAttribute("searchedAddress", address);
		model.addAttribute("searchedType", type);

		return "house/list_form";
	}

	// 숙소 상세정보 페이지 호출
	@GetMapping("/detail/{houseId}")
	public String getHouseDetail(@PathVariable int houseId, Model model,
			@AuthenticationPrincipal PrincipalDetail principalDetail,
			@PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable pageable) {
		// 조회한 숙소
		House houseEntity = houseService.getHouseDetail(houseId);
		// 조회한 숙소와 같은 지역의 숙소 목록
		List<House> houseList = houseService.getHouseListByAddress(houseEntity.getAddress(), houseEntity.getId());
		// 조회한 숙소의 리뷰 목록
		Page<Review> reviews = reviewService.getReviewPageByHouseId(houseId, pageable);
		// 숙소 리뷰의 총 개수
		int reviewCount = houseService.getReviewCount(houseId);
		// 조회한 사용자가 해당 숙소를 위시리스트에 넣었는지
		LikeHouse likeHouseEntity = likeHouseService.checkWishList(houseId, principalDetail.getUser().getId());
		// 숙소의 평균 평점
		HouseScoreDto houseScoreDto = reviewService.getAvgStarScore(houseId) == null ? new HouseScoreDto() : reviewService.getAvgStarScore(houseId);

		model.addAttribute("house", houseEntity);
		model.addAttribute("houseList", houseList);
		model.addAttribute("reviews", reviews);
		model.addAttribute("likeHouse", likeHouseEntity);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("avgScore", houseScoreDto.getScore());
		return "house/detail_form";
	}

	// 숙소 등록 페이지 호출
	@GetMapping("/post_form")
	public String getPostingForm() {
		return "house/post_form";
	}

	// 숙소 글 수정 페이지 호출
	@GetMapping("/update_form/{houseId}")
	public String getUpdateForm(@PathVariable int houseId, Model model) {
		House houseEntity = houseService.getHouseDetail(houseId);
		model.addAttribute("house", houseEntity);
		return "house/update_house_form";
	}

	@PostMapping("/post")
	public String postHouse(RequestPostDto requestPostDto, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		houseService.postHouse(requestPostDto, principalDetail.getUser());
		return "redirect:/house/management";
	}

	@PostMapping("/update/{houseId}")
	public String updateHouse(@PathVariable int houseId, RequestPostDto requestPostDto,
			@AuthenticationPrincipal PrincipalDetail principalDetail) {
		houseService.updateHouse(houseId, requestPostDto);
		return "redirect:/house/management";
	}

	// 숙소 관리 폼 호출 (호스트)
	@GetMapping("/management")
	public String getHouseManagementForm(@AuthenticationPrincipal PrincipalDetail principalDetail , Model model) {
		model.addAttribute("houseList", houseService.findAllByHostId(principalDetail.getUser().getId()));
		return "house/house_management_form";
	}

}
