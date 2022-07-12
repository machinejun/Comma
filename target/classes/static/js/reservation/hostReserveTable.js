function cancel(){
	cancelAlert();
}

function approve(){
	approveAlert()
}

function approveAlert(){
	Swal.fire(
	  '예약 승인',
	  '예약승인을 진행합니다',
	  'success'
	)
}

function cancelAlert(){
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
	    Swal.fire(
	      '예약취소!',
	      '예약이 취소되었습니다.',
	      'success'
	    )
	  }
	})
}


function showDetail(){
	let id = 0;
	let status = $("#request-detail-"+ id).css('display');
	if(status == 'none'){
		$("#request-detail-"+ id).fadeIn();
	}else{
		$("#request-detail-"+ id).fadeOut();
	}
}