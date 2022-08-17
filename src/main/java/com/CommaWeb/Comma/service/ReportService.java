package com.CommaWeb.Comma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.dto.ApproveDto;
import com.CommaWeb.Comma.model.Reply;
import com.CommaWeb.Comma.model.Report;
import com.CommaWeb.Comma.model.ReportType;
import com.CommaWeb.Comma.model.Review;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.repository.ReplyRepository;
import com.CommaWeb.Comma.repository.ReportRepository;
import com.CommaWeb.Comma.repository.ReviewRepository;
import com.CommaWeb.Comma.repository.UserRepository;

@Service
public class ReportService {

	@Autowired
	private ReportRepository reportRepository;

	@Autowired
	private ReplyRepository replyRepository;

	@Autowired
	private ReviewRepository reviewRepository;

	@Autowired
	private UserRepository userRepository;

	@Transactional
	public void reportReply(User user, int replyId, Report report) {
		Reply replyEntity = replyRepository.findById(replyId).get();

		report.setReporter(user);
		report.setReportStatus(ReportType.RECEIVED);
		report.setReplyId(replyEntity);
		report.setRespondent(replyEntity.getReviewId().getHouseId().getHostId());

		reportRepository.save(report);
	}

	@Transactional
	public void reportReview(User user, int reviewId, Report report) {
		Review reviewEntity = reviewRepository.findById(reviewId).get();

		report.setReporter(user);
		report.setReportStatus(ReportType.RECEIVED);
		report.setReviewId(reviewEntity);
		report.setRespondent(reviewEntity.getGuestId());

		reportRepository.save(report);
	}

	@Transactional(readOnly = true)
	public List<Report> getReportList(int reporterId) {
		return reportRepository.findAllByReporter(reporterId);
	}

	@Transactional(readOnly = true)
	public List<Report> getAllReport() {
		return reportRepository.findAllOrderByIdDesc();

	}

	@Transactional
	public Report setReportStatus(ApproveDto approveDto) {
		System.out.println("service 확인 : " + approveDto.getApprove());
		Report reportEntity = reportRepository.findById(approveDto.getResId()).get();

		ReportType reportType = reportEntity.getReportStatus();

		switch (approveDto.getApprove()) {
		case "APPROVED":
			// 승인시 해당 회원의 신고횟수가 1 증가한다.
			reportType = ReportType.APPROVED;

			User userEntity = userRepository.findById(reportEntity.getRespondent().getId()).get();
			int reportCount = userEntity.getReportCount() + 1;
			userEntity.setReportCount(reportCount);

			break;
		case "CANCELED":
			reportType = ReportType.CANCELED;
			break;
		}

		reportEntity.setReportStatus(reportType);
		System.out.println("service 확인 : " + reportEntity);
		return reportEntity;
	}

}
