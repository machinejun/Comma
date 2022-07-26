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

.bi-suit-heart {
	font-size: 23px;
	line-height: 25px;
	color: #ff5555;
}

.bi-suit-heart-fill {
	font-size: 23px;
	line-height: 25px;
	color: #ff5555;
}

.multiLine {
	width: 200px;
	line-height: 1.3;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
}
</style>

<div class="container">
	<div class="p-4 p-lg-5 rounded-3 text-center" style="background-color: rgba(255, 149, 149, 0.05);">
		<div class="m-4 m-lg-5">
			<c:choose>
				<c:when test="${empty wishList}">
					<h2 class="display-5 fw-bold">추가된 위시리스트가 없습니다.</h2>
					<br>
					<div>
						<a class="btn custom-btn" style="margin-left: 400px" href="/house/list">숙소 보러가기</a>
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
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:set var="notExist" value="bi-suit-heart"></c:set>
			<c:set var="exist" value="bi-suit-heart-fill"></c:set>
			<c:forEach var="house" items="${wishList}">
				<input type="hidden" value="${house.house.id}" id="house-id">
				<div class="col mb-5" style="margin: 30px;">
					<div class="h-100">
						<a href="/house/detail/${house.house.id}"><img class="custom-img" src="http://localhost:9090/upload/${house.house.image.imageUrl}" style="width: 300px; height: 250px; object-fit: cover;"></a>
						<div class="p-4">
							<div class="container" style="position: relative; width: 240px;">
								<h5 class="fw-bolder multiLine" style="position: absolute;">${house.house.name}</h5>
								<i class="bi ${not empty house ? exist : notExist}" style="margin-top: 10px; cursor: pointer; position: absolute; right: -5%" id="like-${house.house.id}" onclick="clickHeart(${house.house.id})"></i>
								<p style="position: absolute; top: 45px">${house.house.type},&nbsp;${house.house.address}</p>
							</div>
						</div>
						<br> <br>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	function clickHeart(houseId) {
		let token = $("meta[name='_csrf']").attr("content");
		let header = $("meta[name='_csrf_header']").attr("content");
	

		let data = {
			id : houseId
		}

		// 빈 하트를 눌렀을때
		if ($("#like-" + houseId).attr("class") == "bi bi-suit-heart") {

			console.log("위시리스트 추가 확인 : " + houseId);
			$.ajax({
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token)
				},

				url : "/api/house/wish-list",
				type : "POST",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				dataType : "json"
			}).done(function() {
				console.log("하트추가 성공");
			}).fail(function(error) {
				console.log(error);
			});
			// 채워진 하트로 바꾸기
			document.getElementById("like-" + houseId).className = "bi bi-suit-heart-fill";

			// 채워진 하트를 눌렀을 때
		} else if ($("#like-" + houseId).attr("class") == "bi bi-suit-heart-fill") {

			console.log("위시리스트 삭제 확인 : " + houseId);

			$.ajax({
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token)
				},

				url : "/api/house/wish-list/" + houseId,
				type : "DELETE",
			}).done(function() {
				console.log("위시리스트 삭제");
			}).fail(function() {
			});
			// 빈 하트로 바꾸기
			document.getElementById("like-" + houseId).className = "bi bi-suit-heart";
		}

	}
</script>
<script type="text/javascript" src="/js/home.js"></script>