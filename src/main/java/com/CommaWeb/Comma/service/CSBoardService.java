package com.CommaWeb.Comma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.model.CustomServiceBoard;
import com.CommaWeb.Comma.model.CustomServiceReply;
import com.CommaWeb.Comma.repository.CSBoardRepository;
import com.CommaWeb.Comma.repository.CSReplyRepository;

@Service
public class CSBoardService {
	@Autowired
	private CSBoardRepository csBoardRepository;
	@Autowired
	private CSReplyRepository csReplyRepository;
 	
	public boolean writeBoard(CustomServiceBoard customServiceBoard) {
		csBoardRepository.save(customServiceBoard);
		return true;
	}
	
	@Transactional(readOnly = true)
	public Page<CustomServiceBoard> findByTitle(String title, Pageable pageable){
		Page<CustomServiceBoard> pages = csBoardRepository.findByTitleContaining(title, pageable);
		return pages;
	}
	
	@Transactional(readOnly = true)
	public List<CustomServiceBoard> loadNoticeBoards(){
		return csBoardRepository.loadNoticeBoard();
	}
	
	@Transactional(readOnly = true)
	public CustomServiceBoard findCSboardByid(int id) {
		CustomServiceBoard board = csBoardRepository.findById(id).orElseThrow(() -> {
			return new RuntimeException("해당 게시글를 찾을 수 없습니다.");
		});
		return board;
	}
	
	@Transactional
	@Modifying
	public Boolean updateCsBoard(CustomServiceBoard board) {
		CustomServiceBoard oldBoard = csBoardRepository.findById(board.getId()).orElseThrow(() -> {
			return new RuntimeException("해당 게시글를 찾을 수 없습니다.");
		});
		oldBoard.setTitle(board.getTitle());
		oldBoard.setContent(board.getContent());
		oldBoard.setSecret(board.getSecret());
		return true;
	}
	
	@Transactional 
	public boolean removeBoard(int id) {
		csBoardRepository.deleteById(id);
		return true;
	}
	
	@Transactional 
	public CustomServiceReply saveReply(CustomServiceReply customServiceReply, int boardId) {
		CustomServiceBoard targetBoard = csBoardRepository.findById(boardId).orElseThrow(() -> {
			return new RuntimeException("해당 게시글를 찾을 수 없습니다.");
		});
		customServiceReply.setCustomServiceBoard(targetBoard);
		csReplyRepository.save(customServiceReply);
		return customServiceReply;
	}
	
	@Transactional
	public void deleteReply(int replyid) {
		csReplyRepository.deleteById(replyid);
	}
}
