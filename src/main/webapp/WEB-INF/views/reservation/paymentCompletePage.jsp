<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="../layout/header.jsp" %>
<style>
.container{
	font-family: 'SUIT-Medium'
}
.table > tr > th {
	padding-left: 10px;
}
h2 {
	color: rgba(255,149,149,0.7);
	font-family: 'SUIT-Medium'; 
}
h2::after {
	color: rgba(255,149,149,0.7);
	font-family: 'SUIT-Medium'; 
}
.container {
	position: relative;
}
.custom-sm-btn {
	position: absolute;
	right: 5%;
}
</style>
<br/>
<br/>
<div class="container">
	<div class="horizon-bar"></div>
	<div>
		<div class="title"><h2>결제가 정상적으로 완료되었습니다</h2></div>
		<div class="body-container">
		<br/>
			<table class="table">
			  <tbody>
			    <tr>
			      <th scope="row">주문번호</th>
			      <td>${kakao.aid }</td>

			    </tr>
			    <tr>
			      <th scope="row">숙소 정보</th>
			    	<td>
			    		<ul style="list-style: none; padding-top: 8px; padding-bottom: 8px; padding-left: 0px; margin-bottom: 0px;">
			    			<li>숙 소    명: ${kakao.item_name }</li>
			    			<li>숙소   주소: ${reservation.houseId.detailAddress}</li>
			    			<li>호스트 번호: ${reservation.hostId.phoneNumber}</li>
			    		</ul>
					</td>
			    </tr>
			    <tr>
			      <th scope="row">결제 정보</th>
			      <td colspan="2">
			      	  <ul style="list-style: none; padding-top: 8px; padding-bottom: 8px; padding-left: 0px; margin-bottom: 0px;">
			    			<li>예 약 자 : ${kakao.partner_order_id}</li>
			    			<li>결제 타입: ${kakao.payment_method_type}</li>
			    			<li>결제 금액: ${kakao.amount.total} 원</li>
			    			<li>승인 시간: ${kakao.approved_at }</li>
			    	  </ul>
			      </td>
			    </tr>
			  </tbody>
			</table>
		</div>
	</div>
	<button onclick="location.href='/'" class="custom-sm-btn">확인</button>
</div>


<script type="text/javascript" src="/js/main.0cf8b554.js"></script>
<script type="text/javascript" src="/js/home.js"></script></body>

</body>
</html>
