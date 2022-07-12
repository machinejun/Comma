<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="../layout/header.jsp" %>
<div class="section-container contact-container" >
	<div id="inputPage" class="container" style="background-color: rgba( 0, 0, 0, 0.05);">
		<div class="row" >
			<div class="col-xs-12 col-md-12" >
				<div>
					<div class="jumbotron jumbotron-fluid" style="margin: 10px">
					  <div class="container">
					    <h1 class="display-4">(HostName)님 안녕하세요!!!</h1>
					    <p class="lead">저희 사이트를 이용해주셔서 감사합니다. <br/>
					    저희 사이트의 이용료는 30만원입니다.
					    </p>
					  </div>
					</div>
					<h4>House1</h4>
					<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">예약자</th>
						      <th scope="col">인원 수</th>
						      <th scope="col">예약 일</th>
						      <th scope="col">휴대폰 번호</th>
						      <th scope="col">요청 사항</th>
						      <th scope="col">상태</th>
						      <th scope="col">취소</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">guest0</th>
						      <td>3</td>
						      <td>2022-07-12 ~ 2022-07-14</td>
						      <td>010-0000-0000</td>
						      <td><!-- 아이디 값을 다 넣어주어야 한다. -->
						      	<a onclick="showDetail()" class="icon-search-plus" type="btn"></a>
						      	<div id="request-detail-0" style="display: none;">
						      		<p>요청사항에 대해서 서술하는 부분입니다.<p> 
						      	</div>
						      </td>   
						      <td><span style="font-weight: bold;">WAITING<span>&nbsp;&nbsp;</span><button onclick="approve()" id="approve" class="btn btn-success" style="padding: 4px; font-size: 10px;">승인</button></td>   
						      <td><button onclick="cancel()" class="btn btn-danger" style="padding: 4px; font-size: 10px;">취소</button></td>   
						    </tr>
						    <tr>
						      <th scope="row">guest0</th>
						      <td>3</td>
						      <td>2022-07-12 ~ 2022-07-14</td>
						      <td>010-0000-0000</td>
						      <td><!-- 아이디 값을 다 넣어주어야 한다. -->
						      	<a onclick="showDetail()" class="icon-search-plus" type="btn"></a>
						      	<div id="request-detail-0" style="display: none;">
						      		<p>요청사항에 대해서 서술하는 부분입니다.<p> 
						      	</div>
						      </td>   
						      <td><span style="font-weight: bold;">WAITING<span>&nbsp;&nbsp;</span><button onclick="approve()" id="approve" class="btn btn-success" style="padding: 4px; font-size: 10px;">승인</button></td>   
						      <td><button onclick="cancel()" class="btn btn-danger" style="padding: 4px; font-size: 10px;">취소</button></td>   
						    </tr>
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
