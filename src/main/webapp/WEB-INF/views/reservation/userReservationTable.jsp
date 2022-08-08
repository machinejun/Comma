<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="../layout/header.jsp"%>
<style>
.section-container {
	font-family: 'SUIT-Medium'
}

.col-xs-12 {
	background-color: white;
}

h2 {
	color: rgba(255, 149, 149, 0.7);
}

h2::after {
	color: rgba(255, 149, 149, 0.7);
}

.btn {
	padding: 5px;
	font-size: 13px;
	color: rgba(255, 149, 149, 0.9);
	border-left: 2px solid white;
	border-bottom: 2px solid rgba(255, 149, 149, 0.4);
	border-right: 2px solid rgba(255, 149, 149, 0.4);
	background-color: white;
}

.btn:hover {
	color: white;
	background-color: rgba(255, 149, 149, 0.5);
	border: 2px solid rgba(255, 149, 149, 0.4);
}

img {
	width: 80px;
}

#cancel-btn {
	border-bottom: 2px solid rgba(255, 149, 149, 0.4);
	border-right: 2px solid rgba(255, 149, 149, 0.4);
	background-color: white;
	color: rgba(254, 32, 32, 0.7);
}

#cancel-btn:hover {
	border: 2px solid rgba(254, 32, 32, 0.5);
	background-color: rgba(254, 32, 32, 0.3);
	color: white;
}

.detail-show-btn {
	font-weight: bold;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.detail-show-btn:hover {
	color: rgba(255, 149, 149, 0.7);
	text-decoration: underline;
}
</style>
<script type="text/javascript" src="/js/reservation/userReserveTable.js"></script>
<div class="section-container contact-container">
	<div id="inputPage" class="container" style="background-color: rgba(0, 0, 0, 0.05);">
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<div id="page-container">
					<h2 style="font-family: SUIT-Medium;">${principal.user.username}님안녕하세요</h2>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">예약 id</th>
								<th scope="col" style="width: 350px">숙소명</th>
								<th scope="col" style="width: 300px">예약일</th>
								<th scope="col">상태</th>
								<th scope="col" style="text-align: center;">결제</th>
								<th scope="col" style="text-align: center;">리뷰쓰기</th>
							</tr>
						</thead>
						<tbody id="table-body">
							<c:forEach var="reservation" items="${reservations}">

								<tr>
									<td scope="row">${reservation.id}</td>
									<td class="detail-show-btn"><a onclick="showResDetail(${reservation.id})">${reservation.houseId.name}</a></td>
									<td>${reservation.checkInDate}~${reservation.checkOutDate}</td>
									<td>${reservation.approvalStatus}</td>
									<c:choose>
										<c:when test="${reservation.approvalStatus eq 'APPROVED'}">
											<td style="text-align: center;"><a type="button" style="border-color: white;" onclick="payForKakao(${reservation.id})"><img src="/assets/payment_small.png"></img></a></td>
										</c:when>
										<c:when test="${reservation.approvalStatus eq 'WAITING'}">
											<td style="text-align: center;">승인 대기중</td>
										</c:when>
										<c:otherwise>
											<td style="text-align: center;"></td>
										</c:otherwise>
									</c:choose>
									<td style="text-align: center;"><c:if test="${reservation.approvalStatus eq 'COMPLETED'}">
											<button onclick="location.href='/review/post_form/${reservation.id}'" class="btn" style="">리뷰 쓰러가기</button>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="userTableDetail" class="detail"></div>
</body>
<script type="text/javascript" src="/js/main.0cf8b554.js"></script>
<script type="text/javascript" src="/js/home.js"></script>

</html>
