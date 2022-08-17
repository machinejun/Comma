package com.CommaWeb.Comma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.dto.HouseScoreDto;
import com.CommaWeb.Comma.model.House;
import com.CommaWeb.Comma.model.Reply;
import com.CommaWeb.Comma.model.Review;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.repository.HouseRepository;
import com.CommaWeb.Comma.repository.QlrmRepository;
import com.CommaWeb.Comma.repository.ReplyRepository;
import com.CommaWeb.Comma.repository.ReviewRepository;
import com.CommaWeb.Comma.repository.queryStorage.StarScoreQueryStorage;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	@Autowired
	private ReplyRepository replyRepository;
	
	@Autowired
	private QlrmRepository<HouseScoreDto> qlrmRepository;

	@Autowired
	private StarScoreQueryStorage queryStorage;

	@Autowired
	private HouseRepository houseRepository;

	@Transactional
	public Review postReview(Review review, User user) {

		// 저장된 별점 데이터 꺼내서 평점 계산
		Review reviewEntity = reviewRepository.save(review);

		House houseEntity = houseRepository.findById(review.getHouseId().getId()).get();
		double avgStarScore = qlrmRepository
				.returnDataList(queryStorage.getAvgStarScoreByHouse(houseEntity.getId()), HouseScoreDto.class)
				.get(0).getScore();

		houseEntity.setStarScore(avgStarScore);
		review.setGuestId(user);

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
		reviewEntity.getReplies().add(requestReply);

		Reply replyEntity = replyRepository.save(requestReply);
		return replyEntity;
	}

	@Transactional
	public Page<Review> getReviewPageByHouseId(int houseId, Pageable pageable) {
		return reviewRepository.findAllByHouseId(houseId, pageable);
	}

	@Transactional
	public HouseScoreDto getAvgStarScore(int houseId) {
		try {
			return qlrmRepository.returnDataList(queryStorage.getAvgStarScoreByHouse(houseId), HouseScoreDto.class).get(0);
		} catch (IndexOutOfBoundsException e) {
			return null;
		}

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
		replyRepository.deleteByReplyId(replyId);
	}

	@Transactional
	public void deleteReview(int reviewId) {
		reviewRepository.deleteReview(reviewId);
	}

	@Transactional
	public Review updateReview(int reviewId, Review review) {
		Review reviewEntity = reviewRepository.findById(reviewId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 리뷰는 존재하지 않습니다.");
		});

		reviewEntity.setContent(review.getContent());
		reviewEntity.setStarScore(review.getStarScore());

		return reviewEntity;
	}

	@Transactional(readOnly = true)
	public List<Review> getReviewListByHouseId(int houseId) {
		return reviewRepository.findAllByHouseId(houseId);
	}

	@Transactional(readOnly = true)
	public Page<Review> getReviewListByGuestId(int guestId, Pageable pageable) {
		return reviewRepository.findAllByGuestId(guestId, pageable);
	}

}
