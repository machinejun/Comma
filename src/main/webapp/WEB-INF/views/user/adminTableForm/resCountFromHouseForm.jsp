<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<div class="container">
	<h2 id="title"
		style="color: rgb(77, 77, 77, 0.9); font-family: SUIT-Medium;">숙소별
		예약 건수</h2>
	<br />
	<div class="select-area">
		월별 : <select id="month-selecter" class="form-select"
			aria-label="Default select example">
			<%
			LocalDate now = LocalDate.now();
			int month = now.getMonthValue();
			%>
			<%
			for (int i = 1; i < month; i++) {
			%>
			<option value="<%=i%>"><%=i%>월
			</option>
			<%
			}
			%>
			<option selected value="<%=month%>"><%=month%>월
			</option>
			<option value="<%=month + 1%>"><%=month + 1%>월
			</option>
		</select> <br /> <br /> 조회 갯수 : <select id="limit-selector"
			class="form-select" aria-label="Default select example">
			<option selected value="5">5개</option>
			<option value="10">10개</option>
		</select>
		<button class="custom-sm-btn" onclick="loadIndexDate()">검색</button>
	</div>
	<canvas id="myChart_best"></canvas>
</div>