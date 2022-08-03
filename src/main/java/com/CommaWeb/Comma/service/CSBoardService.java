package com.CommaWeb.Comma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.model.CustomServiceBoard;
import com.CommaWeb.Comma.repository.CSBoardRepository;

@Service
public class CSBoardService {
	@Autowired
	private CSBoardRepository csBoardRepository;
	
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
}
