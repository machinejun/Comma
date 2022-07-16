package com.JMThouseWeb.JMThouse.test;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageDto {
	private int pageIndex = 1; // 현재페이지
	private int pageUnit = 10; // 페이지갯수
	private int pageSize = 10; // 페이지사이즈
	private int firstIndex = 1; // firstIndex
	private int recordCountPerPage = 10; // recordCountPerPage
	private int totCnt = 0; // 총갯수
	private int startDate = 0; // 시작데이터
	private int endDate = 0; // 종료데이터
	private int realEnd = 0; // 페이징 마지막 숫자

	private boolean prev, next; // 이전,다음버튼

}
