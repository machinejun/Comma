<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ page import = "java.time.LocalDate" %>
<%@ include file="../layout/header.jsp" %>
<div class="section-container contact-container" >
	<div id="inputPage" class="container" style="background-color: rgba( 0, 0, 0, 0.05);">
		<div class="row" >
			<div class="col-xs-12 col-md-12" >
				<div id="page-container">
					<div class="jumbotron jumbotron-fluid" onchange="checkReservation(${houses[0].hostId.id})" style="margin: 10px">
					  <div class="container">
					    <h1 class="display-4">(HostName)님 안녕하세요!!!</h1>
					    <p class="lead">저희 사이트를 이용해주셔서 감사합니다. <br/>
					    저희 사이트의 이용료는 30만원입니다.
					    </p>
					    <select id="month" class="form-select" aria-label="Default select example">
					     <% LocalDate now = LocalDate.now();
					     	int month = now.getMonthValue();%>
					     	<option value="<%=month +1%>"><%=month+1%>월</option>
					     	<option value="<%=month%>"><%=month%>월</option>
					     <% for( int i = 1; i < month; i++){ %>
					     		<option value="<%= i %>"><%= i %>월</option>
					     <% } %>	
						</select>

					    <c:forEach var="house" items="${houses}">
					    	<button type="button" class="btn btn-info" id="${house.name}" onclick="checkHouseReservation(${house.hostId.id},${house.id})" style="width: 120px; height: 40px; font-size: 20px; padding: 5px">${house.name}
					    		<c:forEach var="houseCount" items="${count}">
					    			<c:if test="${houseCount.houseId eq house.id }">
					    				<span style="color: red; font-size: 15px; padding: 0">(${houseCount.wait})</span>
					    			</c:if> 
					    		</c:forEach> 
					    	</button>
					    </c:forEach> 
					  </div>
					</div>	
						<h4 id="houseName">숙소명</h4>
						<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">예약자</th>
							      <th scope="col">인원 수</th>
							      <th scope="col">예약 일</th>
							      <th scope="col">가격</th>
							      <th scope="col">휴대폰 번호</th>
							      <th scope="col">요청 사항</th>
							      <th scope="col">상태</th>
							      <th scope="col">취소</th>
							    </tr>
							  </thead>
							  <tbody id="table-body">
								
							  </tbody>
						</table>		
				</div>
			</div>	
    	</div>
  	</div>
</div>
<script type="text/javascript" src="/js/main.0cf8b554.js"></script></body>
<script type="text/javascript" src="/js/home.js"></script></body>
<script type="text/javascript" src="/js/reservation/hostReserveTable.js"></script></body>
</body>
</html>
