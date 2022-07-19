<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="../layout/header.jsp" %>
<div class="section-container contact-container" >
	<div id="inputPage" class="container" style="background-color: rgba( 0, 0, 0, 0.05);">
		<div class="row" >
			<div class="col-xs-12 col-md-12" >
				<div id="page-container">
						<h4 id="guestName">게스트 이름</h4>
						<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">예약 id</th>
							      <th scope="col">숙소명</th>
							      <th scope="col">예약 일</th>										
							      <th scope="col">상태</th>
							      <th scope="col" style="text-align: center;">결제</th>
							      <th scope="col" style="text-align: center;">상세보기</th>
							    </tr>
							  </thead>
							  <tbody id="table-body">
								  <c:forEach var="reservation" items="${reservations}">
								  	<tr>
								      <td scope="row">${reservation.id}</td>
								      <td>${reservation.houseId.name}</td>
								      <td>${reservation.checkInDate} ~ ${reservation.checkOutDate}</td>
								      <td style="font-weight: bold;">${reservation.approvalStatus}</td>
								      <c:choose>
								      	<c:when test="${reservation.approvalStatus eq 'WAITING'}">
								      		<td style="text-align: center;"><button class="btn btn-secondary"  onclick="payForKakao(${reservation.id})" style="padding: 5px; font-size: 13px; background-color: green;">결 제</button></td>
								      	</c:when>
								      	<c:otherwise>
								      		<td style="text-align: center;"><button class="btn btn-secondary disabled" style="padding: 5px; font-size: 13px; background-color: green;">결 제</button></td>
								      	</c:otherwise>
								      </c:choose>
								      <td style="text-align: center;"><button onclick="showResDetail(${reservation.id})" class="btn btn-secondary" style="padding: 5px; font-size: 13px; background-color: blue">상세보기</button></td>
								    </tr>
								  </c:forEach>
							  </tbody>
						</table>		
				</div>
				<hr/>
				
			</div>	
    	</div>
  	</div>
</div>

<div id="userTableDetail" class="detail">

</div>


<script type="text/javascript" src="/js/main.0cf8b554.js"></script>
<script type="text/javascript" src="/js/home.js"></script></body>
<script type="text/javascript" src="/js/reservation/userReserveTable.js"></script>
</body>
</html>
