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

.navi-btn {
	color: rgba(255, 149, 149, 0.7);
}

.navi-btn:hover {
	color: rgba(255, 149, 149, 0.9);
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
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
		<ul id="li-groub" class="nav nav-tabs">
			<li><a class="navi-btn" href="#monthUser" data-toggle="tab">월
					별 조회</a></li>
			<li><a class="navi-btn" href="#addressHouse" data-toggle="tab">지역별
					숙소 현황</a></li>
			<li><a class="navi-btn" href="#houseCount" data-toggle="tab">최고의
					숙소/호스트</a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane fade in active" id="monthUser">
				<%@ include file="adminTableForm/MonthUserCountForm.jsp"%>
			</div>
			<div class="tab-pane fade" id="addressHouse">
				<%@ include file="adminTableForm/HouseCountFromAddressForm.jsp"%>
			</div>
			<div class="tab-pane fade" id="houseCount">
				<%@ include file="adminTableForm/resCountFromHouseForm.jsp"%>
			</div>
		</div>
	</div>

</div>







<script type="text/javascript" src="/js/main.0cf8b554.js"></script>
<script type="text/javascript" src="/js/home.js"></script>
<script type="text/javascript" src="/js/user/adminTable.js"></script>
</body>
</html>