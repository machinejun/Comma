package com.CommaWeb.Comma.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.ApproveDto;
import com.CommaWeb.Comma.dto.ResponseDto;
import com.CommaWeb.Comma.model.Report;
import com.CommaWeb.Comma.service.ReportService;

@RestController
public class ReportApiController {

	@Autowired
	private ReportService reportService;

	/**
	 * 
	 * 게스트가 호스트의 댓글을 신고한다.
	 */
	@PostMapping("/guest/report/{replyId}")
	public ResponseDto<Integer> reportReply(@PathVariable int replyId,
			@AuthenticationPrincipal PrincipalDetail principalDetail, @RequestBody Report report) {
		reportService.reportReply(principalDetail.getUser(), replyId, report);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	/**
	 * 
	 * 호스트가 게스트의 리뷰를 신고한다.
	 */
	@PostMapping("/host/report/{reviewId}")
	public ResponseDto<Integer> reportReview(@PathVariable int reviewId,
			@AuthenticationPrincipal PrincipalDetail principalDetail, @RequestBody Report report) {

		reportService.reportReview(principalDetail.getUser(), reviewId, report);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	/**
	 * 
	 * 관리자가 접수된 신고를 승인
	 */
	@PutMapping("/admin/report-approve/{reportId}")
	public ResponseDto<Report> approveReport(@PathVariable int reportId, @RequestBody ApproveDto approveDto) {
		Report reportEntity = reportService.setReportStatus(approveDto);
		System.out.println("승인 111111" + approveDto.getApprove());
		return new ResponseDto<Report>(HttpStatus.OK.value(), reportEntity);
	}

	/**
	 * 
	 * 관리자가 접수된 신고를 취소
	 */
	@PutMapping("/admin/report-cancel/{reportId}")
	public ResponseDto<Integer> canceleReport(@PathVariable int reportId, @RequestBody ApproveDto approveDto) {
		reportService.setReportStatus(approveDto);
		System.out.println("1111111111111" + approveDto.getApprove());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

}
