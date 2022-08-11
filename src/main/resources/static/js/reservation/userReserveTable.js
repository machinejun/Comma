let istableShow = 0;

let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

// 화면 이벤트
function startModal() {
	if (istableShow == 0) {
		showModal();
		console.log(bookedDays);
	} else {
		closeModal();
	}
}

function showModal() {
	istableShow = 1;
	disableScrolling();
	$(".detail").fadeIn();
	$("#isNaviFocus").attr('value', 1);
}

function closeModal() {
	$(".detail").fadeOut();
	istableShow = 0;
	enableScrolling()
	$("#isNaviFocus").attr('value', 0);
}

function disableScrolling() {
	var x = window.scrollX;
	var y = window.scrollY;
	window.onscroll = function() { window.scrollTo(x, y); };
}

function enableScrolling() {
	window.onscroll = function() { };
}

function alertMessage(title, text, icon) {
	Swal.fire(
		title,
		text,
		icon
	)
}
// end 화면 이벤트

// 예약 취소
function cancelAndAlert(reservationId) {
	Swal.fire({
		title: '정말 예약을 취소시키겠습니까 ?',
		text: "예약을 취소시킨다면 다시 복구 할 수 없습니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'OK'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},
				type: "delete",
				url: `/api/reservation/delete/${reservationId}`,
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(response) {
				console.log(response);
				if(response.status == 200){
					closeModal();
					location.reload();
				}
				
			}).fail(function() {
				alertMessage("error", "예약 취소에 실패하였습니다", "error");
				return;
			})
		}
	})
}

// 유저 예약 테이블 표시
function showResDetail(resId) {
	$.ajax({
		type: "get",
		url: `/api/reservation/detail/${resId}`,
		dataType: "json"
	}).done(function(response) {
		console.log(response)
		addDetailPage(response)
	}).fail(function(err) {
		console.log(err)
	})
}

function addDetailPage(response) {
	let div =
		`<div id="detail-img">
		<img id="detail-div-img" src="http://localhost:9090/upload/${response.houseId.image.imageUrl}"/>
	</div>
	<div id="detail-div" style="width: 500px; padding-left: 15px">
		<a onclick="closeModal()" class="m-2" type="button"><span class="icon-times-circle-o" style="position: absolute; right: 2%;"></span></a>
		<h2 style="display: block;">${response.houseId.name}</h2>
		
		<table class="table table-striped-columns">
		  <thead>
		    <tr>
		      <th scope="col"></th>
		      <th scope="col" style="text-align: center;"><span class="icon-pencil-square-o">&nbsp;INFO</span></th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">예약 Id</th>
		      <td >${response.id}</td>
		    </tr>
		    <tr>
		      <th scope="row">예약자</th>
		      <td >${response.guestId.name}</td>
		    </tr>
		    <tr>
		      <th scope="row">인원</th>
		      <td >${response.headCount}</td>
		    </tr>
		    <tr>
		      <th scope="row">checkin/out</th>
		      <td >${response.checkInDate} ~ ${response.checkOutDate}</td>
		    </tr>
		    <tr>
		      <th scope="row">가격</th>
		      <td >${response.price}</td>
		    </tr>
		    <tr>
		      <th scope="row">주소</th>
		      <td >${response.houseId.detailAddress}</td>
		    </tr>
		    <tr>
		      <th scope="row">요청사항</th>
		      <td >${response.request}</td>
		    </tr>

		    <tr>
		      <th scope="row"></th>
		      <td ></td>
		    </tr>
		    <tr>
		      <th scope="row">숙소명</th>
		      <td >${response.houseId.name}</td>
		    </tr>
		    <tr>
		      <th scope="row">호스트</th>
		      <td >${response.hostId.name}</td>
		    </tr>
		    <tr>
		      <th scope="row">전화번호</th>
		      <td >${response.hostId.phoneNumber}</td>
		    </tr>
		    <tr>
		      <th scope="row">E-mail</th>
		      <td >${response.hostId.email}</td>
		    </tr>
		    <tr>
		      <th scope="row">승인</th>
		      <td >${response.approvalStatus}</td>
		    </tr>
		    <tr>
		      <th scope="row"></th>
		      <td ></td>
		    </tr>
		  </tbody>
		  	
		</table>
		<br/>
		<div style="position: absolute; display: inline; bottom: 3%; right: 3%; ">
			<button id="cancel-btn" onclick="cancelAndAlert(${response.id})" class="btn btn-secondary"  style="padding: 5px; font-size: 15px; ">예약 취소</button>
			<button onclick="closeModal()" class="btn btn-secondary" style="padding: 5px; font-size: 15px;">닫기</button>	
		</div>
	</div>`;
	checkImgContain(response);
	$("#userTableDetail").append(div);
	showModal();
}

function checkImgContain(response) {
	if (response.houseId.image == undefined || response.houseId.image == null) {
		$("#detail-div-img").attr("src", "https://cdn.pixabay.com/photo/2012/04/24/16/19/room-40309_960_720.png")
	} else {
		$("#detail-div-img").attr("src", `${response.houseId.image.imageUrl}`)
		//$("#detail-div-img").attr("src", `https://gifburg.com/images/gifs/loading/webp/0012.webp`)
	}
}

function payForKakao(iresId) {


	let data = {
		resId: iresId,
	}

	$.ajax({
		beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},
		type: "post",
		url: `/api/reservation/kakao-pay`,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		data: JSON.stringify(data)
	}).done(function(res) {
		console.log(res.next_redirect_pc_url);
		window.location.replace(res.next_redirect_pc_url);

	}).fail(function() {

	})
}

