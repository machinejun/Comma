let userid = $("meta[name='userid']").attr("id");
let hostid = $("meta[name='hostid']").attr("id");
let houseid = $("meta[name='houseid']").attr("id");

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
	let bookedDays = ["2022-7-8", "2022-7-10","2022-07-25"];
    let m = date.getMonth(), d = date.getDate(), y = date.getFullYear();

    for (i = 0; i < bookedDays.length; i++) {
        if($.inArray(y + '-' +(m+1) + '-' + d,bookedDays) != -1) {
			
            return [false];
        }
    }
    return [true];
}

