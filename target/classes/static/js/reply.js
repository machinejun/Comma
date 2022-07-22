let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {

	init: function() {
		$("#btn-reply").bind("click", () => {
			this.addReply();
		});

		$("#btn-delete").bind("click", () => {
			this.deleteReply();
		});

		$("#btn-update").bind("click", () => {
			this.updateReply();
		});

	},

	addReply: function() {
		let reviewId = $("#review-id").val();
		let houseId = $("#house-id").val();

		console.log("houseId : " + houseId);

		let data = {
			content: $("#reply-content").val()
		}

		if (data.content == "" || data.content.trim() === "") {
			alert("내용을 입력하세요.");
		} else {
			$.ajax({
				beforeSend: function(xhr) {
					console.log("xhr: " + xhr)
					xhr.setRequestHeader(header, token)
				},

				type: "POST",
				url: "/review/reply/" + reviewId,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(response) {
				if (response.status == 200) {
					appendReply(response.data);
					alert("댓글이 등록되었습니다.");
					location.href = "/review/management/" + houseId
				}
			}).fail(function(error) {
				alert("댓글이 등록되지 않았습니다.");
				console.log(error);
			});
		}
	},

	updateReply: function(replyId) {

		let data = {
			content: $("#reply-edit-box").val()
		}

		if (data.content == "" || data.content.trim() === "") {
			alert("내용을 입력하세요.")
		} else {
			$.ajax({
				beforeSend: function(xhr) {
					console.log("xhr: " + xhr)
					xhr.setRequestHeader(header, token)
				},

				type: "PUT",
				url: "/review/reply/" + replyId,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(response) {
				if (response.status == 200) {
					alert("댓글이 수정되었습니다.")
					appendReply(response.data);
					$('#btn-container').remove();
				}

			}).fail(function(error) {
				alert("댓글이 수정되지 않았습니다.");
				console.log(error);
			});

		}

	},

	deleteReply: function(replyId) {
		let houseId = $("#house-id").val();
		let deleteCheck = confirm("삭제하시겠습니까?");

		if (deleteCheck) {
			$.ajax({
				beforeSend: function(xhr) {
					console.log("xhr: " + xhr)
					xhr.setRequestHeader(header, token)
				},

				type: "DELETE",
				url: "/review/reply/" + replyId,
			}).done(function(response) {
				if (response.status == 200) {
					alert("댓글이 삭제되었습니다.");
					location.href = "/review/management/" + houseId;
				} else {
					alert("댓글이 삭제되지 않았습니다.")
				}
			}).fail(function(error) {
				alert("댓글이 삭제되지 않았습니다.");
				console.log(error);
			});
		}
	},

	editText: function(replyId, content) {
		console.log("수정 버튼 클릭");
		let editForm;

		editForm += "<textarea class='form-control' rows='3'>" + content + "</textarea>";
		editForm += `<div>
																<button type="button" onclick="index.updateReply(${replyId})"
																	class="custom-sm-btn float-right">수정</button>
															</div>`;
		$('#reply-edit-box').replaceWith(editForm);
		$('#btn-container').remove()
		$('#reply-edit-box').focus();
	}
}


function appendReply(reply) {

	let childElement = `<div class="d-flex">
																		<input type="hidden" id="reply-id" value="${reply.id}">
																		<div class="ms-3">
																			<p>${reply.content}</p>
																			<button
																				class="btn btn-outline-danger btn-sm float-right"
																				style="margin-left: 10px;" onclick="index.deleteReply(${reply.id});">삭제</button>
																			<button type="button"
																				class="btn btn-outline-primary btn-sm float-right"
																				onclick="index.editText(${reply.id}, ${reply.content});">수정</button>
																		</div>
																	</div>
																	<br>`;

	$("#reply--box").append(childElement);
	$("#content").val("");
}

index.init();
