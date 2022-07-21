<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">
<style>
.custom-img {
	border-radius: 20px;
}

.custom-btn {
	font-family: 'SUIT-Medium';
	font-size: 20px;
	line-height: 1.5;
	color: #fff;
	text-transform: uppercase;
	border: none;
	width: 150px;
	height: 40px;
	border-radius: 5px;
	background: rgba(255, 149, 149, 0.7);
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0 20px;
}

.custom-btn:hover {
	background: rgba(255, 149, 149, 1);
}
</style>

<div class="container">
	<div class="p-4 p-lg-5 bg-light rounded-3 text-center">
		<div class="m-4 m-lg-5">
			<c:choose>
				<c:when test="${empty reviews}">
					<h2 class="display-5 fw-bold">작성된 리뷰가 없습니다.</h2>
					<br>
				</c:when>
				<c:otherwise>
					<h2>나의 리뷰 목록</h2>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div></div>
	<br>

	<div class="container py-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach var="review" items="${reviews}">
				<div class="col mb-5" style="margin: 30px;">
					<div class="h-100">
						<a href="/house/detail/${review.houseId.id}"><img class="custom-img" src="http://localhost:9090/upload/${review.houseId.image.imageUrl}" style="width: 250px; height: 200px;"></a>
						<div class="p-4">
							<div style="margin-left: 20px;">
								<h5 class="fw-bolder">${review.houseId.name}</h5>
								<p>숙박 기간 ${review.creationDate}</p>
								<p>작성일 ${review.creationDate}</p>
							</div>
							<div class="container">
								<a class="btn btn-outline-primary btn-sm " href="/review/update_form/${review.id}">수정</a>
								<button class="btn btn-outline-danger btn-sm" id="btn-delete">삭제</button>
							</div>
						</div>
						<br> <br>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script src="/js/review.js"></script>