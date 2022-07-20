
let index = {

	init: function() {
		$("#btn-update").bind("click", () => {
			this.update();
		})

	},

	update: function() {
		let rePassword = $("#re-password").val();

		let data = {
			id: $("#user-id").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			email: $("#email").val(),
			phoneNumber: $("#phoneNumber").val()
		}

		if (data.password != rePassword) {
			alert("입력하신 비밀번호가 일치하지 않습니다.");
		} else if (data.password == "" || data.password.trim() == "" ||
			rePassword == "" || rePassword.trim() == "") {
			alert("비밀번호를 입력하세요.");
		} else {
			$.ajax({
				type: "PUT",
				url: "/user/update",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(data) {
				if (data.status == 200) {
					alert("회원정보 수정이 완료되었습니다.");
					location.href = "/";
				} else {
					alert("회원정보 수정이 완료되지 않았습니다.");
				}
			}).fail(function(error) {
				alert("회원정보 수정이 완료되지 않았습니다.");
				console.log(error);
			});
		}

	}

}

index.init();