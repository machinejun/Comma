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
</style>

<h2>호스트 모드 이용안내</h2>
<div class="container">
	<p>호스트 모드 기능</p>
	<br/>
	<ul>
		<li><span>숙소를 등록해보세요 !!!</span> <br/> 숙소 관리에서 사용자님의 숙소를 등록하여 게스트에게 공유할 수 있습니다.</li>
		<br/>
		<li><span>예약을 관리해보세요 !!!</span>  <br/> 예약 관리 모드에서는 사용자님과 게스트와의 예약을 관리할 수 있습니다.</li>
		<br/>
		<li><span>좋은 리뷰에 사용자님의 마음을 표시해보세요 !!!</span><br/> 리뷰 관리 모드에서는 게스트의 리뷰에 댓글을 달수 있습니다.</li>
	</ul>
	<br/>
	<br/>

	<button onclick="location.href='/'" class="custom-sm-btn">확인</button>
</div>

<script type="text/javascript" src="/js/main.0cf8b554.js"></script></body>
<script type="text/javascript" src="/js/home.js"></script></body>
</body>
</html>