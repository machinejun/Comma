<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../css/reservationStyle/reservationStyle.css" rel="stylesheet">
<%@ include file="layout/header.jsp" %>
<div class="section-container contact-container">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
          <div class="section-container-spacer">
            <h2 class="text-center">예약 요청</h2>
            <p class="text-center">(숙소 이름) 예약하기</p>
          </div>
          <div class="card-container">
            <div class="card card-shadow col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 reveal">
              <form action="" class="reveal-content">
                <div class="row">
                  <div class="col-md-7">
                    <ul class="list-group">
					  <li  class="list-group-item d-flex justify-content-between align-items-center">
					    <p id="count" class="align-items-center" style="transform: translate(0%,30%);">예약자 : XXX</p>				   
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-center">					  	
					    <p id="count" class="align-items-center" style="transform: translate(0%,30%);">인원수 : 0</p> 
						 <div style="transform: translate(0%,10%);">
						    <a id="count-minus" type="button" class="m-1"><span class="icon-minus-circle"></span></a>			    
						    <a id="count-plus" type="button" class="m-1"><span class="icon-plus-circle"></span></a>							    
						 </div>
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-center">
					    <p id="bookingDate" class="align-items-center" style="transform: translate(0%,30%);">예약일 : </p> 
						<div>   
						    <a id="calender-btn" type="button" class="m-1"><span class="icon-calendar-o"></span></a>
						    <div id="check-table" 
						    style="font-size: 20px; position: fixed; z-index:3; left: 50%; top: 43%; border: 1px solid; background-color: white;">
							    <ul class="list-group list-group-flush">
								  <li class="list-group-item">Checkin: <input type="date" id="checkinDate" style="width: 120px"/></li>
								  <li class="list-group-item">CheckOut: <input type="date"  id="checkOutDate" style="width: 120px" type=""/></li>
								</ul>
								<a id="write-calender" onclick="inputCalender()" class="float-right m-2" type="btn"><span class="icon-pencil-square"></span></a>	    
						    </div>						    
						</div>
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-center">요청사항
					   	<div class="form-group">
                      		<textarea style="margin-top: 10px" class="form-control" rows="3" placeholder="Enter your message"></textarea>
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
                        + 33 9 07 45 12 65
                      </li>
                      <li>
                        <span class="fa-icon">
                          <i class="fa fa fa-map-o" aria-hidden="true"></i>
                        </span>
                        42 rue Moulbert 75016 Paris
                      </li>
                    </ul>
                    <button type="submit" class="btn btn-primary float-right float-bottom">Send message</button>
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
 
 

<script src="../js/reservation/reservation.js"></script>
<script type="text/javascript" src="../js/main.0cf8b554.js"></script></body>
<script type="text/javascript" src="../js/home.js"></script></body>
<%@ include file="layout/footer.jsp" %>