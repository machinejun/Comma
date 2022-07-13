package com.JMThouseWeb.JMThouse;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.repository.HouseRepository;
import com.JMThouseWeb.JMThouse.service.HouseService;

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
