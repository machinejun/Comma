<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.bi-suit-heart {
	font-size: 30px;
	line-height: 30px;
	color: crimson;
}

.bi-suit-heart-fill {
	font-size: 30px;
	line-height: 30px;
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
}
</style>
<!-- 숙소 정보-->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img src="http://localhost:9090/upload/${house.image.imageUrl}"
					width="500px" height="600px" />
			</div>
			<div class="col-md-6">
				<h3 class="display-5 fw-bolder">
					<b>${house.name}</b>
				</h3>
				<div class="fs-5 mb-5">
					<span class="text-decoration-line-through"><i
						class="bi bi-geo-alt"></i>&nbsp;${house.address}</span>
				</div>
				<p class="lead">${house.infoText}</p>
				<div class="d-flex">
					<i class="bi bi-suit-heart flex-shrink-0"></i>&nbsp;&nbsp;
					<button class="btn btn-outline-dark flex-shrink-0" type="button">
						예약하기</button>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<hr>
		<!-- 평균 별점 -->
		<h5>
			<b>후기</b>
		</h5>
		<div>
			<label class="bi-star-fill"></label>&nbsp;${house.starScore}
		</div>
		<c:forEach var="review" items="${reviews}">
			<a href="/review/list/${house.id}"></a>
			<!-- 게스트의 리뷰 -->
			<div class="flex-shrink-0">
				<img class="rounded-circle"
					src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" />
			</div>
			<div class="ms-3">
				<div class="fw-bold">${review.guestId.username}</div>
				${review.content}
			</div>
			<!-- 호스트에게는 답글 달기 버튼 보이게 -->
			<c:if test="">
				<div style="cursor: pointer;">
					<p p class="mb-5 float-right" style="cursor: pointer;"
						data-toggle="modal" data-target="#reply">답글 쓰기</p>
					<i class="bi bi-pencil-square d-flex float-right"></i>
				</div>
			</c:if>

			<!-- 호스트의 답글 -->
			<div class="container d-flex mt-4">
				<div class="flex-shrink-0">
					<img class="rounded-circle"
						src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
				</div>
				<div class="ms-3">
					<div class="fw-bold">Host Name</div>
					And under those conditions, you cannot establish a capital-market
					evaluation of that enterprise. You can't get investors.
				</div>
			</div>

		</c:forEach>
	</div>
</section>

<!-- 관련 숙소 뿌리기 -->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<hr>
		<h4 class="fw-bolder mb-4">
			<b>이런 숙소는 어때요</b>
		</h4>
		<br>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">Fancy Product</h5>
							<!-- Product price-->
							$40.00 - $80.00
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">View options</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">Sale</div>
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">Special Item</h5>
							<!-- Product reviews-->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
							</div>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">$20.00</span>
							$18.00
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">Sale</div>
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">Sale Item</h5>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">$50.00</span>
							$25.00
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">Popular Item</h5>
							<!-- Product reviews-->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
							</div>
							<!-- Product price-->
							$40.00
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	let heartCheck = true;

	$('.bi-suit-heart').on('click', function() {
		if (heartCheck) {
			$(this).removeClass('bi-suit-heart');
			$(this).addClass('bi-suit-heart-fill');
			heartCheck = false;
			addWishList();
		} else {
			$(this).removeClass('bi-suit-heart-fill');
			$(this).addClass('bi-suit-heart');
			heartCheck = true;
		}

	});
	
	function addWishList() {
		let data = {
			houseId: document.querySelector("#house-id").value,
			guestId: 1
			//guestId: document.querySelector("#guest-id").value
		}
		console.log("houseId" + data.houseId);
		
		fetch("/api/house/wishList", {
			method: "post",
			headers: {
				'content-type': 'application/json; charset=utf-8'
			},
			body: JSON.stringify(data)
		})
		.then(res => res.text())
		.then(res => {
		});
	}
</script>
<script src="/js/house/house.js"></script>
