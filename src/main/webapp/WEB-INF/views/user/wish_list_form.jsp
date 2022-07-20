<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">
<style>
.custom-img {
	border-radius: 20px;
}
</style>

<div class="container">
	<div class="p-4 p-lg-5 bg-light rounded-3 text-center">
		<div class="m-4 m-lg-5">
			<c:choose>
				<c:when test="${empty wishList}">
					<h2 class="display-5 fw-bold">추가된 위시리스트가 없습니다.</h2>
					<br>
					<div>
						<a class="btn custom-btn" style="margin-left: 350px"
							href="/house/list">숙소 보러가기</a>
					</div>
				</c:when>
				<c:otherwise>
					<h2>나의 위시리스트</h2>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div></div>
	<br>

	<div class="container py-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach var="house" items="${wishList}">
				<div class="col mb-5" style="margin: 30px;">
					<div class="h-100">
						<a href="/house/detail/${house.house.id}"><img
							class="custom-img"
							src="http://localhost:9090/upload/${house.house.image.imageUrl}"
							style="width: 300px; height: 250px;"></a>
						<div class="p-4">
							<div class="text-center" style="margin-left: 30px;">
								<h5 class="fw-bolder">${house.house.name}</h5>
								${house.house.address}
							</div>
						</div>
						<br> <br>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
