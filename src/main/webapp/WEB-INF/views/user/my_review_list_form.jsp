<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/review/style.css">
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="row justify-content-center">
		<h3>
			<b>📝 내가 작성한 리뷰</b>
		</h3>
	</div>
	<br>
	<div class="col-lg-8">
		<div class="row">

			<div class="table">
				<table class="table custom-table justify-content-center">
					<thead>
						<tr>
							<th>No</th>
							<th>평점</th>
							<th>내용</th>
							<th>작성일</th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${reviews}">
							<input type="hidden" id="house-id" value="${review.houseId.id}">
							<tr>
								<th scope="row" id="review-id">${review.id}</th>
								<td>⭐&nbsp;${review.starScore}</td>
								<td>${review.content}</td>
								<td>${review.creationDate}</td>
								<td><a class="btn btn-primary-outline" data-toggle="modal" data-target="#replyModal" style="cursor: pointer;">리뷰 관리</a></td>
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

										<div class="modal-footer">
											<button class="btn btn-outline-danger btn-sm float-right" style="margin-left: 10px;" id="btn-delete">삭제</button>
											<a class="btn btn-outline-primary btn-sm float-right" id="btn-update" href="/review/update_form/${review.id}">수정</a>
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
<%@ include file="../layout/footer.jsp"%>