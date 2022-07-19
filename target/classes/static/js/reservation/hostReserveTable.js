let buttonOn = "";
let monthOn = 0;

// 화면 이벤트
function showDetail(id){
	let status = $("#request-detail-"+ id).css('display');
	if(status == 'none'){
		$("#request-detail-"+ id).fadeIn();
	}else{
		$("#request-detail-"+ id).fadeOut();
	}
}

function alertMessage(title, text, icon){
	Swal.fire(
	  title,
	  text,
	  icon
	)
}

function changeButton(btnId){
	$("#" + btnId).disabled = true;
	if(buttonOn != ""){
		$("#" + buttonOn).disabled = false;
	}
	buttonOn = btnId
}

// 예약 취소
function cancel(reservationId){
	cancelAlert(reservationId);	
}

function cancelAlert(reservationId){
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
		type: "delete",
		url: `/test/api/reserve/delete/${reservationId}`,
		contentType: "application/json; charset=utf-8",
		dataType: "json"
		}).done(function(response) {
			alertMessage("예약 취소", "예약 취소가 완료되었습니다","success");
			document.getElementById(`tr-${response}`).remove();
			return;
		}).fail(function(){
			alertMessage("error", "예약 취소에 실패하였습니다","error");
			return;
		})
		
	  }
	})
}



// 예약 목록 표시
function checkHouseReservation(hostId,houseId){
	let month = $("#month").val();
	console.log(month);
	$.ajax({
		type: "GET",
		url: `/test/api/reserve/house/${hostId}/${houseId}/${month}`,
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(response) {
		addHouseTable(response);	
	}).fail(function() {
		
	})
}

function checkReservation(hostId){
	let month = $("#month").val();
	console.log(month);
	$.ajax({
		type: "GET",
		url: `/test/api/reserve/house/${hostId}/${month}`,
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(response) {
		addHouseTable(response);
		
	}).fail(function() {
		
	})
}


function addHouseTable(response){
	var cell = document.querySelector('tbody');
	while (cell.hasChildNodes()){
     cell.removeChild( cell.firstChild );       
	}
	if(response[0] != null){
		$("#houseName").text(response[0].houseName);
	}else{
		$("#houseName").text("예약자 0명");
	}
	
			
	response.forEach((reservation) => {
		let info = `<tr id="tr-${reservation.id}">
			     <th scope="row">${reservation.username}</th>
				 <td>${reservation.headCount}</td>
				 <td>${reservation.checkInDate} ~ ${reservation.checkOutDate}</td>
				 <td>${reservation.price}</td>
				 <td>${reservation.phoneNumber}</td>
				 <td><!-- 아이디 값을 다 넣어주어야 한다. -->
					 <a onclick="showDetail(${reservation.id})" class="icon-search-plus" type="btn">${reservation.request == "" ? "" : " ..."}</a>
					 <div id="request-detail-${reservation.id}" style="display: none;">
					 	<p>${reservation.request}<p> 
					 </div>
				 </td>   
				 <td><span style="font-weight: bold;">${reservation.approvalStatus}<span>&nbsp;&nbsp;</span><button onclick="sentApprove(${reservation.id})" id="approve-${reservation.id}" class="btn btn-success" style="padding: 4px; font-size: 10px; display: ${reservation.approvalStatus != "WAITING" ? "none;" : ""}">승인</button></td>   
				 <td><button onclick="cancel(${reservation.id})" class="btn btn-danger" style="padding: 4px; font-size: 10px;">취소</button></td>   
			</tr>`;
		$("#table-body").append(info);
		changeButton(reservation.houseName);					    	
	})						
}


// 예약 승인
function sentApprove(resId){
	fetch("/test/api/reserve/host/approve", {
  	method: "POST",
  	headers: {
    	"Content-Type": "application/json",
    	"DateType": "json"
  	},
  	body: JSON.stringify({
		resId: resId,
		approve: "APPROVED"
	}),
  	}).then((response) => {
		alertMessage("예약 승인","예약 승인이 완료되었습니다","success")
		location.reload();
  	}).catch((err)=> console.log(err));
}



