let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {
	deleteHouse: function(houseId) {
		let deleteCheck = confirm("삭제하시겠습니까?");

		if (deleteCheck) {
			$.ajax({
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},
				type: "DELETE",
				url: `/api/house/delete/${houseId}`,
			}).done(function(response) {
				console.log(response)
				if (response.status == 200) {
					alert("숙소가 삭제되었습니다.");
					location.href = "/host/house-management";
				} else {
					alert("숙소가 삭제되지 않았습니다.");
				}
			}).fail(function(error) {
				alert("숙소가 삭제되지 않았습니다.");
				console.log(error);
			});
		}
	}
}
