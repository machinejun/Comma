package com.CommaWeb.Comma.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
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

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.ResponseDto;
import com.CommaWeb.Comma.model.House;
import com.CommaWeb.Comma.model.LikeHouse;
import com.CommaWeb.Comma.model.Review;
import com.CommaWeb.Comma.service.HouseService;
import com.CommaWeb.Comma.service.LikeHouseService;
import com.CommaWeb.Comma.service.ReviewService;

@RestController
@RequestMapping("/api/house")
public class HouseApiController {

	@Autowired
	private HouseService houseService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private LikeHouseService likeHouseService;

	@PutMapping("/{houseId}")
	public House updateHouse(@PathVariable int houseId, @RequestBody House house) {
		// 숙소 정보 수정 기능
		houseService.updateHouse(houseId, house);
		return house;
	}

	@DeleteMapping("/{houseId}")
	public ResponseDto<Integer> deleteHouse(@PathVariable int houseId) {
		// 숙소 삭제 기능
		houseService.deleteHouse(houseId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/wish-list")
	public ResponseDto<Integer> addWishList(@RequestBody House house,
			@AuthenticationPrincipal PrincipalDetail principalDetail) {
		// 위시리스트 추가 기능
		System.out.println("위시리스트 추가 확인");
		houseService.addWishList(house.getId(), principalDetail.getUser());
		int likeCount = likeHouseService.getLikeCount(house.getId());

		return new ResponseDto<Integer>(HttpStatus.OK.value(), likeCount);
	}

	@DeleteMapping("/wish-list/{houseId}")
	public ResponseDto<Integer> deleteItemOfWishList(@PathVariable int houseId,
			@AuthenticationPrincipal PrincipalDetail principalDetail) {
		System.out.println("위시리스트 삭제 확인");
		houseService.deleteItemOfWishList(houseId, principalDetail.getUser().getId());
		int likeCount = likeHouseService.getLikeCount(houseId);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), likeCount);
	}

	@GetMapping("/{houseId}")
	public Page<Review> getReviewPage(@PathVariable int houseId, Model model,
			@PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable pageable) {

		// 조회한 숙소의 리뷰 목록
		return reviewService.getReviewPageByHouseId(houseId, pageable);
	}
}
