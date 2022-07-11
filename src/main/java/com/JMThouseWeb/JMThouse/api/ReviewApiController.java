package com.JMThouseWeb.JMThouse.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	public String postReview(@RequestBody Review review) {
		// TODO User와 함께 보내기
		reviewService.postReview(review);
		return "ok";
	}

	// 호스트의 댓글 작성 기능
	@PostMapping("/{reviewId}")
	public Reply addReply(@PathVariable int reviewId, @RequestBody Reply reply) {
		// TODO User와 함꼐 보내기
		Reply replyEntity = reviewService.addReply(reviewId, reply);
		return replyEntity;
	}

}
