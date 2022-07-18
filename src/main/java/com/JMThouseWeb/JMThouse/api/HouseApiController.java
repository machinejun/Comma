package com.JMThouseWeb.JMThouse.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.auth.PrincipalDetail;
import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.model.Review;
import com.JMThouseWeb.JMThouse.service.HouseService;
import com.JMThouseWeb.JMThouse.service.ReviewService;

@RestController
@RequestMapping("/api/house")
public class HouseApiController {

	@Autowired
	private HouseService houseService;

	@Autowired
	private ReviewService reviewService;

	@PutMapping("/{houseId}")
	public House updateHouse(@PathVariable int houseId, @RequestBody House house) {
		// 숙소 정보 수정 기능
		houseService.updateHouse(houseId, house);
		return house;
	}

	@DeleteMapping("/{houseId}")
	public void deleteHouse(@PathVariable int houseId) {
		// 숙소 삭제 기능
		houseService.deleteHouse(houseId);
	}

	@PostMapping("/wish-list")
	public void addWishList(@RequestBody House house, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		// 위시리스트 추가 기능
		System.out.println("위시리스트 추가 확인");
		houseService.addWishList(house.getId(), principalDetail.getUser());
	}

	@DeleteMapping("/wish-list/{houseId}")
	public void deleteItemOfWishList(@PathVariable int houseId,
			@AuthenticationPrincipal PrincipalDetail principalDetail) {
		System.out.println("위시리스트 삭제 확인");
		houseService.deleteItemOfWishList(houseId, principalDetail.getUser().getId());
	}

	@GetMapping("/{houseId}")
	public Page<Review> getReviewPage(@PathVariable int houseId, Model model,
			@PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable pageable) {

		// 조회한 숙소의 리뷰 목록
		System.out.println("리뷰 페이지 불러오기");
		return reviewService.getReviewPageByHouseId(houseId, pageable);
	}
}
