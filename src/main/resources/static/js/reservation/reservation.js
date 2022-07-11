let userid = $("meta[name='userid']").attr("id");
let hostid = $("meta[name='hostid']").attr("id");
let houseid = $("meta[name='houseid']").attr("id");
let count= 1;

$( function(){
	let istableShow = 0;
	
	$("#count-minus").bind("click",() => {
		if(count == 1){
			return;
		}
		count--;
		console.log(count);
		$("#count").text("인원수 : " + count);
		
	})
	$("#count-plus").bind("click",() => {
		count++;
		console.log(count);
		$("#count").text("인원수 : " + count);
	})
	
	$("#calender-btn").bind("click",() => {
		if(istableShow == 0){
			showModal();
		}else{
			closeModal();
		}
	})
	
	$("#check-default-btn").bind("click", () => {
		closeModal()
	})
});


function disableScrolling(){
    var x=window.scrollX;
    var y=window.scrollY;
    window.onscroll=function(){window.scrollTo(x, y);};
}

function enableScrolling(){
    window.onscroll=function(){};
}

function inputCalender(){
	let checkInDate = $("#checkInDate").val();
	let checkOutDate = $("#checkOutDate").val();
	if(checkInDate == "" || checkOutDate == ""){
		alert("데이터를 다시 확인해 주세요");
		return;
	}
	$("#bookingDate").text(`예약일 : ${checkInDate} ~ ${checkOutDate}`);
	closeModal();
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
	  
    $( "#checkInDate, #checkOutDate" ).datepicker({
    	maxDate:30,
  		minDate:0,

    });
});

function reserveHouse(){

	let tempBox = [userid, hostid, houseid];
	let data ={
		checkInDate: $("#checkInDate").val(),
		checkOutDate: $("#checkOutDate").val(),
		headCount: count,
		request: $("#request").val(),
		tempIdBox: tempBox
	}
	console.log(data);
	$.ajax({
		type: "post",
		url: "/api/house/reserve",
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
	let bookedDays = ["2022-07-12", "2022-07-15","2022-07-25","2022-07-26"];
	let checkIndate = $("#checkInDate").val();
	checkIndate = checkIndate.replace(/(^0+)/, "");
	if(checkIndate != null){
		bookedDays.push(checkIndate);
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


