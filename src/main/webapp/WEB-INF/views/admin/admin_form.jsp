<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/css/house/list.css" rel="stylesheet">
<%@ include file="../layout/header.jsp"%>
<style>
.section-container {
	font-family: 'SUIT-Medium'
}

h2 {
	color: black;
}

h2::after {
	display: none;
}

th, td {
	text-align: center;
}
</style>
</head>
<body>
	<div class="section-container contact-container">
		<div id="inputPage" class="container" style="background-color: white;">
			<div class="row">
				<div class="col-xs-12 col-md-12">
					<div id="page-container">
						<div class="jumbotron jumbotron-fluid" style="margin: 10px; background-color: rgba(255, 149, 149, 0.05);">
							<div class="container">
								<h2>회원 관리</h2>
								<p style="font-size: 17px;">
									회원 정보와 신고 내역을 확인하세요.<br>신고 횟수가 5회 이상인 회원은 강제 탈퇴가 가능합니다.
								</p>

							</div>
						</div>

						<div class="d-flex flex-row-reverse">
							<form class="form-inline" action="/admin/user-management" method="get">
								<input type="text" class="form-control" style="margin: 10px; height: 40px;" name="q" value="${searchUser}" placeholder="회원 검색">
								<button type="submit" class="custom-sm-btn" id="btn-search" style="font-size: 17px; width: 80px; margin-right: 10px;">검색</button>
							</form>
						</div>

						<div class="container">
							<table class="table table-striped justify-content-center" style="width: 97%">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">회원명</th>
										<th scope="col">가입일</th>
										<th scope="col">이메일</th>
										<th scope="col">전화번호</th>
										<th scope="col">신고횟수</th>
										<th scope="col">회원관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${ users }">
										<c:if test="${user.role ne 'ADMIN'}">
											<tr>
												<td>${ user.id }</td>
												<td>${ user.username }</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${user.creationDate}" /></td>
												<td>${ user.email }</td>
												<td>${ user.phoneNumber }</td>
												<td>${ user.reportCount }</td>
												<c:choose>
													<c:when test="${user.reportCount > 4}">
														<td onclick="index.deleteById(${user.id})" style="font-size: 16px; color: red; cursor: pointer;">삭제</td>
													</c:when>
													<c:otherwise>
														<td></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:if>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/js/user/admin.js"></script>
	<%@ include file="../layout/footer.jsp"%>