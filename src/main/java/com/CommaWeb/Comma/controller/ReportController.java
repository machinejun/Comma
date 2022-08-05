package com.CommaWeb.Comma.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.model.Report;
import com.CommaWeb.Comma.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;

	// 나의 신고 내역 페이지
	@GetMapping("/report-history")
	public String getMyReportHistoryForm(Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		List<Report> reports = reportService.getReportList(principalDetail.getUser().getId());
		model.addAttribute("reports", reports);
		return "user/report_history_form";
	}

	// 관리자 신고 내역 관리 페이지
	@GetMapping("/admin/report-management")
	public String getReportManagementForm(Model model) {
		model.addAttribute("reports", reportService.getAllReport());
		return "admin/report_management_form";
	}
}
