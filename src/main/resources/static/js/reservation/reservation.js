/*
let userid = $("meta[name='userid']").attr("id");
let hostid = $("meta[name='hostid']").attr("id");
let houseid = $("meta[name='houseid']").attr("id");
*/
let bookedDays= [];
let count= 1;
let istableShow = 0;

addListDates();
$( function(){
	
	$("#count-minus").bind("click",() => {
		if(count == 1){
			return;
		}
		count--;
		console.log(count);
		calculatePrice()
		$("#count").text("인원수 : " + count);
		
	})
	$("#count-plus").bind("click",() => {
		count++;
		console.log(count);
		calculatePrice()
		$("#count").text("인원수 : " + count);
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
}

function startModal(){
	if(istableShow == 0){
		showModal();
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
		alert("데이터를 다시 확인해 주세요");
		return;
	}
	calculatePrice();
	$("#bookingDate").text(` ${checkInDate} ~ ${checkOutDate}`);
	closeModal();
}

function parseDate(){
	
}


function calculatePrice(){
	let onDayPrice = $("#oneDayPrice").val();
	let checkInDate = $("#checkIn-Date").val();
	let checkOutDate = $("#checkOut-Date").val();
	let day1 = checkOutDate.split("-");
	let day2 = checkInDate.split("-");
	console.log(day1);
	console.log(day2);
	
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
		console.log(`가격: ${top},${bottom}원`);
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
	  
    $( "#checkIn-Date, #checkOut-Date" ).datepicker({
    	maxDate:30,
  		minDate:0,

    });
});

function reserveHouse(hostid, houseid){

	let tempBox = [1, hostid, houseid];
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
		if(reponse == 1){
			alsert("예약완료")
			//location.href="/user/reservation";
		}
	}).fail(function(){
		alert("예약에 실패하였습니다.")
	})

} 

function alreadyBookDates(date) {
	
	let checkIndate = $("#checkIn-Date").val();
	console.log(checkIndate);
	checkIndate = checkIndate.replace(/(^0+)/, "");
	if(checkIndate != ""){
		bookedDays.push(checkIndate);
	}
    let m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	
	console.log(bookedDays);
	
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


