<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">
<style>
.custom-img {
	border-radius: 10px;
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
	text-decoration: none;
	color: white;
}

.end-line {
	border: 0;
	height: 1px;
	background: #ccc;
}

.multiLine {
	width: 200px;
	line-height: 1.3;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}
</style>

<div class="container">
	<div class="p-4 p-lg-5 rounded-3 text-center" style="background-color: rgba(255, 149, 149, 0.05);">
		<div class="m-4 m-lg-5">
			<c:choose>
				<c:when test="${empty houseList}">
					<h2 class="display-5 fw-bold">등록된 숙소가 없습니다.</h2>
					<br>
				</c:when>
				<c:otherwise>
					<h2>나의 숙소 목록</h2>
				</c:otherwise>
			</c:choose>
			<br>
			<div style="position: absolute; left: 46%">
				<a class="custom-btn" href="/host/post_form">숙소 등록하기</a>
			</div>
			<br>
		</div>
	</div>
	<br> <br>

	<div class="container">
		<c:forEach var="house" items="${houseList}">
			<div class="col-xl">
				<div class="row">
					<a data-toggle="modal" data-target="#info-modal-${house.id}" style="cursor: pointer;"> <img class="custom-img" src="http://localhost:9090/upload/${house.image.imageUrl}"
						style="width: 200px; height: 200px; object-fit: cover;"></a>
					<div style="margin-left: 10px;">
						<div class="col">
							<h4>${house.name}</h4>
						</div>
						<p class="col">
							등록일 :
							<fmt:formatDate pattern="yyyy-MM-dd" value="${house.creationDate}" />
						</p>
					</div>
					<div class="col" style="position: absolute; bottom: 5%; left: 18%">
						<a href="/host/update_form/${house.id}" style="margin-right: 5px; color: rgb(67, 0, 232)">수정</a> <a onclick="index.deleteHouse('${house.id}')"
							style="color: red; margin-right: 5px; color: rgb(203, 0, 0); cursor: pointer;">삭제</a> <a href="/host/review-management/${house.id}" style="color: black">리뷰 관리</a>
					</div>
				</div>

			</div>
			<hr class="end-line">
			<div class="modal" id="info-modal-${house.id}">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<div class="modal-header">
							<h3 class="modal-title">숙소 등록 정보</h3>
						</div>
						<div class="modal-body row">
							<div class="container">
								<div class="col-sm-6">
									<img src="http://localhost:9090/upload/${house.image.imageUrl}" style="width: 350px; height: 350px; border-radius: 10px; margin-bottom: 10px; object-fit: cover;">
								</div>
								<div class="col-sm=6">
									<h3>${house.name}</h3>
									<br>
									<h4>지역&nbsp;:&nbsp;${house.address}</h4>
									<h4>숙소 유형&nbsp;:&nbsp;${house.type}</h4>
									<h4>최대 수용 인원&nbsp;:&nbsp;${house.capacity}</h4>
									<h4>
										숙박 가격&nbsp;:&nbsp; ₩
										<fmt:formatNumber value="${house.oneDayPrice}" pattern="#,###" />
										&nbsp;(박)
									</h4>
									<h4>숙소 소개:&nbsp;</h4>
									<h4 class="multiLine">${house.infoText}</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<br> <br>

</div>
<script src="/js/house.js"></script>
<script type="text/javascript" src="/js/home.js"></script>