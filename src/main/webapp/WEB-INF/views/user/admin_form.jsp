<head><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="../layout/header.jsp" %>
<style>
.section-container{
	font-family: 'SUIT-Medium'
}

h2 {
	color: rgba(255,149,149,0.7);
}
h2::after {
	color: rgba(255,149,149,0.7);
}
</style>
</head>
<body>
<div class="section-container contact-container" >
	<div id="inputPage" class="container" style="background-color: white;">
		<div class="row" >
			<div class="col-xs-12 col-md-12" >
				<div id="page-container">
					<div class="jumbotron jumbotron-fluid" style="margin: 10px">
					  <div class="container">
					    <h2 style="font-family: SUIT-Medium;">관리자님 환영합니다.</h2>
					    <p class="lead">회원 리스트입니다. <br/>
					    
					    </p>
					    
					  </div>
					</div>	

								<div class="d-flex flex-row-reverse">
										
										<form class="form-inline"  action="/user/searchUsername" method="get">
<<<<<<< HEAD
													<select name="role" style="width: 130px; height: 40px; margin: 10px; margin-top: 12px; border-radius: 5px">
=======
													<select name="role" style="width: 130px; height: 40px; margin: 10px; margin-top: 12px; border-radius: 10px;">
>>>>>>> 8186c74defe72093a46e137bf42b95729b152a11
														<option value="">전체</option>
														<option value="guest">GUEST</option>
														<option value="host">HOST</option>
													</select>
												  <input type="text" class="form-control" style="margin: 10px" name="q" value="${searchUser}" placeholder="검색어를 입력하세요" >
												  <button  type="submit" class="custom-sm-btn" id="btn-search" style="font-size: 20px">검색</button>
												  
											
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
									      <th scope="col">예약 / 숙소정보</th>
						            </tr>
						        </thead>
						        <tbody>
						             		<c:forEach var="user" items="${ users }">
									                <tr>
									                    <td>${ user.id }</td>
									                    <td>${ user.creationDate }</td>
									                    <td>${ user.email }</td>
									                    <td>${ user.phoneNumber }</td>
									                    <td>${ user.role }</td>
									                    <td>${ user.username }</td>
									                    <c:if test= "${user.role eq 'GUEST' }">
<<<<<<< HEAD
									                    <td><button type="submit" class="custom-sm-btn" onclick="location.href='/reserveTable/user';" style="font-size: 17px">예약확인</button></td>
									                    </c:if>
									                    <c:if test= "${user.role eq 'HOST' }">
									                    <td><button type="submit" class="custom-sm-btn" onclick="location.href='/house/management';" style="font-size: 17px">숙소정보</button></td>
=======
									                    <td><button type="submit" onclick="location.href='/reserveTable/user';" class="custom-sm-btn" style="font-size: 17px">예약확인</button></td>
									                    </c:if>
									                    <c:if test= "${user.role eq 'HOST' }">
									                    <td><button type="submit" onclick="location.href='/house/management';" class="custom-sm-btn"  style="font-size: 17px">숙소정보</button></td>
>>>>>>> 8186c74defe72093a46e137bf42b95729b152a11
									                    </c:if>
									                </tr>
									         </c:forEach>						  
						        </tbody>
						    </table>
						</div>
				</div>
			</div>	
    	</div>
  	</div>
</div>


</body>
</html>
<%@ include file="../layout/footer.jsp" %>