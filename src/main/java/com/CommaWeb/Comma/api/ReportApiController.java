package com.CommaWeb.Comma.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.CommaWeb.Comma.auth.PrincipalDetail;
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
	public ResponseDto<Integer> reportReply(@PathVariable int replyId, @AuthenticationPrincipal PrincipalDetail principalDetail,
			@RequestBody Report report) {
		reportService.reportReply(principalDetail.getUser(), replyId, report);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	/**
	 * 
	 * 호스트가 게스트의 리뷰를 신고한다.
	 */
	@PostMapping("/host/report/{reviewId}")
	public ResponseDto<Integer> reportReview(@PathVariable int reviewId, @AuthenticationPrincipal PrincipalDetail principalDetail,
			@RequestBody Report report) {
		reportService.reportReview(principalDetail.getUser(), reviewId, report);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

}
