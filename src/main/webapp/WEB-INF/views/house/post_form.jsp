<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">

<style>
.btn-search {
	font-size: 20px;
	text-align: center;
}

.form-control[readonly] {
	background-color: transparent;
}
</style>

<section>
	<div class="container">
		<h2>나의 숙소 등록</h2>
		<br> <br>
		<form action="/host/post-house" enctype="multipart/form-data"
			method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
			<div class="form-group">
				<div class="form-group">
					<label for="name"><b>이름</b></label> <input type="text"
						class="form-control" id="name" name="name" />
				</div>
				<br>
				<div class="form-group">
					<label><b>지역 구분</b></label> <select class="form-control"
						name="address">
						<option>서울</option>
						<option>부산</option>
						<option>대구</option>
						<option>대전</option>
						<option>경기도</option>
						<option>강원도</option>
						<option>충청도</option>
						<option>전라도</option>
						<option>경상도</option>
						<option>제주도</option>
					</select>
				</div>
				<br>
				<div class="form-group">
					<label><b>상세 주소</b> &nbsp;&nbsp;<a
						id="postcodify_search_button" class="btn-search">입력하기</a></label>
				</div>
				<div class="form-group">
					<input class="postcodify_address form-control" id="main_address"
						name="detailAddress" readonly>
				</div>
				<br>
				<div class="form-group">
					<label><b>숙소 유형</b></label> <select class="form-control"
						name="type">
						<option>오피스텔</option>
						<option>단독 주택</option>
						<option>다세대 주택</option>
						<option>아파트</option>
						<option>게스트 하우스</option>
						<option>기타</option>
					</select>
				</div>
				<br>
				<div class="form-group">
					<label><b>최대 수용 인원</b></label><input type="number"
						class="form-control" name="capacity" value="1" />
				</div>
				<br>
				<div class="form-group">
					<label for="price"><b>숙박 가격 (1인 / 1박 기준)</b></label> <input
						type="number" class="form-control" name="oneDayPrice" />
				</div>
				<br> <label><b>사진 등록</b></label>
				<div class="custom-file">
					<input type="file" name="file" class="custom-file-input"
						required="required" /> <label class="custom-file-label">파일을
						선택하세요</label>
				</div>
				<br> <br>
				<div class="form-group">
					<br /> <label for="infoText"><b>숙소 소개</b></label>
					<textarea class="form-control summernote" rows="10" name="infoText"></textarea>
				</div>
			</div>
			<br>
			<button type="submit" class="custom-btn" id="btn-register">등록</button>
		</form>
	</div>
</section>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
	$(".custom-file-input").on(
			"change",
			function() {
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});
</script>

<%@ include file="../layout/footer.jsp"%>