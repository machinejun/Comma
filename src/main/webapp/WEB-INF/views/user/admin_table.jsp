<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">

<%@ include file="../layout/header.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
.container {
	width: 1000px;
	height: 700px;
}

.container>h2::after {
	content: "";
}

.custom-sm-btn {
	position: absolute;
	right: 20px;
	bottom: 20px;
}

.select-area {
	padding: 20px;
	border-radius: 10px;
	border: 2px solid rgba(255, 149, 149, 0.9);
	position: relative;
	margin-bottom: 30px;
}
.navi-btn{
	color: rgba(255, 149, 149, 0.7);
}
.navi-btn:hover{
	color: rgba(255, 149, 149, 0.9);
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
    color: red;
    background-color: #fff;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
    cursor: default;
}
</style>
<meta name="tableData" content="">
<div class="container">
	<div style="margin: 10px;">
		<ul class="nav nav-tabs">
			<li><a class="navi-btn" href="#monthUser" data-toggle="tab">월별 유저 가입 수</a></li>
			<li><a class="navi-btn" href="#messages" data-toggle="tab">숙소 등록 증가율</a></li>
			<li><a class="navi-btn" href="#houseCount" data-toggle="tab">숙소별 예약 수</a></li>
			<li><a class="navi-btn" href="#settings" data-toggle="tab">지역별 숙소 현황</a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane fade in active" id="houseCount">
				<%@ include file="adminTableForm/resCountFromHouseForm.jsp"%>
			</div>
			<div class="tab-pane fade" id="monthUser">
				<%@ include file="adminTableForm/MonthUserCountForm.jsp"%>
			</div>
			<div class="tab-pane fade" id="messages">Messages 메뉴</div>
			<div class="tab-pane fade" id="settings">Settings 메뉴</div>
		</div>
	</div>

</div>







<script type="text/javascript" src="/js/main.0cf8b554.js"></script>
</body>
<script type="text/javascript" src="/js/home.js"></script>
</body>
<script type="text/javascript" src="/js/user/adminTable.js"></script>
</body>
</body>
</html>