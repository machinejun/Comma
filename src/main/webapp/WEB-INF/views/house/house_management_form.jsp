<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">
<style>
.custom-img {
	border-radius: 10px;
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
	text-decoration: none;
	color: white;
}

.end-line {
	border: 0;
	height: 1px;
	background: #ccc;
}
</style>

<div class="container">
	<div class="p-4 p-lg-5 bg-light rounded-3 text-center">
		<div class="m-4 m-lg-5">
			<c:choose>
				<c:when test="${empty houseList}">
					<h2 class="display-5 fw-bold">등록된 숙소가 없습니다.</h2>
					<br>
				</c:when>
				<c:otherwise>
					<h2>나의 숙소 목록</h2>
				</c:otherwise>
			</c:choose>
			<br>
			<div style="position: absolute; left: 46%">
				<a class="custom-btn" href="/house/post_form">숙소 등록하기</a>
			</div>
			<br>
		</div>
	</div>
	<div></div>
	<br> <br>

	<div class="container">
		<c:forEach var="house" items="${houseList}">
			<div class="col-xl">
				<div class="row">
					<a data-toggle="modal" data-target="#info-modal"
						style="cursor: pointer;"> <img class="custom-img"
						src="http://localhost:9090/upload/${house.image.imageUrl}"
						style="width: 200px; height: 200px;"></a>
					<div style="margin-left: 10px;">
						<div class="col">
							<h3>${house.name}</h3>
						</div>
						<br>
						<p class="col">
							등록일 :
							<fmt:formatDate pattern="yyyy-MM-dd"
								value="${house.creationDate}" />
						</p>
					</div>
					<div class="col" style="position: absolute; bottom: 5%; left: 18%">
						<a class="btn btn-outline-primary btn-sm"
							href="/house/update_form/${house.id}">수정</a>
						<button class="btn btn-outline-primary btn-sm" id="btn-delete">삭제</button>
						<a class="btn btn-outline-primary btn-sm "
							href="/review/management/${house.id}">리뷰 관리</a>
					</div>
				</div>

			</div>
			<hr class="end-line">
		</c:forEach>
	</div>
	<br> <br>

	<div class="modal fade" id="info-modal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
				</div>

				<div class="modal-body">Modal body..</div>
			</div>
		</div>
	</div>
</div>
<script src="/js/review.js"></script>
<%@ include file="../layout/footer.jsp"%>