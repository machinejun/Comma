let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");
let houses = [];
let chatDate= [];

function loadDate(){
	let month = $("#month-selecter").val();
	let limit = $("#limit-selector").val();
	console.log("month : " + month);
	console.log("limit : " + limit);
	$.ajax({
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token)
		},
		type: "get",
		url: `/test/user/adminTable?month=${month}&limit=${limit}`,
		dataType: "json"
	}).done(function(response) {
		if(response.status == 200){
			console.log(response.data)
			loadTableData(response.data);
		}
	}).fail(function(response) {
		
	})
}


function loadTableData(data){
	for(var element in data){
		var houseinfo = `${element.name}(${element.username})`
		houses.push(houseinfo);
		chatDate.push(element.numberOfReservation);
	}
	drawChartTable()
}

function drawChartTable(){
	const ctx = document.getElementById('myChart').getContext('2d');
	const myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: houses,
	        datasets: [{
	            label: '예약건수',
	            data: chatDate,
	            backgroundColor: 'rgba(255, 99, 132, 0.2)',
	            borderColor: 'rgba(255, 99, 132, 1)',
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});
}

