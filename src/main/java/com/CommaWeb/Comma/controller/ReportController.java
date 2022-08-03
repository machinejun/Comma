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

	@GetMapping("/report-history")
	public String getMyReportHistory(Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {
		List<Report> reports = reportService.getReportList(principalDetail.getUser().getId());
		model.addAttribute("reports", reports);
		return "user/report_history_form";
	}
}
