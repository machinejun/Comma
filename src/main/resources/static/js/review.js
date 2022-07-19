
let index = {

	init: function() {
		$("#btn-update").bind("click", () => {
			this.update();
		});

		$("#btn-delete").bind("click", () => {
			this.delete();
		});

		$("#prev").bind("click", () => {
			this.prevPage();
		});

		$("#next").bind("click", () => {
			this.nextPage();
		});

	},

	update: function() {
		let reviewId = $("#review-id").val();

		let data = {
			content: $("#content").val()
		}

		$.ajax({
			type: "PUT",
			url: "/review/" + reviewId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response) {
			if (response.data.content == "" || response.data.content.trim() == "") {
				alert("내용을 입력하세요.")
			} else {
				alert("댓글이 수정되었습니다.")
			}
		}).fail(function(error) {
			alert("댓글이 수정되지 않았습니다.");
			console.log(error);
		});

	},

	delete: function() {
		let reviewId = $("#review-id").val();
		let houseId = $("#house-id").val();
		let deleteCheck = confirm("삭제하시겠습니까?");
		console.log(reviewId);

		if (deleteCheck) {
			$.ajax({
				type: "DELETE",
				url: "/review/" + reviewId,
			}).done(function(response) {
				if (response.status == 200) {
					//alert("리뷰가 삭제되었습니다.");
					location.href = "/house/detail/" + houseId;
				} else {
					alert("리뷰가 삭제되지 않았습니다.");
				}
			}).fail(function(error) {
				alert("리뷰가 삭제되지 않았습니다.");
				console.log(error);
			});
		}
	},

	prevPage: function() {
		let pageNumber = $("#pageNumber").val();
		let houseId = $("#house-id").val();

		//console.log(pageNumber);

		$.ajax({
			type: "GET",
			url: "/api/house/" + houseId + "?page=" + (pageNumber - 1),
			dataType: "json"
		}).done(function(response) {
			changeReviewPage(response);
		}).fail(function(error) {
			console.log(error);
		});

	},

	nextPage: function() {
		let pageNumber = parseInt($("#pageNumber").val()) + 1;
		let houseId = $("#house-id").val();
		console.log(pageNumber);

		$.ajax({
			type: "GET",
			url: "/api/house/" + houseId + "?page=" + pageNumber,
			dataType: "json"

		}).done(function(response) {
			console.log(response);
			changeReviewPage(response);
		}).fail(function(error) {
			console.log(error);
		});

	}
}

function changeReviewPage(reviews) {
	let principalId = $("#principal-id").val();
	let reviewBox = document.getElementById("review-box");


	for (var i = 0; i < reviews.content.length; i++) {

		while (reviewBox.hasChildNodes()) {
			reviewBox.removeChild(reviewBox.firstChild);
		}

		let review = reviews.content[i];
		console.log("아이템 확인 : " + review);

		let reviewItem =+ `<div class="row" id="review-content">
					<!-- 게스트의 리뷰 -->
					<div class="col-lg-4 mb-5 mb-lg-0" id="bodyContents" style="height: 240px; margin-right: 120px;">
						<input type="hidden" id="review-id" value="${review.id}">
						<div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"></div>
						<h3>${review.guestId.username}</h3>
						<p class="multiLine">${review.content}</p>
						<div>
							<a class="text-decoration-none" data-toggle="modal" data-target="#review-modal" style="cursor: pointer;"> 더 보기 </a>
						</div>
					</div>
				</div>
				<div class="modal" id="review-modal">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">

							<div class="modal-header">
								<h5>
									<b>📝 리뷰 상세보기</b>
								</h5>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<div class="modal-body">
								<h3>${review.guestId.username}</h3>
								<p>${review.content}</p>
								<c:if test="${review.guestId.id == principalId}">
									<button class="btn btn-outline-danger btn-sm float-right" style="margin-left: 10px;" id="btn-delete">삭제</button>
									<a class="btn btn-outline-primary btn-sm float-right" id="btn-update" href="/review/update_form/${review.id}">수정</a>
									<br>
								</c:if>
								<hr>
								<h5>
									<b>호스트의 댓글</b>
								</h5>
								<c:forEach var="reply" items="${review.replies}">
									<p>${review.replies.content}</p>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>`;

		// reviewBox.append(reviewItem);
		$("#review-box").append(reviewItem);

	}
}

index.init();
