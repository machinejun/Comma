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

<section class="py-5 border-bottom" id="features">
	<div class="container px-5 my-5">
		<h3>
			<b>리뷰 관리</b>
		</h3>
		<br>
		<div class="row gx-5">
			<c:forEach var="review" items="${reviews}">
				<div class="col-lg-4">
					<h2 class="h4 fw-bolder">${review.guestId.username}</h2>
					<div class="d-flex small text-warning mb-2">
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
						<div class="bi-star-fill"></div>
					</div>
					<p>Paragraph of text beneath the heading to explain the
						heading. We'll add onto it with another sentence and probably just
						keep going until we run out of words.</p>
					<a class="text-decoration-none" href="#!"> Call to action <i
						class="bi bi-arrow-right"></i>
					</a>
				</div>
			</c:forEach>

			<div class="col-lg-4">
				<h2 class="h4 fw-bolder">Featured title</h2>
				<div class="d-flex small text-warning mb-2">
					<div class="bi-star-fill"></div>
					<div class="bi-star-fill"></div>
					<div class="bi-star-fill"></div>
					<div class="bi-star-fill"></div>
					<div class="bi-star-fill"></div>
				</div>
				<p>Paragraph of text beneath the heading to explain the heading.
					We'll add onto it with another sentence and probably just keep
					going until we run out of words.</p>
				<a class="text-decoration-none" href="#!"> Call to action <i
					class="bi bi-arrow-right"></i>
				</a>
			</div>
			<div class="col-lg-4">
				<h2 class="h4 fw-bolder">Featured title</h2>
				<div class="d-flex small text-warning mb-2">
					<div class="bi-star-fill"></div>
					<div class="bi-star-fill"></div>
					<div class="bi-star-fill"></div>
					<div class="bi-star-fill"></div>
					<div class="bi-star-fill"></div>
				</div>
				<p>Paragraph of text beneath the heading to explain the heading.
					We'll add onto it with another sentence and probably just keep
					going until we run out of words.</p>
				<a class="text-decoration-none" href="#!"> 호스트 댓글 등록하기 <i
					class="bi bi-arrow-right"></i>
				</a>
			</div>
		</div>
	</div>
</section>