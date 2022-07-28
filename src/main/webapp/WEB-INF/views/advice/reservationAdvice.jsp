<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="../layout/header.jsp" %>
<style>
h2{	
	margin-top: 5%;
	margin-bottom: 2%;
	margin-left: 40%;
	color: rgba(255, 149, 149, 0.7);
	font-family: 'SUIT-Medium';
}
h2::after{
	content: "";
}
span{
	font-size: 20px;
	text-decoration: underline;
	
}
p {
	color: rgba(255, 149, 149, 0.9);
	font-size: 25px;
	font-weight: bold;
}
.container{
	position: relative;
	padding: 20px;
	background-color: rgba(255, 149, 149, 0.05);
}
.custom-sm-btn{
	position: absolute;
	right: 3%;
	bottom: 5%;
	
}
.advice{
	width: 800px;
}
</style>

<h2>예약 서비스 이용안내</h2>
<div class="container">
	<p>예약서비스는 아래와 같이 할 수 있어요</p>
	<br/>
	<ol>
		<li><span>사용자 메뉴에서 예약 내역 클릭해 주세요</span><br/> <img src="/assets/advice.jpg"></li>
		<br/>
		<li><span>호스트의 승인을 기다려주세요</span>  <br/> <img class="advice" src="/assets/waiting.jpg"></li>
		<br/>
		<li><span>호스트의 승인이 완료되면 approved 상태가 됩니다. 이제 결제를 진행 주세요</span>  <br/> <img class="advice" src="/assets/approved.jpg"></li>
		<br/>
		<li><span>결제가 완료되면 Paid 상태가 됩니다.</span><br/><img  class="advice" src="/assets/paid.jpg"></li>
	</ol>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>

	<button onclick="location.href='/'" class="custom-sm-btn">확인</button>
</div>

<script type="text/javascript" src="/js/main.0cf8b554.js"></script></body>
<script type="text/javascript" src="/js/home.js"></script></body>
</body>
</html>