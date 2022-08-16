package com.CommaWeb.Comma.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.CommaWeb.Comma.repository.QlrmRepository;

@RestController
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	QlrmRepository qlrmRepository;
	
	
	
	
		

}
