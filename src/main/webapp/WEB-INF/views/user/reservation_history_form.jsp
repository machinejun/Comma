<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
<header class="py-5">
	<div class="container px-lg-5">
		<div class="p-4 p-lg-5 bg-light rounded-3 text-center">
			<div class="m-4 m-lg-5">
				<c:choose>
					<c:when test="${empty reservations}">
						<h2 class="display-5 fw-bold">예약한 내역이 없어요!</h2>
						<a class="btn btn-primary btn-lg" href="/house/list">숙소 보러가기</a>
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
		</div>
	</div>
</section>
<br>
<br>
<br>
<br>

<%@ include file="../layout/footer.jsp"%>