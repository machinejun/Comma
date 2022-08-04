package com.CommaWeb.Comma.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.csBoardDto.CSboardRequestDto;
import com.CommaWeb.Comma.model.CustomServiceBoard;
import com.CommaWeb.Comma.model.RoleType;
import com.CommaWeb.Comma.service.CSBoardService;

@Controller
public class CSBoardController {
	@Autowired
	private CSBoardService csBoardService;
	
	@GetMapping("/user/cs")
	public String intoCustomerService(@PageableDefault(size = 10, direction = Direction.DESC , page = 0, sort = "id") Pageable pageable,
			String q, Model model) {
		String st = (q == null) ? "" : q;
		Page<CustomServiceBoard> boards = csBoardService.findByTitle(st, pageable);
		List<CustomServiceBoard> noticeBoards = csBoardService.loadNoticeBoards(); 
		model.addAttribute("notices", noticeBoards);
		model.addAttribute("boards", boards);
		model.addAttribute("pageNums", makePageNumbers(boards));
		return "/customerService/customerService";
	}
	
	@GetMapping("/user/cs/writeform")
	public String writeCustomerBoard() {
		return "/customerService/customerBoardwrite";
	}
	
	private ArrayList<Integer> makePageNumbers(Page<CustomServiceBoard> pages) {
		int nowPage = pages.getPageable().getPageNumber();
		int startPage = Math.max(nowPage - 2, 0); //두 인트값 중에 큰 값을 반환 한다.
		int endPage = Math.min(nowPage + 2, pages.getTotalPages()-1);
		ArrayList<Integer> list = new ArrayList<Integer>();
		for(int i = startPage; i <= endPage; i++) {
			list.add(i);
		}
		System.out.println(list);
		return list;
	}
	
	@GetMapping("/user/cs/detail/{id}")
	public String showDetail(@PathVariable int id,@AuthenticationPrincipal PrincipalDetail principalDetail, Model model) {
		CustomServiceBoard csboard = csBoardService.findCSboardByid(id);
		if(principalDetail.getUser().getRole() == RoleType.ADMIN || csboard.getUser().getId() == principalDetail.getUser().getId()) {
			model.addAttribute("board", csboard);
			return "/customerService/customerBoardDetail";
		}else {
			return "/advice/errorPage";
		}
		
		
	}
	
}
