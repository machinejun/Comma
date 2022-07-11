let userid = $("meta[name='userid']").attr("id");
let hostid = $("meta[name='hostid']").attr("id");
let houseid = $("meta[name='houseid']").attr("id");
$( function(){
	let istableShow = 0;
	let count= 0;
	$("#check-table").hide();
	
	$("#count-minus").bind("click",() => {
		if(count == 0){
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
			$("#check-table").show();
			istableShow = 1;
			disableScrolling()
		}else{
			$("#check-table").hide();
			istableShow = 0;
			enableScrolling()
		}
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
	let checkInDate = $("#checkinDate").val();
	let checkOutDate = $("#checkOutDate").val();
	$("#bookingDate").text(`예약일 : ${checkInDate} ~ ${checkOutDate}`);
	$("#check-table").hide();
	istableShow = 0;
	enableScrolling()
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
	  
    $( "#checkinDate, #checkoutDate" ).datepicker({
    	maxDate:30,
  		minDate:0,

    });
});

function checkDate(){

	let tempBox = [userid, hostid, houseid];
	let data ={
		checkInDate: $("#checkinDate").val(),
		checkOutDate: $("#checkoutDate").val(),
		tempIdBox: tempBox
	}

	$.ajax({
		type: "post",
		url: "/api/house/reserve",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		dataType: "json"
	}).done(function(response){
		console.log(response)
		
	}).fail(function(err){
		console.log(response)
	});

} 

function alreadyBookDates(date) {
	let bookedDays = ["2022-7-12", "2022-7-15","2022-7-25","2022-07-26"];
	let checkIndate = $("#checkinDate").val();
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

