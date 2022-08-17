let isMapVisiable = false;
let oldId;
function requestXYData(id) {

	if (isMapVisiable == true) {
		showMapContainer();
		return;
	}

	if (id == oldId) {
		showMapContainer();
		return;
	}

	oldId = id;
	$.ajax({
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token)
		},
		url: "/api/house/house-xy?houseId=" + id,
		type: "get",
		dataType: "json"
	}).done(function(response) {
		console.log(response.data);
		showMapContainer();
		drawMap(response.data.x, response.data.y);
	}).fail(function(error) {
		console.log(error);
	});
}

function showMapContainer() {
	if (isMapVisiable == true) {
		$(".map-container").fadeOut();
		isMapVisiable = false;
	} else {
		$(".map-container").fadeIn();
		isMapVisiable = true;
	}

}

function clickHeart() {
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	let data = {
		id: $("#house-id").val()
	}
	// 빈 하트를 눌렀을때
	if ($("#like").attr("class") == "bi bi-suit-heart") {
		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			url: "/api/house/wish-list",
			type: "POST",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response) {
			$("#like-count").text(response.data);
		}).fail(function(error) {
			console.log(error);
		});
		// 채워진 하트로 바꾸기
		document.getElementById("like").className = "bi bi-suit-heart-fill";
		// 채워진 하트를 눌렀을 때
	} else if ($("#like").attr("class") == "bi bi-suit-heart-fill") {
		let houseId = $("#house-id").val();
		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			url: "/api/house/wish-list/" + houseId,
			type: "DELETE",
		}).done(function(response) {
			$("#like-count").text(response.data);
		}).fail(function() {
		});
		// 빈 하트로 바꾸기
		document.getElementById("like").className = "bi bi-suit-heart";
	}
}
function drawMap(locationX, locationY) {

	var container = document.getElementById('map');
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(locationY, locationX), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options);
}