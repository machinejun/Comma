package com.JMThouseWeb.JMThouse.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.auth.PrincipalDetail;
import com.JMThouseWeb.JMThouse.dto.ResponseDto;
import com.JMThouseWeb.JMThouse.model.Reply;
import com.JMThouseWeb.JMThouse.model.Review;
import com.JMThouseWeb.JMThouse.service.ReviewService;

@RestController
@RequestMapping("/review")
public class ReviewApiController {

	@Autowired
	private ReviewService reviewService;

	// 리뷰 작성 기능
	@PostMapping("/post")
	public ResponseDto<Review> postReview(@RequestBody Review review,
			@AuthenticationPrincipal PrincipalDetail principalDetail) {
		Review reviewEntity = reviewService.postReview(review, principalDetail.getUser());
		return new ResponseDto<Review>(HttpStatus.OK.value(), reviewEntity);
	}
	
	// 리뷰 수정 기능
	@PutMapping("/{reviewId}")
	public ResponseDto<Review> updateReview(@PathVariable int reviewId,
			@RequestBody Review review) {
		Review reviewEntity = reviewService.updateReview(reviewId, review);
		return new ResponseDto<Review>(HttpStatus.OK.value(), reviewEntity);
	}
	
	
	// 리뷰 삭제 기능
	@DeleteMapping("/{reviewId}")
	public ResponseDto<Integer> deleteReview(@PathVariable int reviewId) {
		reviewService.deleteReview(reviewId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	// 댓글 작성 기능
	@PostMapping("/reply/{reviewId}")
	public ResponseDto<Reply> addReply(@PathVariable int reviewId, @RequestBody Reply reply,
			@AuthenticationPrincipal PrincipalDetail principalDetail) {
		System.out.println("댓글 들어오나요 ??" + reply);
		Reply replyEntity = reviewService.addReply(reviewId, reply, principalDetail.getUser());
		return new ResponseDto<Reply>(HttpStatus.OK.value(), replyEntity);
	}
	
	// 댓글 수정 기능
	@PutMapping("/reply/{replyId}")
	public ResponseDto<Reply> updateReply(@PathVariable int replyId, @RequestBody Reply reply) {
		Reply replyEntity = reviewService.updateReply(replyId, reply);
		return new ResponseDto<Reply>(HttpStatus.OK.value(), replyEntity);
	}
	
	// 댓글 삭제 기능
	@DeleteMapping("/reply/{replyId}")
	public ResponseDto<Integer> deleteReply(@PathVariable int replyId) {
		reviewService.deleteReply(replyId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 리뷰 리스트
	@GetMapping("/list/{houseId}")
	public List<Review> getReviewList(@PathVariable int houseId) {
		List<Review> reviewList = reviewService.getReviewListByHouseId(houseId);
		return reviewList;
	}
	
}