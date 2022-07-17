<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
					<div class="table-responsive">
						<table class="table custom-table justify-content-center">
							<thead>
								<tr>
									<th>No</th>
									<th>작성자</th>
									<th>평점</th>
									<th>내용</th>
									<th>작성일</th>
									<th>답글 여부</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="review" items="${reviews.content}">
									<input type="hidden" id="house-id" value="${review.houseId.id}">
									<tr>
										<th scope="row" id="review-id">${review.id}</th>
										<td>${review.guestId.username}</td>
										<td>⭐&nbsp;${review.starScore}</td>
										<td>${review.content}</td>
										<td>${review.creationDate}</td>
										<td>${not empty review.replies ? 'Y' : 'N'}</td>
										<td><a class="btn btn-primary-outline"
											data-toggle="modal" data-target="#replyModal"
											style="cursor: pointer;">답글 관리</a></td>
									</tr>

									<div class="modal" id="replyModal">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">

												<div class="modal-header">
													<h5 class="modal-body">${review.guestId.username}</h5>
													<h6>${review.creationDate}</h6>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<div class="modal-body">${review.content}</div>
												<hr>
												<div class="modal-body" id="reply--box">호스트 댓글</div>
												<c:forEach var="reply" items="${review.replies}">
													<input type="hidden" id="reply-id" value="${reply.id}">
													<p class="modal-body">${reply.content}
														<button type="button" id="btn-delete"
															class="close float-right">&times;</button>
													</p>
												</c:forEach>

												<hr>
												<div class="modal-body">
													<h6 class="modal-body">
														<b>호스트 댓글 등록하기</b>
													</h6>
												</div>

												<input class="modal-body"
													style="margin-left: 15px; margin-right: 15px" id="content"></input>

												<div class="modal-footer">
													<button type="button" id="btn-reply"
														class="btn btn-primary" data-dismiss="modal">등록</button>
												</div>

											</div>
										</div>
									</div>
								</c:forEach>
							</tbody>

						</table>

						<ul class="pagination">

							<c:set var="isDisabled" value="disabled"></c:set>

							<c:choose>
								<c:when test="${reviews.first}">
									<li class="page-item disabled"><a class="page-link"
										href="/review/management/${houseId}?page=${reviews.pageable.pageNumber - 1}"><b>&lt;</b></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="/review/management/${houseId}?page=${reviews.pageable.pageNumber - 1}"><b>&lt;</b></a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${reviews.last}">
									<li class="page-item disabled"><a class="page-link"
										href="/review/management/${houseId}?page=${reviews.pageable.pageNumber + 1}"><b>&gt;</b></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="/review/management/${houseId}?page=${reviews.pageable.pageNumber + 1}"><b>&gt;</b></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="/js/review/jquery.min.js"></script>
<script src="/js/review/popper.js"></script>
<script src="/js/review/bootstrap.min.js"></script>
<script src="/js/review/main.js"></script>

<script src="/js/reply.js"></script>