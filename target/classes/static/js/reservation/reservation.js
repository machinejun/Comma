/*
let userid = $("meta[name='userid']").attr("id");
let hostid = $("meta[name='hostid']").attr("id");
let houseid = $("meta[name='houseid']").attr("id");
*/
let bookedDays= [];
let loadDaysSize;
let maxCount = 1;
let count= 1;
let istableShow = 0;
let inputStatus = 0;


addListDates();
setMaxCount();
$( function(){
	
	$("#count-minus").bind("click",() => {
		if(count == 1){
			AlertMessage("최소 인원 오류",`인원은 1명 이상이어야만 합니다`);
			return;
		}
		count--;
		calculatePrice()
		$("#count").text("인원수 : " + count);
		
	})
	$("#count-plus").bind("click",() => {
		if(count == maxCount){
			AlertMessage("최대 인원 초과",`현재 숙소의 최대 인원은 ${maxCount}명 입니다.`);
			return;
		}
		count++;
		calculatePrice()
		$("#count").text("인원수 : " + count);
	})
	
	$("#checkIn-Date").bind("click", () => {
		while(bookedDays.length != loadDaysSize){
			bookedDays.pop();
		}
	})
	
	
	$("#check-default-btn").bind("click", () => {
		closeModal()
	})
});

function addListDates(){
	let size = $("#size").val();
	for(var i = 0; i < size; i++){
		let date = $("#date-"+ i).val();
		bookedDays.push(date);
	}
	loadDaysSize = bookedDays.length;
}

function setMaxCount(){
	maxCount = $("#capacity").val();
}

function AlertMessage(title, content){
	Swal.fire(
	  title,
	  content,
	  'warning'
	)
}

function startModal(){
	if(istableShow == 0){
		showModal();
		console.log(bookedDays);
	}else{
		closeModal();
	}
}


function disableScrolling(){
    var x=window.scrollX;
    var y=window.scrollY;
    window.onscroll=function(){window.scrollTo(x, y);};
}

function enableScrolling(){
    window.onscroll=function(){};
}

function inputCalender(){
	let checkInDate = $("#checkIn-Date").val();
	let checkOutDate = $("#checkOut-Date").val();
	if(checkInDate == "" || checkOutDate == ""){
		AlertMessage("데이터 미등록",`체크인 날짜와 체크아웃 날짜를 확인해주세요`);
		return;
	}
	
	if(!validCheckInOutDate()){
		AlertMessage("예약 기간 설정 오류",`체크인 날짜와 체크아웃 날짜를 확인해주세요`);
		bookedDays.pop();
		$("#checkIn-Date").val("");
		$("#checkOut-Date").val("");
		return;
	}
	
	calculatePrice();
	$("#bookingDate").text(` ${checkInDate} ~ ${checkOutDate}`);
	closeModal();
}

function validCheckInOutDate(){
	let checkInDate = $("#checkIn-Date").val();
	let checkOutDate = $("#checkOut-Date").val();
	let day1 = checkOutDate.split("-");
	let day2 = checkInDate.split("-");
	
	let outDate = new Date(day1[0], day1[1], day1[2]);
	let inDate = new Date(day2[0], day2[1], day2[2]);
	
	if(outDate < inDate){
		return false;
	}
	
	
	for(let i =0; i < bookedDays.length; i++){
		let day = bookedDays[i];
		let tempday = (day).split('-');
		
		let tempDate = new Date(tempday[0], tempday[1], tempday[2]);
		console.log(tempDate.getTime);
		if(tempDate > inDate && tempDate < outDate){
			return false;	
		}
	}
	
	return true;
}



function calculatePrice(){
	let onDayPrice = $("#oneDayPrice").val();
	let checkInDate = $("#checkIn-Date").val();
	let checkOutDate = $("#checkOut-Date").val();
	let day1 = checkOutDate.split("-");
	let day2 = checkInDate.split("-");
	
	let outDate = new Date(day1[0], day1[1], day1[2]);
	let inDate = new Date(day2[0], day2[1], day2[2]);
	let result = (outDate.getTime() - inDate.getTime())/(1000 * 60 * 60 * 24);
	
	let price = onDayPrice * result * count;
	printPrice(price)
}

function printPrice(price){
	if(price < 1000){
		$("#showPrice").text(`가격: ${price}원`);
	}
	else if(price < 1000000){
		let top = price / 1000;
		let bottom = price % 1000 == 0 ? "000" : price % 1000;
		$("#showPrice").text(`가격: ${top},${bottom}원`);
	}else if(price < 1000000000){
		let top = price / 1000000;
		let middle = (price % 1000000) /1000 == 0 ? "000" : (price % 1000000) /1000;
		let bottom = price % 1000 == 0 ? "000" : price % 1000;
		$("#showPrice").text(`가격: ${top},${middle},${bottom}원`);  
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
    });
    
    $( "#checkOut-Date" ).datepicker({
    	maxDate:30,
  		minDate:0,
    });
    
});

function reserveHouse(hostid, houseid){

	let tempBox = [2, hostid, houseid];
	let data ={
		checkInDate: $("#checkIn-Date").val(),
		checkOutDate: $("#checkOut-Date").val(),
		headCount: count,
		request: $("#request").val(),
		tempIdBox: tempBox
	}
	$.ajax({
		type: "post",
		url: "/test/api/reserve/house",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		dataType: "json"
	}).done(function(response){
		if(reponse == 1){
			alsert("예약완료")
			//location.href="/user/reservation";
		}
	}).fail(function(){
		AlertMessage("통신 오류",`예약에 실패하였습니다.`);
	})

} 

function alreadyBookDates(date) {
	
	let checkIndate = $("#checkIn-Date").val();
	checkIndate = checkIndate.replace(/(^0+)/, "");

	if(checkIndate != ""){
		if(bookedDays[bookedDays.length-1] != checkIndate){
			bookedDays.push(checkIndate);
		}
	}

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


