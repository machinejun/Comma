<head><%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
 -->
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
						<div class="jumbotron jumbotron-fluid" style="margin: 10px">
							<div class="container">
								<h2>회원 관리</h2>
								<p class="lead">
									회원 정보와 신고 내역을 확인하세요.<br>신고 횟수가 5회 이상인 회원은 탈퇴시킬 수 있습니다.
								</p>

							</div>
						</div>

						<div class="d-flex flex-row-reverse">

							<form class="form-inline" action="/admin_form" method="get">
								<input type="text" class="form-control"
									style="margin: 10px; height: 40px;" name="q"
									value="${searchUser}" placeholder="회원 검색">
								<button type="submit" class="custom-sm-btn" id="btn-search"
									style="font-size: 17px">검색</button>
							</form>
						</div>

						<div class="container">
							<table class="table table-striped justify-content-center">
								<thead>
									<tr>
										<th scope="col">ID</th>
										<th scope="col">username</th>
										<th scope="col">가입일</th>
										<th scope="col">email</th>
										<th scope="col">전화번호</th>
										<th scope="col">회원구분</th>
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
												<td>${ user.creationDate }</td>
												<td>${ user.email }</td>
												<td>${ user.phoneNumber }</td>
												<td>${ user.role }</td>
												<td>${ user.reportCount }</td>
												<td><c:if test="${user.reportCount > 4}">

														<button type="button"
															onclick="location.href='delete/${user.id}';"
															class="custom-sm-btn" id="btn-delete"
															style="font-size: 17px">삭제</button>
													</c:if></td>
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