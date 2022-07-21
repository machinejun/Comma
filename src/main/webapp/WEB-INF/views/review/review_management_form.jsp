<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">
<style>
.table>tbody>tr>td, .table>thead>tr>th {
	text-align: center;
}
</style>
<section class="py-5 border-bottom" id="features">
	<div class="container">
		<div class="row justify-content-center">
			<h2>리뷰 관리</h2>
		</div>
		<br>
		<div class="row justify-content-center">
			<p>게스트들이 남긴 리뷰에 답글을 남겨보세요 !</p>
		</div>
		<br> <br>
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
									<input type="hidden" id="house-id" value="${houseId}">
									<tr>
										<td id="review-id">${review.id}</td>
										<td>${review.guestId.username}</td>
										<td>⭐&nbsp;${review.starScore}</td>
										<td>${review.content}</td>
										<td>${review.creationDate}</td>
										<td>${not empty review.replies ? 'Y' : 'N'}</td>
										<td><a class="custom-sm-btn" data-toggle="modal" data-target="#replyModal" style="cursor: pointer;">답글 관리</a></td>
									</tr>

									<div class="modal" id="replyModal">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">

												<div class="modal-header">
													<h3 class="modal-body">${review.guestId.username}님의리뷰</h3>
													<h6>${review.creationDate}</h6>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<div class="modal-body">${review.content}</div>
												<hr>

												<div class="modal-body mb-5">
													<div class="card bg-light" style="padding: 20px;">
														<div class="card-body">
															<h4>호스트 댓글</h4>
															<form class="mb-5">
																<textarea class="form-control" rows="3" id="reply-edit-box" placeholder="게스트의 리뷰에 대한 답글을 남겨주세요!"></textarea>
															</form>
															<br>
															<div>
																<button type="button" id="btn-reply" class="custom-btn float-right">등록</button>
															</div>
															<br> <br>
															<c:forEach var="reply" items="${review.replies}">
																<input type="hidden" id="reply-id" value="${reply.id}">
																<div class="mb-4" id="reply--box">

																	<div class="d-flex">
																		<div class="ms-3">
																			<p>${reply.content}</p>
																			<button class="btn btn-outline-danger btn-sm float-right" style="margin-left: 10px;" id="btn-delete">삭제</button>
																			<button type="button" class="btn btn-outline-primary btn-sm float-right" id="edit-btn">수정</button>
																		</div>
																	</div>
																	<br>
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

						<ul class="pagination justify-content-center">

							<c:set var="isDisabled" value="disabled"></c:set>
							<c:set var="isAbled" value=""></c:set>
							<c:set var="isNowPage" value="active"></c:set>

							<li class="page-item ${reviews.first ? isDisabled : isAbled}"><a class="page-link" href="/review/management/${houseId}?page=${reviews.number - 1}">Prev</a></li>

							<c:forEach var="num" items="${pageNumbers}">
								<c:choose>
									<c:when test="${reviews.number + 1 eq num}">
										<li class="page-item active"><a class="page-link" href="/review/management/${houseId}?page=${num - 1}">${num}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="/review/management/${houseId}?page=${num - 1}">${num}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<li class="page-item ${reviews.last ? isDisabled : isAbled}"><a class="page-link" href="/review/management/${houseId}?page=${reviews.number + 1}">Next</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="/js/reply.js"></script>