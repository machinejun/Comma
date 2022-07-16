
let index = {

	init: function() {
		$("#btn-update").bind("click", () => {
			this.update();
		});

		$("#btn-delete").bind("click", () => {
			this.delete();
		});

	},

	update: function() {
		let reviewId = $("#review-id").val();

		let data = {
			content: $("#content").val()
		}

		$.ajax({
			type: "PUT",
			url: "/review/" + reviewId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response) {
			if (response.data.content == "" || response.data.content.trim() == "") {
				alert("내용을 입력하세요.")
			} else {
				alert("댓글이 수정되었습니다.")
			}
		}).fail(function(error) {
			alert("댓글이 수정되지 않았습니다.");
			console.log(error);
		});

	},

	delete: function() {
		let reviewId = $("#review-id").val();
		let houseId = $("#house-id").val();
		let deleteCheck = confirm("삭제하시겠습니까?");
		console.log(reviewId);

		if (deleteCheck) {
			$.ajax({
				type: "DELETE",
				url: "/review/" + reviewId,
			}).done(function(response) {
				if (response.status == 200) {
					//alert("리뷰가 삭제되었습니다.");
					location.href = "/house/detail/" + houseId;
				} else {
					alert("리뷰가 삭제되지 않았습니다.");
				}
			}).fail(function(error) {
				alert("리뷰가 삭제되지 않았습니다.");
				console.log(error);
			});
		}
	}
}

index.init();
