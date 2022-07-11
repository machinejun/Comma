package com.JMThouseWeb.JMThouse.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JMThouseWeb.JMThouse.auth.PrincipalDetail;
import com.JMThouseWeb.JMThouse.dto.ResponseDto;
import com.JMThouseWeb.JMThouse.model.Reply;
import com.JMThouseWeb.JMThouse.model.Review;
import com.JMThouseWeb.JMThouse.service.ReviewService;

@RestController
@RequestMapping("/api/review")
public class ReviewApiController {

	@Autowired
	private ReviewService reviewService;

	// 리뷰 작성 기능
	@PostMapping("/post")
	public ResponseDto<Integer> postReview(@RequestBody Review review,
			@AuthenticationPrincipal PrincipalDetail principalDetail) {
		// TODO House 데이터 같이 보내기
		reviewService.postReview(review, principalDetail.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	// 호스트의 댓글 작성 기능
	@PostMapping("/{reviewId}")
	public ResponseDto<Reply> addReply(@PathVariable int reviewId, @RequestBody Reply reply,
			@AuthenticationPrincipal PrincipalDetail principalDetail) {
		Reply replyEntity = reviewService.addReply(reviewId, reply, principalDetail.getUser());
		return new ResponseDto<Reply>(HttpStatus.OK.value(), replyEntity);
	}

}
