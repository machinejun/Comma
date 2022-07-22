package com.CommaWeb.Comma;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.CommaWeb.Comma.repository.HouseRepository;
import com.CommaWeb.Comma.service.HouseService;

@SpringBootTest
public class HostTableTest {
	@Autowired
	private HouseService houseService;
	
	@Autowired
	private HouseRepository houseRepository;
	
	@Test
	public void test() {
		System.out.println("hello");
	}
	

}
