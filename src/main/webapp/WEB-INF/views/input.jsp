<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="layout/header.jsp" %>
<style>
	.section-container{
		font-family: 'SUIT-Medium';
		
	}
	.text-center > h2 {
		color: rgba(255,149,149,0.7);
		font-family: 'SUIT-Medium'; 	
	}
	.text-center > h2::after {
		display: none;
		color: white;	
	}
	.col-md-7 {
		padding-left: 0px;
		padding-right: 0px;
	}
	.card {
		background-color: rgba(255, 255, 255, 0.9);
		height: 480px;
		width: 900px;
	}
	.ui-datepicker-title{
		color: rgba(255,149,149,0.7);
	}
	#bookingDate{
		color: #838383;
	}
	.custom-sm-btn {
		background-color: rgba(255,149,149,0.9);
		margin-top: 270px;
		margin-left: 165px;
		width: 100px;
		font-size: 15px;
	}
	@media (max-width: 1200px) {
		.custom-sm-btn{
			margin-left: 120px;
		}
	} 
	
	.custom-sm-btn:hover {
		background-color: rgba(255,149,149,1);;
	}
	
	span {
		color: rgba(255,149,149,0.7);
	}
	#check-default-btn{
		margin-top: 20px;
	}
	#write-calender{
		padding-left: 270px;
	}
	.text-center > p > span {
		font-size: 30px;
		text-decoration: underline;
	}
	.form-control:focus {
    	border-color: rgba(255,149,149,0.7);
    	outline: 0;
    	box-shadow: 0 0 10px rgba(255,149,149,0.5);
	}
	

</style>

<input id="oneDayPrice" type="hidden" value="${house.oneDayPrice}">
<input id="capacity" type="hidden" value="${house.capacity}">
<input id="size" value="${size}" type="hidden" />
<c:forEach var="date" items="${bookedDates}">
	<input id="date-${date.index}" value="${date.date}" type="hidden" />
</c:forEach>
<div class="section-container contact-container">
    <div id="inputPage" class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
        
          <div class="section-container-spacer">
          	<div class="text-center">
          		<h2 >예약 요청</h2>
            	<p><span>${house.name}</span>&nbsp; 예약하기</p>
          	</div>       
          </div>
          
          <div class="card-container">
            <div class="card card-shadow col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 reveal">
              <form action="" class="reveal-content">
                <div class="row">
                  <div class="col-md-7">
                    <ul class="list-group">
					  <li  class="list-group-item d-flex justify-content-between align-items-center">
					    <p id="booker" class="align-items-center" style="transform: translate(0%,30%);">예약자 : ${principal.user.username}</p>				   
					   				   
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-center">					  	
					    <p id="count" class="align-items-center" style="transform: translate(0%,30%);">인원 수 : 1</p> 
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
					  	<input type="hidden" id="price"/>
					    <p id="showPrice" class="align-items-center" style="transform: translate(0%,30%);">가격: 0￦</p>				   
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
                    <ul class="address-container">
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

                    <button onclick="reserveHouse(${principal.user.id},${house.hostId.id},${house.id})" class="custom-sm-btn">예약하기</button>
                  </div>
                </div>
              </form>
            </div>
            <div class="card-image col-xs-12" style="
             background-repeat: no-repeat;
  			 background-position: center;
 		     background-size: cover;
             background-image: url('https://cdn.pixabay.com/photo/2016/08/26/15/06/home-1622401_960_720.jpg');">
            </div>
          </div>
        </div>  
      </div>
    </div>
 </div>

 	
 <div class="detail">
 	<div id="check-table" >
 		<a id="check-default-btn" class="m-2" type="button"><span class="icon-times-circle-o"></span></a>

		<ul id="check-table-ul" class="list-group">
			<li class="list-group-item list-group-item-action">Checkin: <input type="date" id="checkIn-Date" style="width: 120px"/></li>
			<li class="list-group-item list-group-item-action">CheckOut: <input type="date"  id="checkOut-Date" style="width: 120px"/></li>
		</ul>

		<a id="write-calender" onclick="inputCalender()" type="btn"><span class="icon-pencil-square"></span></a>	    
	</div>	
 </div>
 

<script src="/js/reservation/reservation.js"></script>
<%@ include file="layout/footer.jsp" %>