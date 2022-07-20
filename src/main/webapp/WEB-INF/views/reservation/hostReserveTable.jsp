<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ page import = "java.time.LocalDate" %>
<%@ include file="../layout/header.jsp" %>
<style>
.section-container{
	font-family: 'SUIT-Medium'
}
.btn{
	width: 120px;
	height: 40px;
	color:rgba(23,99,233,0.9) ;
	font-weight: bold;
	font-size: 20px; 
	padding: 5px;
	background-color: white;
	border-left: 1.5px solid rgba(23,99,233,0.55); 
	border-top: 1.5px solid rgba(23,99,233,0.55); 
	margin-right: 10px;
	margin-top: 10px;
	margin-bottom: 0;
	
}
.btn:hover {
	color: rgba(23,99,233,0.4);
}
.btn-box{
	padding-left: 60px;
	padding-bottom: 10px;
}
#month{
	font-size: 15px;
	margin-bottom: 10px; 
	height: 30px; 
	border: 0px; 
	background-color: transparent;
	color: rgba(23,99,233,0.65); 
	position: absolute; 
	left: 15px; 
	border-bottom: 1.5px solid rgba(23,99,233,0.55); 
	top: 45px;
}
.table-in-btn{
	font-weight: lighter;
}
.table-in-btn:hover{
	font-weight: bold;
	
}

</style>
<div class="section-container contact-container" style="width: 800px; position: absolute; top: 10%; left: 20%">
	<div id="inputPage" class="container" style="background-color: rgba( 0, 0, 0, 0.05);">
		<div class="row" >
			<div class="col-xs-12 col-md-12" style="background-color: white" >
				<div id="page-container">
					
					<br/>
						<select id="month" class="form-select" aria-label="Default select example" style="">
							     <% LocalDate now = LocalDate.now();
							     	int month = now.getMonthValue();%>
							     	<option value="<%=month +1%>"><%=month+1%>월</option>
							     	<option value="<%=month%>"><%=month%>월</option>
							     <% for( int i = 1; i < month; i++){ %>
							     		<option value="<%= i %>"><%= i %>월</option>
							     <% } %>	
						</select>
							
						<div class="btn-box">
							<c:if test="${empty houses}"><br/><br/></c:if>
							<c:forEach var="house" items="${houses}">				
						    	<a type="button" class="btn" id="${house.name}" onclick="checkHouseReservation(${house.hostId.id},${house.id})" style="">${house.name}
						    		<c:forEach var="houseCount" items="${count}">
						    			<c:if test="${houseCount.houseId eq house.id }">
						    			<span style="color: red; font-size: 15px; padding: 0">(${houseCount.wait})</span>
						    				
						    			</c:if> 
						    		</c:forEach> 
						    	</a>	
					    	</c:forEach> 
						</div>
						
						<h4 id="houseName" style="font-weight: bold; color: black; display: none">숙소명</h4>
						<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">예약자</th>
							      <th scope="col">인원 수</th>
							      <th scope="col">예약 일</th>							  
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
