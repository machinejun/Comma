<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="../layout/header.jsp" %>
<div class="section-container contact-container" >
	<div id="inputPage" class="container" style="background-color: rgba( 0, 0, 0, 0.05);">
		<div class="row" >
			<div class="col-xs-12 col-md-12" >
				<div id="page-container">					
					<div class="container">
					  <h2>Guest Table</h2>
					  <p>예약 정보 조회</p>
					  <table class="table table-bordered table-sm" >
					    <thead>
					      <tr>
					        <th>예약 번호</th>
					        <th>숙소명</th>
					        <th>checkIn/out</th>
					        <th>승인 여부</th>
					        <th style="text-align: center;">세부 사항 조회</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr >
					        <td>1</td>
					        <td>X-motel</td>
					        <td>2022-07-17 ~ 2022-07-19</td>
					        <td style="font-weight: bold;">WAITING</td>
					        <td style="text-align: center;"><button class="btn btn-secondary btn-sm" style="font-size: 10px; padding: 6px">상세조회</button></td>
					      </tr>					      
					    </tbody>
					  </table>
					</div>		
					<div>
					
					</div>
							
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
