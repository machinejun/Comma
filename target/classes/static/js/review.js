
let index = {

	init: function() {
		$("#btn-reply").bind("click", () => {
			this.addReply();
		})

	},

	addReply: function() {
		let houseId; // TODO
		let	reviewId = $("#review-id").val();

		let data = {
			content: $("#content").val()
		}

		console.log("reviewId" + reviewId);

		$.ajax({
			type: "POST",
			url: "/api/review/" + reviewId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
		.done(function(response) {
			if (data.content == "" || data.content.trim() == "") {
				alert("내용을 입력하세요.")
			} else {
				alert("댓글이 등록되었습니다.")
				// location.href = "/review/management_form/houseId"
			}
		})
		.fail(function(error) {
			alert("댓글이 등록되지 않았습니다.");
			console.log(error);
		});
	}
}

index.init();
