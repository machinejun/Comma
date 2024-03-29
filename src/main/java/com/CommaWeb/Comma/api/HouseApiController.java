package com.CommaWeb.Comma.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.ResponseDto;
import com.CommaWeb.Comma.dto.kakaoSearch.Document;
import com.CommaWeb.Comma.dto.kakaoSearch.KakaoSearch;
import com.CommaWeb.Comma.model.House;
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

	

	@DeleteMapping("/delete/{houseId}")
	public ResponseDto<Integer> deleteHouse(@PathVariable int houseId) {
		// 숙소 삭제 기능
		System.out.println("delete: " + houseId);
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

	@GetMapping("/review-list/{houseId}")
	public Page<Review> getReviewPage(@PathVariable int houseId, Model model,
			@PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable pageable) {

		// 조회한 숙소의 리뷰 목록
		return reviewService.getReviewPageByHouseId(houseId, pageable);
	}
	
	@GetMapping("/house-xy")
	public ResponseDto<Document> findHouseLocation(@RequestParam("houseId") int id){
		House house = houseService.findById(id);
		System.out.println(house.getName());
		KakaoSearch kakao = requestXYLocation(house);		
		return new ResponseDto<Document>(HttpStatus.OK.value(), kakao.getDocuments().get(0));
	}
	
	private KakaoSearch requestXYLocation(House house) {
		RestTemplate transmitter = new RestTemplate();
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "KakaoAK 485a62ce5a393a9978ea206241668428");		
		HttpEntity<MultiValueMap<String, String>> message = new HttpEntity<>(header);
		String url = "https://dapi.kakao.com/v2/local/search/address.json?query=" + house.getDetailAddress();

		ResponseEntity<KakaoSearch> response = transmitter.exchange(url,
				HttpMethod.GET, message, KakaoSearch.class);
		System.out.println(response);
		return response.getBody();
	}
}
