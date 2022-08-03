package com.CommaWeb.Comma.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.ResponseDto;
import com.CommaWeb.Comma.model.CustomServiceBoard;
import com.CommaWeb.Comma.service.CSBoardService;

@RestController
@RequestMapping("/user/api")
public class CSBoardApiController {
	@Autowired
	private CSBoardService csBoardService;
	
	@PostMapping("/cs-write")
	public ResponseDto<Integer> writeBoard(@AuthenticationPrincipal PrincipalDetail principal ,@RequestBody CustomServiceBoard serviceBoard){
		System.out.println(serviceBoard);
		System.out.println(principal);
		serviceBoard.setUser(principal.getUser());
		csBoardService.writeBoard(serviceBoard);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}
