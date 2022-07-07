
let index = {
	
	init: function() {
		$("#btn-register").bind("click", () => {
			this.register();
		})
	},
	
	register: function() {
		let data = {
			name: $("#name").val(),
			address: $("#address").val(),
			type: $("#type").val(),
			oneDayPrice: $("#oneDayPrice").val(),
			infoText: $("#infoText").val(),
		}
		
		$.ajax({
			type: "POST",
			url: "/api/house/register",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
		.done(function (response) {
			if(data.name == "" || data.name.trim() == ""){
				alert("이름을 입력해주세요.")
			} else {
				if(data.infoText == "" || data.infoText.trim() == "") {
					alert("소개글을 입력해주세요.")
				} else {
					alert("나의 숙소가 등록되었습니다.");
				}				
			}
		})
		.fail(function (error) {
			alert("숙소가 등록되지 않았습니다.");
			console.log(error);
		});
	}
}

index.init();