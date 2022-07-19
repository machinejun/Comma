<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">
<style>
.custom-card-img {
	border-radius: 30px;
}
</style>
<div class="container">
	<br>
	<div class="p-4 bg-light rounded-3 text-center">
		<div class="m-4 m-lg-5">
			<c:choose>
				<c:when test="${empty wishList}">
					<h2 class="display-5 fw-bold">추가된 위시리스트가 없습니다.</h2>
					<br>
					<div class="justify-content-center">
						<a class="btn custom-btn" href="/house/list">숙소 보러가기</a>
					</div>
				</c:when>
				<c:otherwise>
					<h2 class="display-5 fw-bold">나의 위시리스트</h2>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<br>
	<div class="row">
		<c:forEach var="house" items="${wishList}">
			<div class="col-sm-4">
				<div class="custom-card mb-4">
					<a href="/house/detail/${house.house.id}"><img class="custom-card-img" src="http://localhost:9090/upload/${house.house.image.imageUrl}"></a>
					<div class="card-body">
						<div class="small text-muted">
							<i class="bi bi-geo-alt"></i>&nbsp;${house.house.address}
						</div>
						<h5 class="card-title">${house.house.name}</h5>
						<p class="card-text"></p>
						<br>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
</div>