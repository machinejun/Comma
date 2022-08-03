let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {

	init: function() {
		$("#btn-report-review").bind("click", () => {
			this.reportReview();
		})
	},

	addReply: function(reviewId) {
		let houseId = $("#house-id").val();

		console.log("houseId : " + houseId);
		console.log("reviewId : " + reviewId);

		let data = {
			content: xssCheck($("#reply-content-" + reviewId).val(), 1)
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
			content: xssCheck($("#reply-edit-" + reviewId).val(), 1)
		}

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
					alert("댓글이 수정되었습니다.");
					location.href = "/review/management/" + response.data.reviewId.houseId.id;
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
	},

	reportReview: function() {
		let reviewId = $("#review-id").val();
		console.log(reviewId);

		let data = {
			reportType: $("#report-type").val(),
			detailText: xssCheck($("#detail-text").val(), 1)
		}

		if (data.reportType == "") {
			alert("신고 유형을 선택하셔야 합니다.");
		} else {
			$.ajax({
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},

				type: "POST",
				url: "/host/report/" + reviewId,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(response) {
				if (response.status == 200) {
					alert("신고가 접수되었습니다.");
					document.getElementById("report-type").value = "";
					document.getElementById("detail-text").value = "";
					document.getElementById("close").click();
				} else {
					alert("신고가 접수되지 않았습니다.");
				}
			}).fail(function(error) {
				alert("신고가 접수되지 않았습니다.");
				console.log(error);
			});
		}
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
		
	$("#reply-list-" + reply.reviewId.id).prepend(childElement);
	$("#reply-content-" + reply.reviewId.id).val("");
}

function xssCheck(str, level) {
    if (level == undefined || level == 0) {
        str = str.replace(/\<|\>|\"|\'|\%|\;|\(|\)|\&|\+|\-/g,"");
    } else if (level != undefined && level == 1) {
        str = str.replace(/\</g, "&lt;");
        str = str.replace(/\>/g, "&gt;");
    }
    return str;
}

index.init();
