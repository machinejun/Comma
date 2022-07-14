function cancel(reservationId){
	cancelAlert(reservationId);
	
	
	
}

function approve(){
	alertMessage("예약 승인","예약 승인이 완료되었습니다","success")
}


function alertMessage(title, text, icon){
	Swal.fire(
	  title,
	  text,
	  icon
	)
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


function showDetail(id){
	let status = $("#request-detail-"+ id).css('display');
	if(status == 'none'){
		$("#request-detail-"+ id).fadeIn();
	}else{
		$("#request-detail-"+ id).fadeOut();
	}
}

function checkHouseReservation(hostId,houseId){
	$.ajax({
		type: "GET",
		url: `/test/api/reserve/house/${hostId}/${houseId}`,
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(response) {
		addHouseTable(response);
		
	}).fail(function() {
		
	})
}

function addHouseTable(response){

	var cell = document.querySelector('tbody');

	while ( cell.hasChildNodes() )
	{
	     cell.removeChild( cell.firstChild );       
	}

				
	response.forEach((reservation) => {
		let info = `<tr id="tr-${reservation.id}">
			     <th scope="row">${reservation.username}</th>
				 <td>${reservation.headCount}</td>
				 <td>${reservation.checkInDate} ~ ${reservation.checkOutDate}</td>
				 <td>${reservation.phoneNumber}</td>
				 <td><!-- 아이디 값을 다 넣어주어야 한다. -->
					 <a onclick="showDetail(${reservation.id})" class="icon-search-plus" type="btn"></a>
					 <div id="request-detail-${reservation.id}" style="display: none;">
					 	<p>${reservation.request}<p> 
					 </div>
				 </td>   
				 <td><span style="font-weight: bold;">${reservation.approvalStatus}<span>&nbsp;&nbsp;</span><button onclick="approve()" id="approve" class="btn btn-success" style="padding: 4px; font-size: 10px;">승인</button></td>   
				 <td><button onclick="cancel(${reservation.id})" class="btn btn-danger" style="padding: 4px; font-size: 10px;">취소</button></td>   
			</tr>`;
		$("#table-body").append(info);					    	
	})
						
	
	
}
