let index = {
	init: function() {
		$("#like").bind("click", () => {
			this.clickHeart();
		})
	},

	clickHeart: function() {
		// 로그인 안한 상태에서 하트를 클릭하면 로그인해야한다는 알림창 뜨도록

		let data = {
			id: $("#house-id").val()
		}
		// 빈하트를 눌렀을때
		if ($("#like").attr("class") == "bi bi-suit-heart") {
			$.ajax({
				url: "/api/house/wishList",
				type: "POST",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			})
				.done(function() {
					console.log("하트추가 성공");
				})
				.fail(function(error) {
					console.log(error);
				});

			// 꽉찬하트로 바꾸기
			document.getElementById("like").className = "bi bi-suit-heart-fill";

			// 꽉찬 하트를 눌렀을 때
		} else if ($("#like").attr("class") == "bi bi-suit-heart-fill") {
			let houseId = $("#house-id").val();

			$.ajax({
				url: "/api/house/wishList/" + houseId,
				type: "DELETE",
			})
				.done(function() {
					console.log("위시리스트 삭제");
				})
				.fail(function() {
				});

			// 빈하트로 바꾸기
			document.getElementById("like").className = "bi bi-suit-heart";
		}
	}
}

index.init();