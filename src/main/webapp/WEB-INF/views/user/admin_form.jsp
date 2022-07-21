<head><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="../layout/header.jsp" %></head>
<body>
<div class="section-container contact-container" >
	<div id="inputPage" class="container" style="background-color: rgba(255,149,149,0.7);">
		<div class="row" >
			<div class="col-xs-12 col-md-12" >
				<div id="page-container">
					<div class="jumbotron jumbotron-fluid" style="margin: 10px">
					  <div class="container">
					    <h1 class="display-4">관리자님 환영합니다.</h1>
					    <p class="lead">회원 리스트입니다. <br/>
					    
					    </p>
					    
					  </div>
					</div>	

								<div class="d-flex flex-row-reverse">
										<form class="form-inline" action="/user/search" method="get">
												  <input type="text" class="form-control" name="q" value="${searchUser}" placeholder="검색어를 입력해주세요" >
												  <button type="submit" class="btn btn-primary ml-2" id="btn-search">검색</button>
										</form>
								</div>
					
						 <div class="container">
						 		
						    <table class="table table-striped justify-content-center">
						        <thead>
						            <tr>
						                	<th scope="col">순번</th>
									      <th scope="col">가입일</th>
									      <th scope="col">email</th>
									      <th scope="col">전화번호</th>
									      <th scope="col">회원구분</th>
									      <th scope="col">username</th>
						            </tr>
						        </thead>
						        <tbody>
						            <c:choose>
						            		<c:when test="${1 > 0}">
						            					<tr>
										                    <td>${ user.id }</td>
										                    <td>${ user.creationDate }</td>
										                    <td>${ user.email }</td>
										                    <td>${ user.phoneNumber }</td>
										                    <td>${ user.role }</td>
										                    <td>${ user.username }</td>
										                </tr>
						            		</c:when>
						            		<c:otherwise>
						            				<c:forEach var="user" items="${ userList }">
										                <tr>
										                    <td>${ user.id }</td>
										                    <td>${ user.creationDate }</td>
										                    <td>${ user.email }</td>
										                    <td>${ user.phoneNumber }</td>
										                    <td>${ user.role }</td>
										                    <td>${ user.username }</td>
										                </tr>
										            </c:forEach>
						            		</c:otherwise>
						            </c:choose>
						        </tbody>
						    </table>
						</div>
				</div>
			</div>	
    	</div>
  	</div>
</div>

<!-- <script type="text/javascript" src="/js/user/user.js"></script></body> -->
</body>
</html>
