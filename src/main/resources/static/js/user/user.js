let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {

	init: function() {
		$("#btn-update").bind("click", () => {
			this.update();
		})

	},

	update: function() {
		let rePassword = $("#re-password").val();
		let loginType = $("#loginType").val();

		let data = {
			id: $("#user-id").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			email: $("#email").val(),
			phoneNumber: $("#phoneNumber").val()
		}

		
		if (loginType == "ORIGIN" && data.password != rePassword) {
			alert("입력하신 비밀번호가 일치하지 않습니다.");
		} else if (loginType == "ORIGIN" && (data.password == "" || data.password.trim() == "" ||
			rePassword == "" || rePassword.trim() == "")) {
			alert("비밀번호를 입력하세요.");
		} else if (data.phoneNumber.indexOf("-") != -1) {
			alert("하이픈(-)을 제외한 번호를 입력해주세요.");
		} else if(data.phoneNumber.length != 11) {
			alert("휴대폰 번호 11자리를 입력해주세요.");
		} else if(data.phoneNumber.charAt(0) != 0 || data.phoneNumber.charAt(1) != 1 || data.phoneNumber.charAt(2) != 0) {
			alert("휴대폰 번호의 형식은 010으로 시작해야 합니다.");
		} else {
			$.ajax({
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},

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

function alertMessage(title, text, icon) {
	Swal.fire(
		title,
		text,
		icon
	)
}

index.init();