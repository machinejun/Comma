package com.CommaWeb.Comma;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.CommaWeb.Comma.dto.adminDto.AdmintableDto;
import com.CommaWeb.Comma.repository.QlrmRepository;
import com.CommaWeb.Comma.repository.queryStorage.AdminTableQueryStorage;

@SpringBootTest
public class testQlrmRepostiorty {

	@Autowired
	QlrmRepository testRepository;

	@Autowired
	AdminTableQueryStorage targetRepository;

	String queryText = "select address, count(address) as count\r\n" + "from house\r\n"
			+ "group by address order by count desc";

	@Test
	public void test1() throws Exception {
		System.out.println("테스트 시작");
		// given
		List<AdmintableDto> oldAdto = targetRepository.loadAddressHouseCount();

		// when
		List<AdmintableDto> testAdto = testRepository.returnDataList(queryText, AdmintableDto.class);

		// then
		assertThat(testAdto).isEqualTo(oldAdto);
	}

}
