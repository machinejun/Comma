<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="/css/house/detail.css" rel="stylesheet">

<section class="py-5">
	<input type="hidden" id="pageIndex" name="pageIndex" val="" />
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">

			<!-- TODO 로그인 했을 때만 찜버튼 누를 수 있도록 -->
			<c:choose>
				<c:when test="${not empty principal}">

				</c:when>
				<c:otherwise>

				</c:otherwise>

			</c:choose>

			<c:set var="notExist" value="bi-suit-heart"></c:set>
			<c:set var="exist" value="bi-suit-heart-fill"></c:set>

			<input type="hidden" value="${house.id}" id="house-id">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="http://localhost:9090/upload/${house.image.imageUrl}"
					width="500px" height="600px" style="border-radius: 15px" />
			</div>
			<div class="col-md-6">
				<h2 class="display-5 fw-bolder">
					<b>${house.name}</b>
				</h2>
				<br>
				<div class="fs-5 mb-5 d-flex ">
					<span class="text-decoration-line-through flex-shrink-0"><i
						class="bi bi-geo-alt"></i>&nbsp;${house.address}</span>
				</div>
				<br>
				<div class="d-flex">
					<h4>₩&nbsp;${house.oneDayPrice}</h4>
					<h6 style="margin-top: 5px;">&nbsp;&nbsp;/ 박</h6>
				</div>
				<p class="multiLine-house">${house.infoText}</p>

				<br> <br> <a class="text-decoration-none"
					data-toggle="modal" data-target="#infoModal"
					style="cursor: pointer;"> 더보기 </a> <br> <br> <br>
				<div class="d-flex">

					<i class="bi ${not empty likeHouse.house ? exist : notExist}"
						style="margin-top: 5px; cursor: pointer;" id="like"
						onclick="clickHeart()"></i> &nbsp;&nbsp;
					<button class="btn btn-outline-dark flex-shrink-0" type="button">
						예약하기</button>
				</div>

			</div>
		</div>
	</div>

	<!-- 숙소 설명 모달 -->
	<div class="modal" id="infoModal">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<div class="modal-body">
					<h4 class="modal-title">
						<b>⛪ 숙소 설명</b>
					</h4>
					<br>
					<p>${house.infoText}</p>
				</div>

			</div>
		</div>
	</div>

	<div class="container px-4 px-lg-5 my-5">
		<hr>
		<!-- 평균 별점 -->
		<div class="d-flex">
			<h4 class="flex-shrink-0">
				<b>리뷰</b>
			</h4>
			<h6 class="flex-shrink-0" style="margin-top: 5px;">&nbsp;&nbsp;${reviewCount}개</h6>
			<div>
				&nbsp;&nbsp;<label style="margin-top: 3px;">⭐</label>&nbsp;${avgScore}
			</div>
		</div>
		<br> <br>

		<div class="container d-flex">
			<c:set var="star-fill" value="bi-star-fill"></c:set>
			<c:set var="star-blank" value=""></c:set>

			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isAbled" value=""></c:set>

			<c:forEach var="review" items="${reviews.content}">
				<div class="row">
					<!-- 게스트의 리뷰 -->
					<div class="col-lg-4 mb-5 mb-lg-0" id="bodyContents"
						style="height: 240px; margin-right: 120px;">
						<input type="hidden" id="review-id" value="${review.id}">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3"></div>
						<h2 class="h4 fw-bolder">${review.guestId.username}</h2>
						<p class="multiLine">${review.content}</p>

						<div>
							<a class="text-decoration-none" data-toggle="modal"
								data-target="#reviewModal" style="cursor: pointer;"> 더 보기 </a>
						</div>
					</div>
				</div>
				<div class="modal" id="reviewModal">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">
							<c:if test="${review.guestId.id eq principal.user.id}">

							</c:if>
							<div class="modal-header">
								<h5>
									<b>📝 리뷰 상세보기</b>
								</h5>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<div class="modal-body">
								<h3>${review.guestId.username}</h3>
								<p>${review.content}</p>
								<button class="btn btn-outline-danger btn-sm float-right"
									style="margin-left: 10px;" id="btn-delete">삭제</button>
								<a class="btn btn-outline-primary btn-sm float-right"
									id="btn-update" href="/review/update_form/${review.id}">수정</a> <br>
								<hr>
								<h5>
									<b>호스트의 댓글</b>
								</h5>
								<c:forEach var="reply" items="${review.replies}">
									<p>${reply.content}</p>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<ul class="pagination">

				<c:set var="isDisabled" value="disabled"></c:set>

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
			</ul>

		</div>
	</div>
</section>

<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<h4 class="fw-bolder mb-4">
			<b>🏡 이런 숙소는 어때요</b>
		</h4>
		<br>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
			<c:forEach var="house" items="${houseList}">
				<c:set var="avgScore" value="${avgScore * 20 * 1.4}"></c:set>
				<div class="col mb-5">
					<div class="card h-100">
						<a href="/house/detail/${house.id}"> <img class="card-img-top"
							src="http://localhost:9090/upload/${house.image.imageUrl}"
							width="100%" height="160px"></a>
						<div class="card-body p-4 ">
							<div class="text-center">
								<h5 class="fw-bolder multiLine-recommand">${house.name}</h5>
							</div>
							<br>
							<div class="star-ratings">
								<div class="star-ratings-fill" style="width: ${avgScore}%">
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
</section>

<script>
	function clickHeart() {
		// 로그인 안한 상태에서 하트를 클릭하면 로그인해야한다는 알림창 뜨도록

		let data = {
			id : $("#house-id").val()
		}
		// 빈하트를 눌렀을때
		if ($("#like").attr("class") == "bi bi-suit-heart") {
			$.ajax({
				url : "/api/house/wishList",
				type : "POST",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				dataType : "json"
			}).done(function() {
				console.log("하트추가 성공");
			}).fail(function(error) {
				console.log(error);
			});

			// 꽉찬하트로 바꾸기
			document.getElementById("like").className = "bi bi-suit-heart-fill";

			// 꽉찬 하트를 눌렀을 때
		} else if ($("#like").attr("class") == "bi bi-suit-heart-fill") {
			let houseId = $("#house-id").val();

			$.ajax({
				url : "/api/house/wishList/" + houseId,
				type : "DELETE",
			}).done(function() {
				console.log("위시리스트 삭제");
			}).fail(function() {
			});

			// 빈하트로 바꾸기
			document.getElementById("like").className = "bi bi-suit-heart";
		}
	}
</script>
<script src="/js/review.js"></script>