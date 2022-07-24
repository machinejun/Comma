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
</style>

<div class="container">
	<div class="p-4 p-lg-5 bg-light rounded-3 text-center">
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

	<c:forEach var="review" items="${reviews}">
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
					<a class="btn btn-outline-primary btn-sm"
						href="/review/update_form/${review.id}">수정</a>
					<button class="btn btn-outline-danger btn-sm" id="btn-delete">삭제</button>
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
		<div class="container bg-light">
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
<%@ include file="../layout/footer.jsp"%>
<script src="/js/review.js"></script>