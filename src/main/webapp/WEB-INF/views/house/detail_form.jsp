<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">

<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">

			<c:set var="notExist" value="bi-suit-heart"></c:set>
			<c:set var="exist" value="bi-suit-heart-fill"></c:set>

			<input type="hidden" value="${house.id}" id="house-id">
			<div class="container">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="http://localhost:9090/upload/${house.image.imageUrl}"
						width="500px" height="600px" style="border-radius: 15px" />
				</div>
				<div class="col-md-6">
					<h2 class="multiLine-title">${house.name}</h2>
					<br>
					<div class="fs-5 mb-5 d-flex ">
						<span class="text-decoration-line-through flex-shrink-0">#${house.address}&nbsp;#${house.type}</span>
					</div>
					<br>
					<div class="d-flex">
						<h3>
							₩&nbsp;
							<fmt:formatNumber value="${house.oneDayPrice}" pattern="#,###" />
						</h3>
						<p style="margin-top: 25px;">&nbsp;&nbsp;/ 박</p>
					</div>
					<br> <br>
					<div class="multiLine">${house.infoText}</div>

					<br>
					<p class="underline-text">
						<a data-toggle="modal" data-target="#info-modal"
							style="cursor: pointer;">더 보기</a>
					</p>
					<br> <br>
					<div class="d-flex" style="position: absolute; bottom: -10%;">
						<button class="custom-btn flex-shrink-0"
							onclick="location.href='/user/bookForm/${house.id}'"
							type="button">예약하기</button>
						<i class="bi ${not empty likeHouse.house ? exist : notExist}"
							style="margin-left: 25px; cursor: pointer;" id="like"
							onclick="clickHeart()"></i>&nbsp;&nbsp;&nbsp;&nbsp;

					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- 숙소 설명 모달 -->
	<div class="modal" id="info-modal">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<div class="modal-body">
					<h3 class="modal-title">
						<b>숙소 설명</b>
					</h3>
					<br>
					<p>${house.infoText}</p>
				</div>

			</div>
		</div>
	</div>

	<div class="container px-4 px-lg-5 my-5">
		<input type="hidden" value="${principal.user.id}" id="principal-id" />
		<hr>
		<!-- 평균 별점 -->
		<div class="d-flex">
			<h3 class="custom-text">리뷰</h3>
			<h4 style="margin-top: 30px;">&nbsp;&nbsp;&nbsp;${reviewCount}개</h4>
			<div>
				&nbsp;&nbsp;<label style="margin-top: 27px;">⭐</label>&nbsp;${avgScore}
			</div>
		</div>
		<br> <br>

		<div class="container d-flex" id="review-box">
			<c:set var="star-fill" value="bi-star-fill"></c:set>
			<c:set var="star-blank" value=""></c:set>

			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isAbled" value=""></c:set>

			<c:choose>
				<c:when test="${reviewCount eq 0}">
					<h4 class="display-5 fw-bold">작성된 리뷰가 없습니다.</h4>
				</c:when>
			</c:choose>
			<c:forEach var="review" items="${reviews.content}">
				<div class="row" id="review-content">
					<!-- 게스트의 리뷰 -->
					<div class="col-lg-4 mb-5 mb-lg-0" id="bodyContents"
						style="height: 240px; margin-right: 120px;">
						<input type="hidden" id="review-id" value="${review.id}">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3"></div>
						<h3>${review.guestId.username}</h3>
						<div class="review-multiLine">${review.content}</div>
						<div>
							<br> <br>
							<p class="underline-text">
								<a data-toggle="modal" data-target="#review-modal-${review.id}"
									style="cursor: pointer;">더 보기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="modal" id="review-modal-${review.id}">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">

							<div class="modal-header">
								<h4>
									<b>리뷰 상세보기</b>
								</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<div class="modal-body">
								<h4>
									<b>${review.guestId.username}님의&nbsp;리뷰</b>
								</h4>
								<p>
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${review.creationDate}" />
								</p>
								<div class="star-ratings">
									<div class="star-ratings-fill"
										style="width: ${review.starScore * 20 * 1.4}%">
										<span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span>
									</div>
									<div class="star-ratings-base">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
									<br>
								</div>
								<p>${review.content}</p>
								<hr>
								<c:if test="${not empty review.replies}">
									<h5>
										<b>호스트의 댓글</b>
									</h5>
									<c:forEach var="reply" items="${review.replies}">
										<h4>${reply.content}</h4>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<ul class="pagination">

			<c:set var="isDisabled" value="disabled"></c:set>

			<c:choose>
				<c:when test="${reviewCount ne 0}">
					<c:choose>
						<c:when test="${reviews.first}">
							<li class="page-item disabled"><a class="page-link"
								href="/house/detail/${house.id}?page=${reviews.pageable.pageNumber - 1}"><b>&lt;</b></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="/house/detail/${house.id}?page=${reviews.pageable.pageNumber - 1}"><b>&lt;</b></a></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${reviews.last}">
							<li class="page-item disabled"><a class="page-link"
								href="/house/detail/${house.id}?page=${reviews.pageable.pageNumber + 1}"><b>&gt;</b></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="/house/detail/${house.id}?page=${reviews.pageable.pageNumber + 1}"><b>&gt;</b></a></li>
						</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>
		</ul>

	</div>
</section>

<section class="py-5 bg-light">
<c:if test="${not empty houseList}">
	<div class="container px-4 px-lg-5 mt-5">
		<h3 class="custom-text mb-4">이런 숙소는 어때요</h3>
		<br>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
			<c:forEach var="house" items="${houseList}">
				<c:set var="avgScore" value="${house.starScore * 20}"></c:set>
				<div class="col mb-5">
					<div class="custom-card h-100">
						<a href="/house/detail/${house.id}"> <img
							class="custom-card-img"
							src="http://localhost:9090/upload/${house.image.imageUrl}"
							width="240px;" height="160px"></a>
						<div class="card-body">
							<div class="text-center">
								<h4 class="multiLine" style="margin-left: 10px;">
									<b>${house.name}</b>
								</h4>
							</div>
							<br>
							<div class="star-ratings" style="margin-left: 5px;">
								<div class="star-ratings-fill"
									style="width: ${house.starScore * 20 * 1.4}%; margin-left: 50px;">
									<span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span>
								</div>
								<div class="star-ratings-base">
									<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
								</div>
								<br> <br>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>
</section>
<script>
	function clickHeart() {
		let token = $("meta[name='_csrf']").attr("content");
		let header = $("meta[name='_csrf_header']").attr("content");

		let data = {
			id : $("#house-id").val()
		}

		// 빈 하트를 눌렀을때
		if ($("#like").attr("class") == "bi bi-suit-heart") {

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
			document.getElementById("like").className = "bi bi-suit-heart-fill";

			// 채워진 하트를 눌렀을 때
		} else if ($("#like").attr("class") == "bi bi-suit-heart-fill") {
			let houseId = $("#house-id").val();
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
			document.getElementById("like").className = "bi bi-suit-heart";
		}

	}
</script>
<script src="/js/review.js"></script>
<%@ include file="../layout/footer.jsp"%>