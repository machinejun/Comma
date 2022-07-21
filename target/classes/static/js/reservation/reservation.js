/*
let userid = $("meta[name='userid']").attr("id");
let hostid = $("meta[name='hostid']").attr("id");
let houseid = $("meta[name='houseid']").attr("id");
*/
let bookedDays= [];
let maxCount = 1;
let count= 1;
let istableShow = 0;
let inputStatus = 0;

addListDates();
setMaxCount();

// 화면 이벤트
$( function(){
	
	$("#count-minus").bind("click",() => {
		if(count == 1){
			AlertMessage("최소 인원 오류",`인원은 1명 이상이어야만 합니다`,"error");
			return;
		}
		count--;
		calculatePrice()
		$("#count").text("인원수 : " + count);
		
	})
	
	$("#count-plus").bind("click",() => {
		if(count == maxCount){
			AlertMessage("최대 인원 초과",`현재 숙소의 최대 인원은 ${maxCount}명 입니다.`,"error");
			return;
		}
		count++;
		calculatePrice()
		$("#count").text("인원수 : " + count);
	})
	
	$("#check-default-btn").bind("click", () => {
		closeModal();
		$("#checkIn-Date").val("");
		$("#checkOut-Date").val("");
	})
	
});

function startModal(){
	if(istableShow == 0){
		showModal();
		console.log(bookedDays);
	}else{
		closeModal();
	}
}

function showModal(){
	istableShow = 1;
	disableScrolling();
	$(".detail").fadeIn();
	$("#isNaviFocus").attr('value',1);
}

function closeModal(){
	$(".detail").fadeOut();
	istableShow = 0;
	enableScrolling()
	$("#isNaviFocus").attr('value',0);
}

function disableScrolling(){
    var x=window.scrollX;
    var y=window.scrollY;
    window.onscroll=function(){window.scrollTo(x, y);};
}

function enableScrolling(){
    window.onscroll=function(){};
}

function AlertMessage(title, content, icon){
	Swal.fire(
	  title,
	  content,
	  icon
	)
}
//


// 예외 체크 start

function inputCalender(){
	let checkInDate = $("#checkIn-Date").val();
	let checkOutDate = $("#checkOut-Date").val();
	if(checkInDate == "" || checkOutDate == ""){
		AlertMessage("데이터 미등록",`체크인 날짜와 체크아웃 날짜를 확인해주세요`,"error");
		return;
	}
	
	if(!validCheckInOutDate()){
		AlertMessage("예약 기간 설정 오류",`체크인 날짜와 체크아웃 날짜를 확인해주세요`,"error");
		$("#checkIn-Date").val("");
		$("#checkOut-Date").val("");
		return;
	}
	
	calculatePrice();
	$("#bookingDate").text(` ${checkInDate} ~ ${checkOutDate}`);
	closeModal();
}

function validCheckInOutDate(){	
	let outDate = parseDateType($("#checkOut-Date").val());
	let inDate = parseDateType($("#checkIn-Date").val());	
	for(let i =0; i < bookedDays.length; i++){
		let tempDate = parseDateType(bookedDays[i]);
		if(tempDate > inDate && tempDate < outDate){
			return false;	
		}
	}
	return true;
}
// 예외 체크 end


// 금액 계산 start

function calculatePrice(){
	let onDayPrice = $("#oneDayPrice").val();
	let outDate = parseDateType($("#checkOut-Date").val());
	let inDate = parseDateType($("#checkIn-Date").val());
	let result = (outDate.getTime() - inDate.getTime())/(1000 * 60 * 60 * 24);
	
	let price = onDayPrice * result * count;
	$("#price").val(price);
	printPrice(price)
}

function printPrice(price){
	if(price < 1000){
		$("#showPrice").text(`가격: ${price}￦`);
	}
	else if(price < 1000000){
		let top = price / 1000;
		let bottom = price % 1000 == 0 ? "000" : price % 1000;
		$("#showPrice").text(`가격: ${top},${bottom}￦`);
	}else if(price < 1000000000){
		let top = price / 1000000;
		let middle = (price % 1000000) /1000 == 0 ? "000" : (price % 1000000) /1000;
		let bottom = price % 1000 == 0 ? "000" : price % 1000;
		$("#showPrice").text(`가격: ${top},${middle},${bottom}￦`);  
	}
}

// end 금액 계산


// start datepicker
function addListDates(){
	let size = $("#size").val();
	for(var i = 0; i < size; i++){
		let date = $("#date-"+ i).val();
		bookedDays.push(date);
	}
}

$( function() {
	  $.datepicker.setDefaults({  	
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년',
		    beforeShowDay: alreadyBookDates
		  });
	  
    $( "#checkIn-Date" ).datepicker({
    	maxDate:30,
  		minDate:0,
  		onClose: function(selectCheckInDate){
	
			let date = parseDateType(selectCheckInDate);
			date.setMonth(date.getMonth() -1);
			date.setDate(date.getDate() +1);
			$("#checkOut-Date").datepicker("option", "minDate", date);
			$("#checkOut-Date").datepicker("option", "maxDate", 50);
			$("#checkOut-Date").datepicker("option", "beforeShowDay", alreadyBookDates);	
		}
    });
    
    $("#checkOut-Date").datepicker(); 
});

function parseDateType(date){
	let tempdate = date.split("-");
	let day = new Date(tempdate[0], tempdate[1], tempdate[2]);
	return day;
}


function alreadyBookDates(date) {
    let m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	
    for (i = 0; i < bookedDays.length; i++) {
		let date;
		if(m < 10){
			date = `${y}-0${(m+1)}-${d}`;
			
		}else{
			date = `${y}-${(m+1)}-${d}`;
		}
        if($.inArray(date,bookedDays) != -1) {			
            return [false];
        }
    }
    return [true];
}

// -- end datePicker

function reserveHouse(guestId,hostId, houseId){
	let tempBox = [guestId, hostId, houseId];
	let data ={
		checkInDate: $("#checkIn-Date").val(),
		checkOutDate: $("#checkOut-Date").val(),
		headCount: count,
		request: $("#request").val(),
		tempIdBox: tempBox
	}
	console.log(data);
	
	$.ajax({
		type: "post",
		url: "/test/api/reserve/house",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		dataType: "json"
	}).done(function(response){
		console.log(response);
		if(response == 1){
			alert("예약완료")
			location.href="/reserveTable/user";
			
		}
	}).fail(function(){
		AlertMessage("통신 오류",`예약에 실패하였습니다.`);
	})
	

} 

function setMaxCount(){
	maxCount = $("#capacity").val();
}


