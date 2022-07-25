<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">
<style>
.custom-img {
	border-radius: 20px;
}

.custom-btn {
	font-family: 'SUIT-Medium';
	font-size: 20px;
	line-height: 1.5;
	color: #fff;
	text-transform: uppercase;
	border: none;
	width: 150px;
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

.custom-btn:hover {
	background: rgba(255, 149, 149, 1);
}

.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	margin-left: 10px;
	width: max-content;
	-webkit-text-fill-color: transparent; /* 덮어써지는 색깔 */
	-webkit-text-stroke-color: #2b2a29;
	justify-content: center;
	width: max-content;
}

.star-ratings-fill {
	color: #ffc107;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: #ffc107;
}

.end-line {
	border: 0;
	height: 2px;
	background: #ccc;
}

div {
	font-family: 'SUIT-Medium';
}

#title {
	background-color: rgba(255, 149, 149, 0.05);
}
</style>

<div class="container">
	<div class="p-4 p-lg-5 rounded-3 text-center" id="title">
		<input type="hidden" id="guest-id" value="${principal.user.id}">
		<div class="m-4 m-lg-5">
			<c:choose>
				<c:when test="${empty reviews}">
					<h2 class="display-5 fw-bold">작성한 리뷰가 없습니다.</h2>
					<br>
				</c:when>
				<c:otherwise>
					<h2>나의 리뷰 목록</h2>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div></div>
	<br>

	<c:forEach var="review" items="${reviews.content}">
		<input type="hidden" value="${review.id}" id="review-id">
		<div class="col-xl">
			<div class="row">
				<a href="/house/detail/${review.houseId.id}"><img class="col"
					src="http://localhost:9090/upload/${review.houseId.image.imageUrl}"
					style="width: 150px; height: 100px;"></a>
				<div>
					<div class="col">
						작성일 :
						<fmt:formatDate pattern="yyyy-MM-dd"
							value="${review.creationDate}" />
					</div>
					<div class="col">
						<p>숙소명 : ${review.houseId.name}</p>
					</div>

				</div>
				<div class="col" style="position: absolute; left: 85%;">
					<a href="/review/update_form/${review.id}" style="margin-right: 10px;">수정</a>
					<a id="btn-delete" onclick="index.deleteReview(${review.id})" style="color: red">삭제</a>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="star-ratings">
					<div class="star-ratings-fill"
						style="width: ${review.starScore * 20 * 1.4}%">
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
		<br>
		<div class="container" id="title">
			<c:if test="${not empty review.replies}">
				<h4>호스트의 답글</h4>
			</c:if>
			<!-- 댓글 목록 -->
			<ul class="list-group" id="reply-list-${review.id}">
				<c:forEach var="reply" items="${review.replies}">
					<li class="list-group-item d-flex justify-content-between"
						id="reply--${reply.id}">
						<div>${reply.content}</div>
						<div class="d-flex">
							<div>
								작성일:
								<fmt:formatDate pattern="yyyy-MM-dd"
									value="${reply.creationDate}" />
								&nbsp;&nbsp;
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>

		</div>
		<hr class="end-line">
		<br>
	</c:forEach>

</div>
<br>
<div class="container justify-content-center" style="margin-left: 47%">
	<c:if test="${not empty reviews}">
		<ul class="pagination justify-content-center">

			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isAbled" value=""></c:set>
			<c:set var="isNowPage" value="active"></c:set>

			<li class="page-item ${reviews.first ? isDisabled : isAbled}"><a
				class="page-link"
				href="/review/my-review-list/${principal.user.id}?page=${reviews.number - 1}">Prev</a></li>

			<c:forEach var="num" items="${pageNumbers}">
				<c:choose>
					<c:when test="${reviews.number + 1 eq num}">
						<li class="page-item active"><a class="page-link"
							href="/review/my-review-list/${principal.user.id}?page=${num - 1}">${num}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="/review/my-review-list/${principal.user.id}?page=${num - 1}">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item ${reviews.last ? isDisabled : isAbled}"><a
				class="page-link"
				href="/review/my-review-list/${principal.user.id}?page=${reviews.number + 1}">Next</a></li>

		</ul>
	</c:if>
</div>

<br>
<%@ include file="../layout/footer.jsp"%>
<script src="/js/review.js"></script>