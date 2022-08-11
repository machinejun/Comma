<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/review/review.css" rel="stylesheet">

<br />
<br />
<div class="container">
	<h2>리뷰 등록</h2>
	<p>즐거운 여행 되셨나요?</p>
	<br>
	<form>
		<div class="form-group">
			<div class="form-group">
				<input type="hidden" id="house-id" value="${reservation.houseId.id}"> <input type="hidden" id="guest-id" value="${principal.user.id}"> <input type="hidden" value="" id="house-id"> <label
					for="name"><b>숙소명</b></label> <input type="text" class="form-control" id="name" disabled="disabled" value="${reservation.houseId.name}" />
			</div>
			<div class="form-group">
				<label for="name"><b>숙박 기간</b></label> <input type="text" class="form-control" id="name" disabled="disabled" value="${reservation.checkInDate} ~ ${reservation.checkOutDate}" />
			</div>

			<label><b>만족도</b></label>
			<div class="form-group star-rating">
				<input type="radio" id="5-stars" name="rating" value="5" /> <label for="5-stars">⭐</label> <input type="radio" id="4-stars" name="rating" value="4" /> <label for="4-stars">⭐</label> <input type="radio" id="3-stars"
					name="rating" value="3" /> <label for="3-stars">⭐</label> <input type="radio" id="2-stars" name="rating" value="2" /> <label for="2-stars">⭐</label> <input type="radio" id="1-star" name="rating" value="1" /> <label
					for="1-star">⭐</label>
			</div>

			<div class="form-group">
				<textarea class="form-control summernote" rows="10" id="content"></textarea>
			</div>

		</div>
		<button type="button" onclick="postReview()" class="custom-sm-btn" id="btn-save">등록</button>
	</form>
</div>
<script>

function postReview() {
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	
	let starScore;
	let starLength = document.getElementsByName("rating").length;
	let houseId = document.getElementById("house-id").value;
	let guestId = document.getElementById("guest-id").value;
	console.log(guestId);
	  
     for (let i=0; i < starLength; i++) {
         if (document.getElementsByName("rating")[i].checked == true) {
             starScore = document.getElementsByName("rating")[i].value;
         }
     }

	let data = {
		content: document.querySelector("#content").value,
		starScore: starScore
	}
	if(data.content == "" || data.content.trim() === "") {
		alert("내용을 입력하세요.");
	} else if (starScore === 0) {
		alert("별점을 선택하세요.");
	} else {
		console.log(data.starScore);
		fetch("/api/review/post/" + houseId, {
			method: "post",
			headers: {
				"X-XSRF-TOKEN": token,
				'content-type': 'application/json; charset=utf-8'
			},
			body: JSON.stringify(data)
		})
		.then(res => {
			if(res.status == 200) {
				alert("리뷰 등록이 완료되었습니다.");				
				location.href = "/guest/my-review-list/" + guestId;			
			}
		});
	}
}

$(".custom-file-input").on(
		"change",
		function() {
			var fileName = $(this).val().split("\\").pop();
			$(this).siblings(".custom-file-label").addClass("selected")
					.html(fileName);
		});

$('.summernote').summernote({
	tabsize : 2,
	height : 350,
	toolbar : [],
	placeholder : "숙소의 청결도, 위치, 호스트와의 의사소통에 대한 솔직한 후기를 남겨주세요."
});

</script>
<%@ include file="../layout/footer.jsp"%>
