"use strict"

let index = {
	
	init: function() {
		$("#btn-save").bind("click", () => {
			alert("btn-save 버튼이 눌러졌습니다");
		});
	},
	
	save: function() {
		let data = {
			username: $("#username").val(),
			password: $("#password").val(),
			email: $("#email").val(),
			mobile: $("#mobile").val()
		}
		
		$.ajax({
			// 서버측에 회원가입 요청
			type: "POST",
			url: "/api/guest",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json" // 응답이 왔을 때 기본 데이터 타입(Buffered 문자열) => js object 자동 변환
				
			
		}).done(function(data, textStatus, xhr){
			// 통신 성공 시
			console.log("xhr : " + xhr);
			console.log(xhr);
			console.log("textStatus : " + textStatus);
			console.log("data : " + data);
			alert("회원가입이 완료되었습니다");
			location.href = "/";
		}).fail(function(error){
			// 통신 실패 시
			console.log(error);
			alert("회원가입이 실패했습니다");
		});
	}
	
}

index.init();