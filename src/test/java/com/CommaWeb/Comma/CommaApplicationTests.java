package com.CommaWeb.Comma;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.model.House;
import com.CommaWeb.Comma.service.HouseService;

@SpringBootTest
class CommaApplicationTests {
	
	@Autowired
	HouseService houseService;
	
	@Transactional
	@Test
	void contextLoads() {
		List<House> h = houseService.findAllByHostId(2);
	}
	
	

}
