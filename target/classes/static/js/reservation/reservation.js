
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
		    yearSuffix: '년'
		  });
	  
    $( "#checkinDate, #checkoutDate" ).datepicker({
    	maxDate:30,
  		minDate:0
    });
});

function checkDate(){
	let a1 = $("#checkinDate").val();
	let a2 = $("#checkoutDate").val();
	
	console.log(a1);
	console.log(a2);
} 

