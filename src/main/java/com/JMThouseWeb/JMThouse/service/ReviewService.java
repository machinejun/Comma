package com.JMThouseWeb.JMThouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.dto.HouseScoreDto;
import com.JMThouseWeb.JMThouse.model.Reply;
import com.JMThouseWeb.JMThouse.model.Review;
import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.repository.ReplyRepository;
import com.JMThouseWeb.JMThouse.repository.ReviewRepository;
import com.JMThouseWeb.JMThouse.repository.StarScoreRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	@Autowired
	private ReplyRepository replyRepository;
	
	@Autowired
	private StarScoreRepository starScoreRepository;

	@Transactional
	public void postReview(Review review, User user) {
		review.setGuestId(user);
		reviewRepository.save(review);
	}

	@Transactional
	public Review getReviewDetail(int reviewId) {
		return reviewRepository.findById(reviewId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 리뷰는 존재하지 않습니다.");
		});
	}

	/*
	@Transactional(readOnly = true)
	public List<Review> getReviewList(int houseId) {
		List<Review> reviews = reviewRepository.findAllByHouseId(houseId);
		return reviews;
	}
	*/

	@Transactional
	public Reply addReply(int reviewId, Reply requestReply, User user) {
		Review reviewEntity = reviewRepository.findById(reviewId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 리뷰는 존재하지 않습니다.");
		});

		requestReply.setReviewId(reviewEntity);

		Reply replyEntity = replyRepository.save(requestReply);
		return replyEntity;
	}

	@Transactional
	public Page<Review> getReviewListByHouseId(int houseId, Pageable pageable) {
		return reviewRepository.findAllByHouseId(houseId, pageable);
	}

	@Transactional
	public HouseScoreDto getAvgStarScore(int houseId) {
		return starScoreRepository.getAvgStarScoreByHouse(houseId);
	}

	@Transactional
	public Reply updateReply(int replyId, Reply reply) {
		Reply replyEntity = replyRepository.findById(replyId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 댓글은 존재하지 않습니다.");
		});
		
		replyEntity.setContent(reply.getContent());
		replyRepository.save(replyEntity);
		return replyEntity;
	}
	
	@Transactional
	public void deleteReply(int replyId) {
		// TODO Auto-generated method stub
		
	}

}
