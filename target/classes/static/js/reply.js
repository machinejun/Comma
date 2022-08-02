let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {

	addReply: function(reviewId) {
		let houseId = $("#house-id").val();

		console.log("houseId : " + houseId);
		console.log("reviewId : " + reviewId);

		let data = {
			content: $("#reply-content-" + reviewId).val()
		}

		if (data.content == "" || data.content.trim() === "") {
			alert("내용을 입력하세요.");
		} else {
			$.ajax({
				beforeSend: function(xhr) {
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
				}
			}).fail(function(error) {
				alert("댓글이 등록되지 않았습니다.");
				console.log(error);
			});
		}
	},

	updateReply: function(reviewId, replyId) {

		let data = {
			content: $("#reply-edit-" + reviewId).val()
		}

		console.log("update : " + data.content);

		if (data.content == "") {
			alert("내용을 입력하세요.")
		} else {
			$.ajax({
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},

				type: "PUT",
				url: "/review/reply/" + replyId,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(response) {
				if (response.status == 200) {
					//appendEditedReply(response.data);
					alert("댓글이 수정되었습니다.");
					location.href="/review/management/" + response.data.reviewId.houseId.id;
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

	editText: function(replyId, replyContent, reviewId) {
		console.log("수정 버튼 클릭" + replyContent);

		let editForm = "";

		editForm += `<div id="reply-edit-form-${replyId}"><form class="mb-5">
					<textarea class="form-control" rows="3"
						id="reply-edit-${reviewId}">${replyContent}</textarea>
				</form>
				<div>
					<button type="button" id="btn-save-reply"
						class="custom-sm-btn float-right"
						onclick="index.updateReply('${reviewId}','${replyId}');">수정</button>
				</div></div><br>`;

		$('#reply--' + replyId).replaceWith(editForm);
		$('#reply--' + replyId).focus();
	}
}

function appendEditedReply(reply) {

	let editedForm = `<li class="list-group-item d-flex justify-content-between" id="reply--${reply.id}">
			<div>${reply.content}</div>
			<div class="d-flex">
				<div>작성일 : <fmt:formatDate pattern="yyyy-MM-dd"
										value="${reply.creationDate}" />
									&nbsp;&nbsp;</div>
				<a class="host-review-update"
									onclick="index.editText('${reply.id}', '${reply.content}', '${reply.reviewId.id}');" style="cursor: pointer;">수정</a>
								&nbsp;&nbsp;
								<a class="host-review-delete" style="color: red"
									onclick="index.deleteReply(${reply.id});" style="cursor: pointer;">삭제</a>				
			</div>
		</li>`;

	$("#reply-edit-form-" + reply.id).replaceWith(editedForm);

}

function appendReply(reply) {

	let childElement = `<li class="list-group-item d-flex justify-content-between" id="reply--${reply.id}">
			<div>${reply.content}</div>
			<div class="d-flex">
				<a class="host-review-update"
									onclick="index.editText('${reply.id}', '${reply.content}', '${reply.reviewId.id}');" style="cursor: pointer;">수정</a>
								&nbsp;&nbsp;
								<a class="host-review-delete" style="color: red"
									onclick="index.deleteReply(${reply.id});" style="cursor: pointer;">삭제</a>				
			</div>
		</li>`;
	console.log("append 확인" + reply.reviewId.id);
	$("#reply-list-" + reply.reviewId.id).prepend(childElement);
	$("#reply-content-" + reply.reviewId.id).val("");
}

index.init();
