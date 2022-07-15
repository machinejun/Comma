
let index = {

	init: function() {
		$("#btn-reply").bind("click", () => {
			this.addReply();
		}),

			$("btn-update").bind("click", () => {
				this.update();
			}),

			$("btn-delete").bind("click", () => {
				this.delete();
			})

	},

	addReply: function() {
		let reviewId = $("#review-id").val();

		let data = {
			content: $("#content").val()
		}

		$.ajax({
			type: "POST",
			url: "/api/review/" + reviewId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
			.done(function(response) {
				if (response.data.content == "" || response.data.content.trim() == "") {
					alert("내용을 입력하세요.")
				} else {
					alert("댓글이 등록되었습니다.")
					location.href = "/review/management/" + houseId;
				}
			})
			.fail(function(error) {
				alert("댓글이 등록되지 않았습니다.");
				console.log(error);
			});
	},

	update: function() {
		let reviewId = $("#reply-id").val();

		let data = {
			content: $("#content").val()
		}

		$.ajax({
			type: "PUT",
			url: "/" + replyId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
			.done(function(response) {
				if (response.data.content == "" || response.data.content.trim() == "") {
					alert("내용을 입력하세요.")
				} else {
					alert("댓글이 수정되었습니다.")
				}
			})
			.fail(function(error) {
				alert("댓글이 수정되지 않았습니다.");
				console.log(error);
			});

	},

	delete: function() {
		let replyId = $("#reply-id").val();

		$.ajax({
			type: "DELETE",
			url: "/" + replyId,
		})
		.done(function(response) {
			if (response.data == 200) {
				alert("댓글이 삭제되었습니다.")
			} else {
				alert("댓글이 삭제되지 않았습니다.")
			}
		})
		.fail(function(error) {
			alert("댓글이 삭제되지 않았습니다.");
			console.log(error);
		});
	}
}

index.init();
