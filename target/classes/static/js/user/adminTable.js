let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = 0;

$("#li-groub li").click(function() {
	index = $(this).index()
});


function loadIndexDate() {
	var month = $("#month-selecter").val();
	var limit = $("#limit-selector").val();

	$.ajax({
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token)
		},
		type: "get",
		url: `/test/user/adminTable?index=${index}&month=${month}&limit=${limit}`,
		dataType: "json"
	}).done(function(response) {
		if (response.status == 200) {
			alert("데이터 받음");
			classifyData(response.data);
		}
	}).fail(function(response) {

	})
}

function classifyData(data) {
	console.log(index);
	switch (index) {
		case 0:
			let itemOneModel = {
				monthlist: [],
				userCount: [],
				houseCount: [],
				reservationCount: [],
				reviewCount: [],
				flag: 0,
				maxValue: 0,
			};

			itemOneModel.monthlist = checkMont(data, itemOneModel.monthlist);
			itemOneModel.userCount = makelistOneModel('user', data, itemOneModel.userCount, itemOneModel);
			itemOneModel.houseCount = makelistOneModel('house', data, itemOneModel.houseCount, itemOneModel);
			itemOneModel.reservationCount = makelistOneModel('reservation', data, itemOneModel.reservationCount, itemOneModel);
			itemOneModel.reviewCount = makelistOneModel('review', data, itemOneModel.reviewCount, itemOneModel);
			drawChartMonthTable(itemOneModel.monthlist, itemOneModel.userCount, itemOneModel.houseCount,
			 				itemOneModel.reservationCount, itemOneModel.reviewCount, itemOneModel.maxValue);
			break;

		case 1:
			let indexOnemodel = makelistTwoAndThreeModel('address', data);
			drawChartOneItemTable(indexOnemodel.list1, indexOnemodel.list2, "지역별 숙소 수", indexOnemodel.maxValue);
			break;

		case 2:
			let indexTwomodel = makelistTwoAndThreeModel('best', data);
			drawChartOneItemTable(indexTwomodel.list1, indexTwomodel.list2, "지역별 숙소 수", indexTwomodel.maxValue);
	}

}
function checkMont(data, monthlist) {
	var lastMonth = data['user'][data['user'].length - 1].column;
	for (var i = 1; i <= lastMonth; i++) {
		monthlist.push(`${i}월`);
	}
	return monthlist;
}

function insertMonthData(list, month) {
	for (var i = 1; i < month; i++) {
		list.push(0);
	}
	return list;
}
function makelistOneModel(type, data, list, model) {
	for (element of data[`${type}`]) {
		if (model.flag == 0) {
			insertMonthData(list, element.column);
			model.flag = 1;
		}
		if (model.maxValue < element.count) {
			model.maxValue = element.count
		}
		list.push(element.count);
	}
	model.flag = 0;
	return list;
}

function makelistTwoAndThreeModel(type, data) {
	var model = {
		list1: [],
		list2: [],
		maxValue: 0
	}
	for (var element of data[`${type}`]) {
		model.list1.push(element.column)
		if (model.maxValue < element.count) {
			model.maxValue = element.count
		}
		model.list2.push(element.count)
	}
	return model;
}


function drawChartOneItemTable(columnlist, countlist, labelName, maxValue) {
	const ctx1 = document.getElementById('myChart_address').getContext('2d');
	const ctx2 = document.getElementById('myChart_best').getContext('2d');
	
	const myChart = new Chart(index == 1 ? ctx1 : ctx2, {
		type: 'bar',
		data: {
			labels: columnlist,
			datasets: [{
				label: labelName,
				data: countlist,
				backgroundColor: 'rgb(102, 102, 255, 0.3)',
				borderColor: 'rgb(102, 102, 255, 0.3)',
				borderWidth: 1
			}]
		},
		options: {
			legend: {
				labels: {
					fontColor: 'black' // label color
				}
			},
			scales: {
				yAxes: [{
					ticks: {
						max: maxValue + 5,
						beginAtZero: true,
						fontColor: 'black' // y축 폰트 color
					}
				}],
				xAxes: [{
					ticks: {
						fontColor: 'black' // x축 폰트 color
					}
				}]
			}
		}
	});
}


function drawChartMonthTable(month, userCount, houseCount, reservationCount, reviewCount, maxValue) {
	const ctx = document.getElementById('myChart_month').getContext('2d');

	const myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: month,
			datasets: [{
				label: '가입자',
				type: 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
				backgroundColor: 'rgb(102, 102, 255, 0.3)',
				borderColor: 'rgb(102, 102, 255, 0.3)',
				data: userCount
			},
			{
				label: '숙소 등록',
				type: 'line',         // 'line' type
				fill: false,         // 채우기 없음
				lineTension: 0.2,  // 0이면 꺾은선 그래프, 숫자가 높을수록 둥글해짐
				pointRadius: 2,    // 각 지점에 포인트 주지 않음
				backgroundColor: 'rgb(255, 201, 102)',
				borderColor: 'rgb(255, 201, 102)',
				data: houseCount
			}, {
				label: '예약수',
				type: 'line',
				fill: false,
				lineTension: 0.2,
				pointRadius: 2,
				backgroundColor: 'rgb(255, 000, 051)',
				borderColor: 'rgb(255, 000, 051)',
				data: reservationCount
			},
			{
				label: '리뷰 등록',
				type: 'line',
				fill: false,
				lineTension: 0.2,
				pointRadius: 2,
				backgroundColor: 'rgb(102, 255, 051)',
				borderColor: 'rgb(102, 255, 051)',
				data: reviewCount
			}]
		},
		options: {
			legend: {
				labels: {
					fontColor: 'black' // label color
				}
			},
			scales: {
				yAxes: [{
					ticks: {
						max: maxValue + 5,
						beginAtZero: true,
						fontColor: 'black' // y축 폰트 color
					}
				}],
				xAxes: [{
					ticks: {
						fontColor: 'black' // x축 폰트 color
					}
				}]
			}
		}
	});
}



