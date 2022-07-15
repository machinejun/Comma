<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/review/style.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="py-5 border-bottom" id="features">
	<div class="container">
		<div class="row justify-content-center">
			<h3>
				<b>📝 리뷰 관리</b>
			</h3>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<div class="table-wrap">
					<table class="table table-responsive-xl">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th>아이디</th>
								<th>Username</th>
								<th>내용</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="review" items="${reviews.content}">
								<input type="hidden" id="review-id" value="${review.id}">
								<tr class="alert" role="alert">
									<td><label class="checkbox-wrap checkbox-primary"> <input type="checkbox" checked> <span class="checkmark"></span>
									</label></td>
									<td class="d-flex align-items-center">
										<div>
											<span>${review.guestId.username}</span> <span>작성날짜 : ${review.creationDate}</span>
										</div>
									</td>
									<td>${review.guestId.username}</td>
									<td><span>${review.content}</span></td>
									<td><a class="text-decoration-none" data-toggle="modal" data-target="#replyModal" style="cursor: pointer;"> 자세히</a></td>
								</tr>
								<div class="modal" id="replyModal">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">

											<!-- Modal Header -->
											<div class="modal-header">
												<h5 class="modal-body">${review.guestId.username}</h5>
												<h6>${review.creationDate}</h6>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>

											<div class="modal-body">${review.content}</div>
											<hr>

											<div class="modal-body">
												<h6 class="modal-body">댓글 등록하기</h6>
											</div>

											<input class="modal-body" style="margin-left: 15px; margin-right: 15px" id="content"></input>

											<div class="modal-footer">
												<button type="button" id="btn-reply" class="btn btn-primary" data-dismiss="modal">등록</button>
											</div>

										</div>
									</div>
								</div>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>


<script src="/js/review/jquery.min.js"></script>
<script src="/js/review/popper.js"></script>
<script src="/js/review/bootstrap.min.js"></script>
<script src="/js/review/main.js"></script>

<script src="/js/review.js"></script>