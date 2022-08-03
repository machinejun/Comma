<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ page import = "java.time.LocalDate" %>
<%@ include file="../layout/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
.container{
	width: 1000px;
	height: 700px;
}
.container > h2::after {
	content: "";
}
.custom-sm-btn {
	position: absolute;
	right: 20px;
	bottom: 20px;
}
.select-area{
	padding: 20px;
	border-radius: 10px;
	border: 2px solid rgba(255,149,149,0.9);
	position: relative;
	margin-bottom: 30px;
}
</style>
<meta name="tableData" content="">

<div class="container" >
	<h2 id="title" style="color: rgba(255,149,149,0.9); font-family: SUIT-Medium;">숙소별 예약 건수</h2>
	<br/>
	<div class="select-area">
		월별 : <select id="month-selecter" class="form-select" aria-label="Default select example">
				  <% LocalDate now = LocalDate.now();
					int month = now.getMonthValue();%> 	
				  <% for( int i = 1; i < month; i++){ %>
					<option value="<%= i %>"><%= i %>월</option>
				  <% } %>
					<option selected value="<%=month%>"><%=month%>월</option>	
					<option value="<%=month +1%>"><%=month+1%>월</option>
			</select>
		<br/>
		<br/>
		조회 갯수 : <select id="limit-selector" class="form-select" aria-label="Default select example">
						<option selected value="5">5개</option>
						<option value="10">10개</option>	
					</select>
		<button class="custom-sm-btn" onclick="loadDate()">검색</button>
	</div>
	<canvas id="myChart" height="60" width="100"></canvas>
</div>




<script type="text/javascript" src="/js/main.0cf8b554.js"></script></body>
<script type="text/javascript" src="/js/home.js"></script></body>
<script type="text/javascript" src="/js/user/adminTable.js"></script></body>
</body>
</html>