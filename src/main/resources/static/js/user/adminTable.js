let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");
let houses = [];
let date= [];

$(function() {

	$("#month-selecter").bind("change", () => {
		console.log("event");
		loadDate()
	})
	$("#month-selecter").bind("change", () => {
		console.log("event");
		loadDate()
	})

});


function loadDate(){
	let month = $("#month-selecter").val();
	let limit = $("#limit-selector").val();
	
	$.ajax({
		beforeSend: function(xhr) {
			
			xhr.setRequestHeader(header, token)
		},
		type: "get",
		url: `/user/adminTable?month=${month}&limit=${limit}`,
		dataType: "json"
	}).done(function(response) {
		console.log(response[0])
	}).fail(function(response) {
		
	})
}



const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '예약건수',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
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
