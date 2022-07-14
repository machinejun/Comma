
let index = {

	init: function() {
		$("#btn-update").bind("click", () => {
			this.update();
		})

	},

	update: function() {
		let data = {
			id: $("#user-id").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			email: $("#email").val(),
			phoneNumber: $("#phoneNumber").val()
		}

		$.ajax({
			type: "PUT",
			url: "/user/update",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
		.done(function(data) {
			alert("회원정보 수정이 완료되었습니다.");
			location.href = "/";
		})
		.fail(function(error) {
			alert("회원정보 수정이 완료되지 않았습니다.");
			console.log(error);
		});
	}

}

index.init();