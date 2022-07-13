<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.card {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #f8f9fa;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.2);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.2)
}
</style>
<header class="py-5">
	<div class="container px-lg-5">
		<div class="p-4 p-lg-5 bg-light rounded-3 text-center">
			<div class="m-4 m-lg-5">
				<h2 class="display-5 fw-bold">예약한 내역이 없어요!</h2>
				<p class="fs-4">Bootstrap utility classes are used to create
					this jumbotron since the old component has been removed from the
					framework. Why create custom CSS when you can use utilities?</p>
				<a class="btn btn-primary btn-lg" href="/house/list">숙소 보러가기</a>
			</div>
		</div>
	</div>
</header>
<section class="pt-4">
	<div class="container px-lg-5">
		<!-- Page Features-->
		<div class="row gx-lg-5">

			<div class="col-lg-6 col-xxl-4 mb-5">
				<div class="card bg-light border-0 h-100 ">
					<div class="d-flex">
						<img
							src="https://cdn.pixabay.com/photo/2022/07/05/08/41/agriculture-7302617_960_720.jpg"
							width="120px" height="120px">
							<h5 class="flex-shrink-0">&nbsp;&nbsp;예약한 숙소 이름</h5><br>
						<div class="card-body p-4 p-lg-5 pt-0 pt-lg-0">
							<p class="flex-shrink-0">숙박 일정</p>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6 col-xxl-4 mb-5">
				<div class="card bg-light border-0 h-100">
					<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4">
							<i class="bi bi-cloud-download"></i>
						</div>
						<p class="mb-0">As always, Start Bootstrap has a powerful
							collectin of free templates.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-xxl-4 mb-5">
				<div class="card bg-light border-0 h-100">
					<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4">
							<i class="bi bi-card-heading"></i>
						</div>
						<h2 class="fs-4 fw-bold">Jumbotron hero header</h2>
						<p class="mb-0">The heroic part of this template is the
							jumbotron hero header!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-xxl-4 mb-5">
				<div class="card bg-light border-0 h-100">
					<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4">
							<i class="bi bi-bootstrap"></i>
						</div>
						<h2 class="fs-4 fw-bold">Feature boxes</h2>
						<p class="mb-0">We've created some custom feature boxes using
							Bootstrap icons!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-xxl-4 mb-5">
				<div class="card bg-light border-0 h-100">
					<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4">
							<i class="bi bi-code"></i>
						</div>
						<h2 class="fs-4 fw-bold">Simple clean code</h2>
						<p class="mb-0">We keep our dependencies up to date and squash
							bugs as they come!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-xxl-4 mb-5">
				<div class="card bg-light border-0 h-100">
					<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4">
							<i class="bi bi-patch-check"></i>
						</div>
						<h2 class="fs-4 fw-bold">A name you trust</h2>
						<p class="mb-0">Start Bootstrap has been the leader in free
							Bootstrap templates since 2013!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>