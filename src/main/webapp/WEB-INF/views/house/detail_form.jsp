<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<br />
<br />
<!-- Page content-->
<div class="container mt-5">
	<div class="row">
		<div class="col-lg-8">
			<!-- Post content-->
			<article>
				<!-- Post header-->
				<header class="mb-4">
					<!-- Post title-->
					<h1 class="fw-bolder mb-1">${house.name}</h1>
					<!-- Post meta content-->
					<div class="text-muted fst-italic mb-2">${house.creationDate}</div>
				</header>
				<!-- Preview image figure-->
				<figure class="mb-4">
					<img class="img-fluid rounded" src="http://localhost:9090/upload/7d0be8ee-b8c4-45d8-adc7-427fd5ea96ee_image" alt="..." />
				</figure>
				<!-- Post content-->
				<section class="mb-5">
					<p>${house.infoText}</p>

				</section>
			</article>
			<!-- 리뷰 목록 -->
			<section class="mb-5">
				<div class="card bg-light">
					<div class="card-body">
						<!-- Comment form-->
						<form class="mb-4">
							<textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
						</form>
						<!-- Comment with nested comments-->
						<div class="d-flex mb-4">
							<!-- Parent comment-->
							<div class="flex-shrink-0">
								<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							</div>
							<div class="ms-3">
								<div class="fw-bold">Commenter Name</div>
								If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
								<!-- Child comment 1-->
								<div class="d-flex mt-4">
									<div class="flex-shrink-0">
										<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
									</div>
									<div class="ms-3">
										<div class="fw-bold">Commenter Name</div>
										And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
									</div>
								</div>
								<!-- Child comment 2-->
								<div class="d-flex mt-4">
									<div class="flex-shrink-0">
										<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
									</div>
									<div class="ms-3">
										<div class="fw-bold">Commenter Name</div>
										When you put money directly to a problem, it makes a good headline.
									</div>
								</div>
							</div>
						</div>
						<!-- Single comment-->
						<div class="d-flex">
							<div class="flex-shrink-0">
								<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							</div>
							<div class="ms-3">
								<div class="fw-bold">Commenter Name</div>
								When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- Side widgets-->
		<div class="col-lg-4">
			<!-- Search widget-->
			<div class="card mb-4">
				<div class="card-header">Search</div>
				<div class="card-body">
					<div class="input-group">
						<input class="form-control" type="text" placeholder="Search house..." aria-label="Enter search term..." aria-describedby="button-search" />
						<button class="btn btn-primary" id="button-search" type="button">Go!</button>
					</div>
				</div>
			</div>
			<!-- Categories widget-->
			<div class="card">
				<div class="card-body">
					<h2 class="card-title">Card Three</h2>
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
				</div>
				<div class="card-footer">
					<a class="btn btn-outline-dark mt-auto" href="#">예약하기</a>
				</div>
			</div>

		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>