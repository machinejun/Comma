<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="../layout/header.jsp" %>
<div class="section-container contact-container" >
	<div id="inputPage" class="container" style="background-color: rgba( 0, 0, 0, 0.05);">
		<div class="row" >
			<div class="col-xs-12 col-md-12" >
				<div id="page-container">
					<div class="jumbotron jumbotron-fluid" style="margin: 10px">
					  <div class="container">
					    <h1 class="display-4">관리자님 환영합니다.</h1>
					    <p class="lead">관리자 페이지입니다. <br/>
					    
					    </p>
					    
					  </div>
					</div>	
						<h4>회원 List</h4>
						<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">순번</th>
							      <th scope="col">가입일</th>
							      <th scope="col">email</th>
							      <th scope="col">전화번호</th>
							      <th scope="col">자격</th>
							      <th scope="col">username</th>
							      <th scope="col">소셜회원</th>
							    </tr>
							  </thead>
							  <tbody id="table-body">
									<c:forEach var="user" items="${user.id}">
										<input type="hidden" id="user-id" value="${user.id}">
										<tr>
												<td>${user.id}</td>
												<td>${user.creationDate}</td>
												<td>${user.email}</td>
												<td>${user.phoneNumber}</td>
												<td>${user.role}</td>
												<td>${user.username}</td>
												<td>${user.oauth}</td>
										</tr>
									</c:forEach>
									
							  </tbody>
						</table>		
				</div>
			</div>	
    	</div>
  	</div>
</div>

<script type="text/javascript" src="/js/main.0cf8b554.js"></script></body>
<script type="text/javascript" src="/js/home.js"></script></body>
<script type="text/javascript" src="/js/reservation/hostReserveTable.js"></script></body>
</body>
</html>
