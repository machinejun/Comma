<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="layout/header.jsp" %>
<input id="size" value="${size}" type="hidden" />
<c:forEach var="date" items="${bookedDates}">
	<input id="date-${date.index}" value="${date.date}" type="hidden"" />
</c:forEach>
<div class="section-container contact-container">
    <div id="inputPage" class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
          <div class="section-container-spacer">
            <h2 class="text-center">예약 요청</h2>
            <p class="text-center">(${house.name}) 예약하기</p>
            
          </div>
          <div class="card-container">
            <div class="card card-shadow col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 reveal">
              <form action="" class="reveal-content">
                <div class="row">
                  <div class="col-md-7">
                    <ul class="list-group">
					  <li  class="list-group-item d-flex justify-content-between align-items-center">
					    <p id="booker" class="align-items-center" style="transform: translate(0%,30%);">예약자 : ${pricipal.username}</p>				   
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-center">					  	
					    <p id="count" class="align-items-center" style="transform: translate(0%,30%);">인원수 : 1</p> 
						 <div style="transform: translate(0%,10%);">
						    <a id="count-minus" type="button" class="m-1"><span class="icon-minus-circle"></span></a>			    
						    <a id="count-plus" type="button" class="m-1"><span class="icon-plus-circle"></span></a>							    
						 </div>
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-center">
					    <p  class="align-items-center" style="transform: translate(0%,30%);">예약일: <span id="bookingDate" style="font-size: 15px"> </span> </p> 
						<div>   
						    <a id="calender-btn" type="button" onclick="startModal()" class="m-1"><span class="icon-calendar-o"></span></a>
						    					    
						</div>
					  </li>
					  <li  class="list-group-item d-flex justify-content-between align-items-center">
					  	<input id="oneDayPrice" type="hidden" value="${house.oneDayPrice}">
					    <p id="showPrice" class="align-items-center" style="transform: translate(0%,30%);">가격: 원</p>				   
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-center">요청사항
					   	<div class="form-group">
                      		<textarea id="request" style="margin-top: 10px" class="form-control" rows="3" placeholder="Enter your message"></textarea>
                    	</div>
					  </li>
					</ul>
					<!-- 
					<div class="form-group" style="font-size: 19px; font-weight: bold">
                      checkIn: <input class="form-control" type="text" id="checkinDate" style="width: 90px; display: inline; font-size: 15px; padding: 2px;"/> ~
                      checkOut: <input class="form-control" type="text" id="checkoutDate" style="width: 90px; display: inline; font-size: 15px; padding: 2px;"/>
                    </div>
					 -->    
                  </div>
                  <div class="col-md-5">
                    <ul class="list-unstyled address-container">
                      <li>
                        <span class="fa-icon">
                          <i class="fa fa-phone" aria-hidden="true"></i>
                        </span>
                        ${house.hostId.phoneNumber}
                      </li>
                      <li>
                        <span class="fa-icon">
                          <i class="fa fa fa-map-o" aria-hidden="true"></i>
                        </span>
                        ${house.address}
                      </li>
                    </ul>
                    <button onclick="reserveHouse(${house.hostId.id},${house.id})" class="btn btn-primary float-right float-bottom">예약하기</button>
                  </div>
                </div>
              </form>
            </div>
            <div class="card-image col-xs-12" style="background-image: url('/assets/images/img-01.jpg')">
            </div>
          </div>
        </div>  
      </div>
    </div>
 </div>

 	
 <div class="detail">
 	<div id="check-table" >
 		<a id="check-default-btn" class="m-2" type="button"><span class="icon-times-circle-o"></span></a>

		<ul class="list-group">
			<li class="list-group-item list-group-item-action">Checkin: <input type="date" id="checkIn-Date" style="width: 120px"/></li>
			<li class="list-group-item list-group-item-action">CheckOut: <input type="date"  id="checkOut-Date" style="width: 120px"/></li>
		</ul>

		<a id="write-calender" onclick="inputCalender()" class="float-right m-2" type="btn"><span class="icon-pencil-square"></span></a>	    
	</div>	
 </div>
 

<script src="/js/reservation/reservation.js"></script>
<%@ include file="layout/footer.jsp" %>