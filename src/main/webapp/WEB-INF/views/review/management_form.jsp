<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
			<b>📝 리뷰 관리</b>
		</h3>
		<br>
		<div class="row gx-5">
			<table class="table">
				<thead>
					<tr>
						<th>번 호</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>
				<c:forEach var="review" items="${reviews}">
					<input type="hidden" id="review-id" value="${review.id}">
					<tr>
						<td>1</td>
						<td>${review.guestId.username}</td>
						<td>홍길동</td>
					</tr>

					<!-- The Modal -->
					<!--  
					<a class="text-decoration-none" data-toggle="modal"
						data-target="#replyModal" style="cursor: pointer;"> 호스트 댓글
						등록하기</a>
						-->

					<div class="modal" id="replyModal">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h5 class="modal-body">${review.guestId.username}</h5>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">${review.content}</div>

								<!-- Modal Header -->
								<div class="modal-body">
									<h5 class="modal-body">Modal Heading</h5>
									<hr>
								</div>

								<!-- Modal body -->
								<input class="modal-body" style="margin: 5%" id="content"></input>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" id="btn-reply" class="btn btn-primary"
										data-dismiss="modal">등록</button>
								</div>

							</div>
						</div>
					</div>

				</c:forEach>
			</table>
		</div>
	</div>
</section>

<script src="/js/review.js"></script>