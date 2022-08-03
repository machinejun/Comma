package com.CommaWeb.Comma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.model.Reply;
import com.CommaWeb.Comma.model.Report;
import com.CommaWeb.Comma.model.Review;
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
		Reply replyEntity = replyRepository.findById(replyId).get();
		
		report.setReporter(user);
		report.setReplyId(replyEntity);
		report.setRespondent(replyEntity.getReviewId().getHouseId().getHostId());
		
		reportRepository.save(report);		
	}

	@Transactional
	public void reportReview(User user, int reviewId, Report report) {
		Review reviewEntity = reviewRepository.findById(reviewId).get();
		
		report.setReporter(user);
		report.setReviewId(reviewEntity);
		report.setRespondent(reviewEntity.getGuestId());
		
		reportRepository.save(report);
	}

	@Transactional(readOnly = true)
	public List<Report> getReportList(int reporterId) {
		return reportRepository.findAllByReporter(reporterId);
	}

}
