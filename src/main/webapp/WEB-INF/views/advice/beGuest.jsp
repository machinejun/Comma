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

<h2>게스트 모드 이용안내</h2>
<div class="container">
	<p>게스트 모드 기능</p>
	<br/>
	<ul>
		<li><span>숙소를 찾아보세요 !!!</span> <br/> 호스트들이 공유한 숙소에 대한 정보를 조회할 수 있습니다.</li>
		<br/>
		<li><span>예약을 해보세요 !!!</span>  <br/> 마음에 드는 숙소를 예약하여 편안한 휴식을 즐길 수 있습니다.</li>
		<br/>
		<li><span>위시리스트를 만들어보세요 !!!</span>  <br/> 마음에 드는 숙소를 위시리스트에 담아서 빠르게 숙소를 조회/예약 할 수 있습니다.</li>
		<br/>
		<li><span>좋은 리뷰로 사용자님의 마음을 표시해보세요 !!!</span><br/>좋은 리뷰는 호스트에게 힘이됩니다. 숙소에 대한 리뷰를 작성할 수 있습니다.</li>
	</ul>
	<br/>
	<br/>

	<button onclick="location.href='/'" class="custom-sm-btn">확인</button>
</div>

<script type="text/javascript" src="/js/main.0cf8b554.js"></script></body>
<script type="text/javascript" src="/js/home.js"></script></body>
</body>
</html>