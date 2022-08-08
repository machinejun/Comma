package com.CommaWeb.Comma.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.CommaWeb.Comma.auth.PrincipalDetail;
import com.CommaWeb.Comma.dto.ResponseDto;
import com.CommaWeb.Comma.dto.csBoardDto.CSboardRequestDto;
import com.CommaWeb.Comma.model.CSBoardType;
import com.CommaWeb.Comma.model.CustomServiceBoard;
import com.CommaWeb.Comma.model.CustomServiceReply;
import com.CommaWeb.Comma.model.RoleType;
import com.CommaWeb.Comma.service.CSBoardService;

@RestController
@RequestMapping("/user/api")
public class CSBoardApiController {
	@Autowired
	private CSBoardService csBoardService;
	
	@PostMapping("/cs-write")
	public ResponseDto<Integer> writeBoard(@AuthenticationPrincipal PrincipalDetail principal ,@RequestBody CustomServiceBoard serviceBoard){
		serviceBoard.setUser(principal.getUser());
		if(principal.getUser().getRole() == RoleType.ADMIN) {
			serviceBoard.setBoardType(CSBoardType.NOTICE);
		}else {
			serviceBoard.setBoardType(CSBoardType.NORMAL);
		}
		csBoardService.writeBoard(serviceBoard);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/cs-update")
	public ResponseDto<String> updateBoard(@AuthenticationPrincipal PrincipalDetail principal, @RequestBody CustomServiceBoard board){
		System.out.println(board);
		CustomServiceBoard tempboard = csBoardService.findCSboardByid(board.getId());
		
		if(tempboard.getUser().getId() != principal.getUser().getId()) {
			return new ResponseDto<String>(HttpStatus.FORBIDDEN.value(), "NO");
		}
		
		if(csBoardService.updateCsBoard(board)) {
			return new ResponseDto<String>(HttpStatus.OK.value(), "OK");
		}else{
			return new ResponseDto<String>(HttpStatus.FORBIDDEN.value(), "NO");
		}	
	}
	
	@DeleteMapping("/cs-delete")
	public ResponseDto<String> deleteBaord(@RequestParam(value = "boardId") int id, @AuthenticationPrincipal PrincipalDetail principal ){
		System.out.println("deltet    " + id);
		CustomServiceBoard tempboard = csBoardService.findCSboardByid(id);
		if(tempboard.getUser().getId() != principal.getUser().getId()) {
			return new ResponseDto<String>(HttpStatus.FORBIDDEN.value(), "NO");
		}
		csBoardService.removeBoard(id);
		return new ResponseDto<String>(HttpStatus.OK.value(), "OK");
	}
	
	@PostMapping("/cs-write/reply")
	public ResponseDto<CustomServiceReply> writeReply(@AuthenticationPrincipal PrincipalDetail principal,
			@RequestBody CustomServiceReply customServiceReply,
			@RequestParam(value = "boardId") int id){
		System.out.println(customServiceReply);
		if(principal.getUser().getRole() != RoleType.ADMIN) {
			return new ResponseDto<CustomServiceReply>(HttpStatus.FORBIDDEN.value(), null);
		}
		
		CustomServiceReply csreply = csBoardService.saveReply(customServiceReply, id);
		return new ResponseDto<CustomServiceReply>(HttpStatus.OK.value(), customServiceReply);
	}
	
	@DeleteMapping("/cs-delete/reply")
	public ResponseDto<Integer> deleteReply(@AuthenticationPrincipal PrincipalDetail principal, @RequestParam(value = "replyId") int id){
		if(principal.getUser().getRole() != RoleType.ADMIN) {
			return new ResponseDto<Integer>(HttpStatus.FORBIDDEN.value(), null);
		}
		csBoardService.deleteReply(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), id);
	}
	

}
