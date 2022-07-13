<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.bi-suit-heart {
	font-size: 20px;
	line-height: 20px;
	color: crimson;
}

.bi-suit-heart-fill {
	font-size: 20px;
	line-height: 20px;
	color: crimson;
}

.bi-reply {
	font-size: 20px;
}

.bi-reply-fill:hover {
	font-size: 20px;
	color: black;
}

.my-underline {
	text-decoration: underline;
}

.bi-star-fill {
	color: #ffc107;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5em;
	justify-content: space-around;
	padding: 0 .2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: transparent;
	text-shadow: 0 0 0 #e0e0e0;
	cursor: pointer;
}

.star-rating :checked ~ label {
	text-shadow: 0 0 0 #fdd826;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	text-shadow: 0 0 0 #fdd826;
}
</style>

<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<input type="hidden" value="${house.id}" id="house-id">
			<div class="col-md-6">
				<img src="http://localhost:9090/upload/${house.image.imageUrl}" width="500px" height="600px" />
			</div>
			<div class="col-md-6">
				<h3 class="display-5 fw-bolder">
					<b>${house.name}</b>
				</h3>
				<div class="fs-5 mb-5 d-flex">
					<span class="text-decoration-line-through flex-shrink-0"><i class="bi bi-geo-alt"></i>&nbsp;${house.address}</span> <i class="bi bi-suit-heart flex-shrink-0"></i>
				</div>
				<p>${house.infoText}</p>
				<div class="d-flex">
					&nbsp;&nbsp;
					<button class="btn btn-outline-dark flex-shrink-0" type="button">예약하기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container px-4 px-lg-5 my-5">
		<hr>
		<!-- 평균 별점 -->
		<div class="d-flex">
		<h5 class="flex-shrink-0">
			<b>후기</b>
		</h5>
		<div >
			&nbsp;&nbsp;<label class="bi-star-fill"></label>&nbsp;${house.starScore}
		</div>
		</div>
		<c:forEach var="review" items="${reviews}">
			<a href="/review/list/${house.id}"></a>
			<!-- 게스트의 리뷰 -->
			<div class="flex-shrink-0">
				<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" />
			</div>
			<div class="ms-3">
				<div class="fw-bold">${review.guestId.username}</div>
				${review.content}
			</div>
			<!-- 호스트에게는 답글 삭제 버튼 보이게 -->
			<c:if test="">
				<div style="cursor: pointer;">
					<p class="mb-5 float-right" style="cursor: pointer;" data-toggle="modal" data-target="#reply">답글 쓰기</p>
					<i class="bi bi-pencil-square d-flex float-right"></i>
				</div>
			</c:if>

			<!-- 호스트의 답글 -->
			<div class="container d-flex mt-4">
				<div class="flex-shrink-0">
					<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
				</div>
				<div class="ms-3">
					<div class="fw-bold">Host Name</div>
					And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
				</div>
			</div>

		</c:forEach>
	</div>
</section>

<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<hr>
		<h4 class="fw-bolder mb-4">
			<b>이런 숙소는 어때요</b>
		</h4>
		<br>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach var="house" items="${houseList}">
				<div class="col mb-5">
					<div class="card h-100">
						<img class="card-img-top" src="http://localhost:9090/upload/${house.image.imageUrl}" width="230px" height="160px">
						<div class="card-body p-4">
							<div class="text-center">
								<h5 class="fw-bolder">${house.name}</h5>
							</div>
						</div>
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="/house/detail/${house.id}">View Detail</a>
							</div>
						</div>
					</div>

				</div>
			</c:forEach>
		</div>
	</div>

</section>

<script>
	let heartCheck = true;

	$('.bi-suit-heart').on('click', function() {
		if (heartCheck) {
			$(this).removeClass('bi-suit-heart');
			$(this).addClass('bi-suit-heart-fill');
			addWishList();
			heartCheck = false;
		} else {
			$(this).removeClass('bi-suit-heart-fill');
			$(this).addClass('bi-suit-heart');
			deleteWishList();
			heartCheck = true;
		}

	});

	function addWishList() {
		let data = {
			id : document.querySelector("#house-id").value
		}
		console.log("houseId" + data.id);

		fetch("/api/house/wishList", {
			method : "post",
			headers : {
				'content-type' : 'application/json; charset=utf-8'
			},
			body : JSON.stringify(data)
		});
	}

	function deleteWishList() {
		let houseId = document.querySelector("#house-id").value;

		fetch("/api/house/wishList/" + houseId, {
			method : "delete"
		});

	}
</script>
