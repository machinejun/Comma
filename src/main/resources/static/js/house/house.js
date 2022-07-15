let index = {
	init: function() {
		$("#like").bind("click", () => {
			this.addWishList();
		})
	},

	addWishList: function() {

		// 게시물 번호(no)를 idx로 전달받아 저장합니다.
		let id = $("#house-id").val();
		console.log("houseId : " + id);
		console.log(document.getElementById("like").className);
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
				.fail(function() {
				});

			console.log("꽉찬하트로 바껴라!");

			// 꽉찬하트로 바꾸기
			document.getElementById("like").className = "bi bi-suit-heart-fill";

			// 꽉찬 하트를 눌렀을 때
		} else if ($("#like").attr("class") == "bi bi-suit-heart-fill") {
			console.log("꽉찬하트 클릭");

			$.ajax({
				url: "/api/house/wishList/" + id,
				type: "DELETE",
			})
			.done(function() {
				console.log("위시리스트 삭제");
			})
			.fail(function() {
			});
			console.log("빈하트로 바껴라!");

			// 빈하트로 바꾸기
			document.getElementById("like").className = "bi bi-suit-heart";
		}

	}
}

index.init();

/*
// 로그인 안한 상태에서 하트를 클릭하면 로그인해야한다는 알림창이 뜹니다.
// (로그인한 상태인 하트의 <a></a> class명: heart-notlogin)
$(".heart-notlogin").unbind('click');
$(".heart-notlogin ").click(function() {
	alert('로그인 후 이용 가능한 서비스입니다.');
});
	}
}
*/



