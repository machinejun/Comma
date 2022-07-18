<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
</style>

<div class="container">
	<br>
	<div class="p-4 p-lg-5 bg-light rounded-3 text-center">
		<div class="m-4 m-lg-5">
			<c:choose>
				<c:when test="${empty wishList}">
					<h2 class="display-5 fw-bold">추가된 위시리스트가 없습니다.</h2>
					<a class="btn btn-primary btn-lg" href="/house/list">숙소 보러가기</a>
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
				<div class="card mb-4">
					<a href="/house/detail/${house.house.id}"><img class="card-img-top" src="http://localhost:9090/upload/${house.house.image.imageUrl}"></a>
					<div class="card-body">
						<div class="small text-muted">
							<i class="bi bi-geo-alt"></i>&nbsp;${house.house.address}
						</div>
						<h2 class="card-title h4">${house.house.name}</h2>
						<p class="card-text"></p>
						<br>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
</div>