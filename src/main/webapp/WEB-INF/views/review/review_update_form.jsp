<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/review/review.css" rel="stylesheet">

<br />
<br />
<div class="container">
	<h2>리뷰 수정</h2>
	<p>즐거운 여행 되셨나요?</p>
	<!-- TODO 예약내역  -->
	<div class="form-group">
		<div class="form-group">
			<input type="hidden" value="${reviewEntity.id}" id="review-id"> <label for="name"><b></b></label> <input type="text" class="form-control" id="name" disabled="disabled" />
		</div>
		<div class="form-group">
			<label for="name"><b></b></label> <input type="text" class="form-control" id="name" disabled="disabled" />
		</div>

		<label><b>만족도</b></label>
		<div class="form-group star-rating">
			<input type="radio" id="5-stars" name="rating" value="5" /> <label for="5-stars">⭐</label> <input type="radio" id="4-stars" name="rating" value="4" /> <label for="4-stars">⭐</label> <input type="radio" id="3-stars"
				name="rating" value="3" /> <label for="3-stars">⭐</label> <input type="radio" id="2-stars" name="rating" value="2" /> <label for="2-stars">⭐</label> <input type="radio" id="1-star" name="rating" value="1" /> <label
				for="1-star">⭐</label>
		</div>
		<div class="form-group ">
			<textarea class="form-control summernote" id="content" rows="10">${reviewEntity.content}</textarea>
		</div>

	</div>
	<button type="button" onclick="updateReview()" class="custom-sm-btn" id="btn-update">수정</button>
</div>
<script>

function updateReview() {
	let starScore;
	let starLength = document.getElementsByName("rating").length;
	let reviewId = document.querySelector("#review-id").value;
	  
     for (let i=0; i < starLength; i++) {
         if (document.getElementsByName("rating")[i].checked == true) {
             starScore = document.getElementsByName("rating")[i].value;
         }
     }

	let data = {
		content: document.querySelector("#content").value,
		starScore: starScore
	}
	
	console.log("review Id 확인 : " + reviewId);
	console.log("데이터 확인 : " + data.content);
	console.log("별점 확인 : " + data.starScore);
	
	if(data.content == "" || data.content.trim == "") {
		alert("내용을 입력하세요.");
	} else if (starScore == 0) {
		alert("별점을 선택하세요.");
	} else {
		fetch("/review/" + reviewId, {
			method: "put",
			headers: {
				'content-type': 'application/json; charset=utf-8'
			},
			body: JSON.stringify(data)
		})
		.then(res => {
			if(res.status == 200) {
			alert("리뷰 수정이 완료되었습니다.");
			location.href = "/";
			} else {
			alert("리뷰 수정이 완료되지 않았습니다.");
			}
		});
	}
	
}

$('.summernote').summernote({
	tabsize : 2,
	height : 350,
	toolbar : [],
	placeholder : "숙소의 청결도, 위치, 호스트와의 의사소통에 대한 솔직한 후기를 남겨주세요."
});
</script>
<!-- 
<script src="/js/review.js"></script>
 -->
<%@ include file="../layout/footer.jsp"%>
