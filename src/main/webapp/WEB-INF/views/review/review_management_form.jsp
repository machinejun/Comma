<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">

<style>
.modal {
	
}
</style>

<section class="py-5 border-bottom" id="features">
	<div class="container">
		<div class="row justify-content-center">
			<h3>📝 리뷰 관리</h3>
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
													<h4 class="modal-body">${review.guestId.username}님의 리뷰</h4>
													<h6>${review.creationDate}</h6>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<div class="modal-body">${review.content}</div>
												<hr>


												<div class="modal-body mb-5">
													<div class="card bg-light">
														<div class="card-body">
															<h4>호스트 댓글</h4>
															<form class="mb-4">
																<textarea class="form-control" rows="3" id="content"
																	placeholder="게스트의 리뷰에 대한 답글을 남겨주세요!"></textarea>
															</form>
															<br>
															<div>
																<button type="button" id="btn-reply"
																	class="custom-sm-btn float-right">등록</button>
															</div>
															<br> <br>
															<c:forEach var="reply" items="${review.replies}">
																<input type="hidden" id="reply-id" value="${reply.id}">
																<div class="mb-4" id="reply--box">

																	<div class=" d-flex">
																		<div class="ms-3">
																			<div class="fw-bold">Commenter Name</div>
																			<p>${reply.content}</p>
																			<button
																				class="btn btn-outline-danger btn-sm float-right"
																				style="margin-left: 10px;" id="btn-delete">삭제</button>
																			<a class="btn btn-outline-primary btn-sm float-right"
																				id="btn-update" href="">수정</a>
																		</div>
																	</div>
																</div>
															</c:forEach>
														</div>
													</div>

													<hr>

												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</tbody>

						</table>

						<ul class="pagination float-center">

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