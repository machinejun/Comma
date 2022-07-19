<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<style>
.card {
	max-width: 680px;
	margin-top: 80px;
	padding: 20px;
	background: #f8f9fa;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.2);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.2)
}

.custom-btn {
	font-family: Montserrat-Bold;
	font-size: 15px;
	line-height: 1.5;
	color: #fff;
	text-transform: uppercase;
	border: none;
	width: 170px;
	height: 30px;
	border-radius: 25px;
	background: #1763E9;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0 20px;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
}

.custom-btn-sm {
	font-family: Montserrat-Bold;
	font-size: 15px;
	line-height: 1.5;
	color: #fff;
	text-transform: uppercase;
	border: none;
	width: 40px;
	height: 30px;
	border-radius: 25px;
	background: #1763E9;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0 20px;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
}
</style>
<header class="py-5">
	<div class="container px-lg-5">
		<div class="p-4 p-lg-5 bg-light rounded-3 text-center">
			<div class="m-4 m-lg-5">
				<c:choose>
					<c:when test="${empty reservations}">
						<h2 class="display-5 fw-bold">예약한 내역이 없어요!</h2>
						<a class="custom-btn justify-content-center" href="/house/list">숙소 보러가기</a>
					</c:when>
					<c:otherwise>
						<h2 class="display-5 fw-bold">나의 예약 내역</h2>
						<p>숙소에 대한 리뷰를 작성해주세요!</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</header>
<section class="pt-4">
	<div class="container px-lg-5">
		<div class="row gx-lg-5">
			<c:forEach var="reservation" items="${reservations}">
				<div class="col-lg-6 col-xxl-4 mb-5">
					<div class="card bg-light border-0 h-100 ">
						<div class="d-flex">
							<img src="https://cdn.pixabay.com/photo/2022/07/05/08/41/agriculture-7302617_960_720.jpg" width="200px" height="170px">
							<div>
								<p>&nbsp;&nbsp;&nbsp;예약 날짜</p>
								<h5 class="flex-shrink-0">&nbsp;&nbsp;&nbsp;예약한 숙소 이름</h5>
								<br>
								<p class="flex-shrink-0">&nbsp;&nbsp;&nbsp;숙박 일정</p>
							</div>
							<a class="text-decoration-none" data-toggle="modal" data-target="#infoModal" style="cursor: pointer;"> 예약 상세정보 </a>
						</div>
					</div>
				</div>
				<br>
				<br>
			</c:forEach>
			<div class="col-sm-4">
				<div class="custom-card mb-4">
					<a href="/"><img class="card-img" src="https://cdn.pixabay.com/photo/2016/04/25/23/30/house-1353389_960_720.jpg"></a>
					<div class="card-body">
						<div class="small text-muted">
							<i class="bi bi-geo-alt"></i>&nbsp;숙소 지역
						</div>
						<h5 class="card-title">예약 숙소 이름</h5>
						<p class="card-text"></p>
						<br>
						<!-- 예약상태 completed면 리뷰 쓰기 버튼 뜨도록 -->
						<a href="/review/post_form" class="custom-btn">리뷰 작성하기</a> <br>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<br>
<br>
<br>
<br>

<%@ include file="../layout/footer.jsp"%>