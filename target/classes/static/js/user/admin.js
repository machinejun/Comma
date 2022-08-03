// 예약 취소
function deleteUser(userId) {
	deleteAlert(userId);
}

function deleteAlert(userId) {
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
					console.log("xhr: " + xhr)
					xhr.setRequestHeader(header, token)
				},

				type: "delete",
				url: `/delete/user/${userId}`,
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(response) {
				alertMessage("예약 취소", "예약 취소가 완료되었습니다", "success");
				document.getElementById(`tr-${response}`).remove();
				return;
			}).fail(function() {
				alertMessage("error", "예약 취소에 실패하였습니다", "error");
				return;
			})

		}
	})
}