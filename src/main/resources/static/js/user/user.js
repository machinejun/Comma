
let index = {

	init: function() {
		$("#btn-update").bind("click", () => {
			this.update();
		}),
		
		$("#btn-search").bind("click", () => {
			this.search();
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
	},
	
	search: function() {
		let data = {
			id: $("#user-id").val(),
			username: $("#username").val(),
			email: $("#email").val(),
			phoneNumber: $("#phoneNumber").val(),
			creationDate: $("#creationDate").val(),
			role:$("#role").val()
		}

		$.ajax({
			type: "GET",
			url: "/user/search",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
		.done(function(data) {
			alert("회원정보가 검색되었습니다.");
			location.href = "/user/admin_form";
		})
		.fail(function(error) {
			alert("회원정보가 존재하지 않습니다.");
			console.log(error);
		});
	}

}

index.init();