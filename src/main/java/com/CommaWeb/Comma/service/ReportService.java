package com.CommaWeb.Comma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.model.Report;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.repository.ReplyRepository;
import com.CommaWeb.Comma.repository.ReportRepository;
import com.CommaWeb.Comma.repository.ReviewRepository;

@Service
public class ReportService {
	
	@Autowired
	private ReportRepository reportRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	@Autowired
	private ReviewRepository reviewRepository;

	@Transactional
	public void reportReply(User user, int replyId, Report report) {
		report.setUser(user);
		report.setReplyId(replyRepository.findById(replyId).get());
		reportRepository.save(report);		
	}

	@Transactional
	public void reportReview(User user, int reviewId, Report report) {
		report.setUser(user);
		report.setReviewId(reviewRepository.findById(reviewId).get());
		reportRepository.save(report);
	}

}
