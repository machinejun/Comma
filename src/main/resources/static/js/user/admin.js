let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {

	deleteById: function(userId) {
		let deleteCheck = confirm("해당 회원을 삭제하시겠습니까?");

		if (deleteCheck) {
			$.ajax({

				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},

				type: "DELETE",
				url: "/user/delete/" + userId,
			})
				.done(function(data) {
					if (data.status) {
						alert("삭제가 완료되었습니다.");
						location.href = `/admin/user-management`;
					}
				}).fail(function(error) {
					console.log(error);
					alert("삭제가 완료되지 않았습니다.");
				});
		}
	},

	approveReport: function(reportId) {
		let approveCheck = confirm("신고를 승인하시겠습니까?");

		let data = {
			resId: reportId,
			approve: "APPROVED"
		}

		if (approveCheck) {
			$.ajax({
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},

				type: "PUT",
				url: "/admin/report-approve/" + reportId,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"

			}).done(function(response) {
				if (response.status == 200) {
					$("#report-status-" + reportId).text("");
					$("#report-status-" + reportId).text(response.data.reportStatus);
					document.getElementById('report-status-' + reportId).style.color = 'blue';
					alert("신고가 승인되었습니다.");
				}
			}).fail(function(error) {
				console.log(error);
				alert("승인에 실패했습니다.")

			});
		}

	},

	cancelReport: function(reportId) {
		let data = {
			resId: reportId,
			approve: "CANCELED"
		}

		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},

			type: "PUT",
			url: "/admin/report-cancel/" + reportId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"

		}).done(function(response) {
			if (response.status == 200) {
				$("#report-status-" + reportId).text("");
				$("#report-status-" + reportId).text(response.data.reportStatus);
				alert("해당 신고는 취소되었습니다.");
				location.reload();
			}
		}).fail(function(error) {
			alert("신고가 취소되지 않았습니다.");
			console.log(error);
		});
	}
}

index.init();