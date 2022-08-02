<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">
<style>
.table>tbody>tr>td, .table>thead>tr>th {
	text-align: center;
}

.custom-report-btn {
	font-family: 'SUIT-Medium';
	font-size: 17px;
	line-height: 1.5;
	color: #fff;
	text-transform: uppercase;
	border: none;
	width: 100px;
	height: 40px;
	border-radius: 5px;
	background: rgba(255, 149, 149, 0.7);
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0 20px;
}

.custom-report-btn:hover {
	background: rgba(255, 149, 149, 1);
}

.custom-sm-btn {
	padding: 0px;
	margin-left: 420px;
	width: 80px;
	height: 30px;
}

.custom-sm-btn:hover {
	text-decoration: none;
}

div {
	font-family: 'SUIT-Medium';
}

#title {
	border-radius: 10px;
	background-color: white;
}
</style>
<div class="py-5" id="features">
	<div id="title" class="container" style="background-color: rgba(255, 149, 149, 0.05);">
		<div class="row justify-content-center">
			<h2 style="font-family:">리뷰 관리</h2>
		</div>
		<br>
		<c:choose>
			<c:when test="${reviewCount eq 0}">
				<div class="row justify-content-center">
					<p>아직 등록된 리뷰가 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row justify-content-center">
					<p>게스트들이 남긴 리뷰에 답글을 남겨보세요 !</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<br> <br>
	<div class="container">
		<input type="hidden" value="${houseId}" id="house-id">
		<c:forEach var="review" items="${reviews.content}">
			<input type="hidden" value="${review.id}" id="review-id">
			<div class="col-xl">
				<div class="row">
					<a href="/house/detail/${review.houseId.id}"><img class="col" src="http://localhost:9090/upload/${review.houseId.image.imageUrl}" style="width: 150px; height: 100px; object-fit: cover;"></a>
					<div>
						<div class="col">
							<p>게스트 ID : ${review.guestId.username}</p>
						</div>
						<p class="col">
							작성일 :
							<fmt:formatDate pattern="yyyy-MM-dd" value="${review.creationDate}" />
						</p>
					</div>
					<div class="float-right">
						<a data-toggle="modal" data-target="#report-modal-${review.id}" style="color: red; margin-left: 700px; cursor: pointer;">신고</a>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="star-ratings" style="margin-left: 10px;">
						<div class="star-ratings-fill" style="width: ${review.starScore * 20 * 1.4}%">
							<span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span>
						</div>
						<div class="star-ratings-base">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
					</div>
				</div>
				<br>
				<div>${review.content}</div>
			</div>

			<!-- 신고 모달 -->
			<div class="modal" id="report-modal-${review.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<input type="hidden" value="${review.id}" id="review-id">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h3 class="modal-title" id="exampleModalLabel">리뷰 신고</h3>
							<button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<form action="/host/report/${review.id}" method="post"></form>
						<div class="modal-body">
							<div class="row">
								<div class="col-6">
									<div class="form-group">
										<label>리뷰 ID : ${review.id}</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<label>신고 사유</label>
										<textarea id="reason" placeholder="호스트의 불쾌한 댓글, 비방, 욕설 등의 신고 사유를 입력해주세요." style="height: 300px;" class="form-control"></textarea>
									</div>
								</div>
							</div>
						</div>

						<div class="modal-footer">
							<button type="submit" id="btn-report-review" class="custom-report-btn" >신고하기</button>
						</div>
					</div>
				</div>
			</div>

			<br>
			<div id="title" class="container">
				<h4>호스트 답글 남기기</h4>
				<br>
				<form class="mb-5">
					<textarea class="form-control" rows="3" id="reply-content-${review.id}" placeholder="게스트의 리뷰에 대한 답글을 남겨주세요!"></textarea>
				</form>
				<div>
					<button type="button" id="btn-save-reply" class="custom-sm-btn float-right" onclick="index.addReply(${review.id})">등록</button>
				</div>
				<br> <br>
				<!-- 댓글 목록 -->
				<ul class="list-group" id="reply-list-${review.id}">
					<c:forEach var="reply" items="${review.replies}">
						<li class="list-group-item d-flex justify-content-between" id="reply--${reply.id}">
							<div>${reply.content}</div>
							<div class="d-flex">
								<a class="host-review-update" onclick="index.editText('${reply.id}', '${reply.content}', '${review.id}');" style="cursor: pointer; color: rgb(17, 56, 147)">수정</a> &nbsp;&nbsp; <a class="host-review-delete" style="color: red"
									onclick="index.deleteReply(${reply.id});" style="cursor: pointer; color: rgb(203, 0, 0);">삭제</a>
							</div>
						</li>
					</c:forEach>
				</ul>

			</div>
			<hr class="end-line">
			<br>
		</c:forEach>
	</div>
</div>
<br>

<div class="container justify-content-center" style="margin-left: 45%">
	<c:if test="${reviewCount ne 0}">
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
	</c:if>
</div>


<script src="/js/reply.js"></script>
<script type="text/javascript" src="/js/home.js"></script>