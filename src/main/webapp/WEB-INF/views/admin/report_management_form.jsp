<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">
<style>
.custom-img {
	border-radius: 20px;
}

.custom-sm-btn {
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
	background-color: white;
}
</style>

<div class="container">
	<div class="p-4 p-lg-5 rounded-3 text-center" id="title"
		style="background-color: rgba(255, 149, 149, 0.05);">
		<input type="hidden" id="guest-id" value="${principal.user.id}">
		<div class="m-4 m-lg-5">
			<h2>회원 신고 관리</h2><br>
			<p>회원의 신고 내역을 확인하고 승인 및 취소할 수 있습니다.<br>
			신고된 회원은 신고 횟수에 따라 사이트의 기능이 제한됩니다.</p>
		</div>
	</div>
	<br />

	<div class="container">
		<br />
		<table class="table">
			<thead>
				<tr>
					<th class="text-center">신고 번호</th>
					<th class="text-center">신고 일자</th>
					<th class="text-center">신고 회원</th>
					<th class="text-center">신고 유형</th>
					<th class="text-center">상세 사유 및 설명</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="report" items="${reports}">
					<input type="hidden" value="${report.id}" id="review-id">
					<tr>
						<td class="text-center">${report.id}</td>
						<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd"
								value="${report.creationDate}" /></td>
						<td class="text-center">${report.respondent.username}</td>
						<td class="text-center">${report.reportType}</td>
						<td class="text-center"><a data-toggle="modal"
							data-target="#report-modal-${report.id}" style="cursor: pointer;"><i
								class="bi bi-search"></i></a></td>
					</tr>

					<div class="modal" id="report-modal-${report.id}" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<input type="hidden" value="${reply.id}" id="reply-id">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" id="close" class="close"
										data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<div class="modal-body">
									<div>
										<c:choose>
											<c:when test="${empty report.replyId}">
												<div class="col-12">
													<h4>상세 사유 및 설명</h4>
													<textarea id="detail-text" style="height: 250px;"
														class="form-control" disabled>${report.reviewId.content}</textarea>
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-12">
													<div class="form-group">
														<h4>
															<b>상세 사유 및 설명</b>
														</h4>
														<textarea id="detail-text" style="height: 250px;"
															class="form-control" disabled>${report.replyId.content}</textarea>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</tbody>
		</table>
	</div>
</div>

<br>
<script src="/js/review.js"></script>
<script type="text/javascript" src="/js/home.js"></script>