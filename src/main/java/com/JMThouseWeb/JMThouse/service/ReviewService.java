package com.JMThouseWeb.JMThouse.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.dto.HouseScoreDto;
import com.JMThouseWeb.JMThouse.model.Guest;
import com.JMThouseWeb.JMThouse.model.Reply;
import com.JMThouseWeb.JMThouse.model.Review;
import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.repository.HouseRepository;
import com.JMThouseWeb.JMThouse.repository.ReplyRepository;
import com.JMThouseWeb.JMThouse.repository.ReviewRepository;
import com.JMThouseWeb.JMThouse.repository.StarScoreRepository;
import com.JMThouseWeb.JMThouse.repository.UserRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	@Autowired
	private ReplyRepository replyRepository;

	@Autowired
	private StarScoreRepository starScoreRepository;

	@Autowired
	private HouseRepository houseRepository;

	@Autowired
	private UserRepository userRepository;

	@Transactional
	public Review postReview(Review review, User user) {

		// 리뷰 작성할때마다 별점 저장해서 평균 내기
		// test
		houseRepository.findById(1).get().setStarScore(starScoreRepository.getAvgStarScoreByHouse(1).getScore());
		review.setGuestId(user);
		Review reviewEntity = reviewRepository.save(review);
		return reviewEntity;
	}

	@Transactional
	public Review getReviewDetail(int reviewId) {
		return reviewRepository.findById(reviewId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 리뷰는 존재하지 않습니다.");
		});
	}

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
	public Page<Review> getReviewPageByHouseId(int houseId, Pageable pageable) {
		return reviewRepository.findAllByHouseId(houseId, pageable);
	}

	@Transactional
	public HouseScoreDto getAvgStarScore(int houseId) {
		return starScoreRepository.getAvgStarScoreByHouse(houseId);
	}

	@Transactional
	public Reply updateReply(int replyId, Reply reply) {
		Reply replyEntity = replyRepository.findById(replyId).orElseThrow(() -> {
			return new IllegalArgumentException("삭제된 댓글입니다.");
		});

		replyEntity.setContent(reply.getContent());
		replyRepository.save(replyEntity);
		return replyEntity;
	}

	@Transactional
	public void deleteReply(int replyId) {
		replyRepository.deleteById(replyId);
	}

	@Transactional
	public void deleteReview(int reviewId) {
		reviewRepository.deleteById(reviewId);
	}

	@Transactional
	public Review updateReview(int reviewId, Review review) {
		Review reviewEntity = reviewRepository.findById(reviewId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 리뷰는 존재하지 않습니다.");
		});

		reviewEntity.setContent(review.getContent());

		return reviewEntity;
	}

	@Transactional(readOnly = true)
	public List<Review> getReviewListByHouseId(int houseId) {
		return reviewRepository.findAllByHouseId(houseId);
	}

	@Transactional
	public List<Review> getReviewList(int guestId) {
		return reviewRepository.findAllByGuestId(guestId).orElseGet(() -> {
			return new ArrayList<>();
		});
	}

}
