<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/css/style.css" rel="stylesheet">
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
		<h2>나의 숙소 정보 수정</h2>
		<br> <br>
		<form action="/host/house-update/${house.id}"
			enctype="multipart/form-data" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
			<div class="form-group">
				<div class="form-group">
					<label for="name"><b>이름</b></label> <input type="text"
						class="form-control" id="name" name="name" value="${house.name}" />
				</div>
				<br>
				<c:set var="selected" value="selected"></c:set>
				<c:set var="notSelected" value=""></c:set>
				<c:set var="selectedAddress" value="${house.address}"></c:set>
				<div class="form-group">
					<label><b>지역</b></label> <select class="form-control"
						name="address">
						<option ${selectedAddress eq '서울' ? selected : notSelected}>서울</option>
						<option ${selectedAddress eq '부산' ? selected : notSelected}>부산</option>
						<option ${selectedAddress eq '대구' ? selected : notSelected}>대구</option>
						<option ${selectedAddress eq '대전' ? selected : notSelected}>대전</option>
						<option ${selectedAddress eq '경기도' ? selected : notSelected}>경기도</option>
						<option ${selectedAddress eq '강원도' ? selected : notSelected}>강원도</option>
						<option ${selectedAddress eq '충청도' ? selected : notSelected}>충청도</option>
						<option ${selectedAddress eq '전라도' ? selected : notSelected}>전라도</option>
						<option ${selectedAddress eq '경상도' ? selected : notSelected}>경상도</option>
						<option ${selectedAddress eq '제주도' ? selected : notSelected}>제주도</option>
					</select>
				</div>
				<br>
				<div class="form-group">
					<label><b>상세 주소</b> &nbsp;&nbsp;<a
						id="postcodify_search_button" class="btn-search">입력하기</a></label>
				</div>
				<div class="form-group">
					<input class="postcodify_address form-control" id="main_address"
						name="detailAddress" value="${house.detailAddress}" readonly>
				</div>
				<br>
				<div class="form-group">
					<c:set var="selectedType" value="${house.type}"></c:set>
					<label><b>숙소 유형</b></label> <select class="form-control"
						name="type">
						<option ${selectedType eq '오피스텔' ? selected : notSelected}>오피스텔</option>
						<option ${selectedType eq '단독 주택' ? selected : notSelected}>단독
							주택</option>
						<option ${selectedType eq '다세대 주택' ? selected : notSelected}>다세대
							주택</option>
						<option ${selectedType eq '아파트' ? selected : notSelected}>아파트</option>
						<option ${selectedType eq '게스트 하우스' ? selected : notSelected}>게스트
							하우스</option>
						<option ${selectedType eq '기타' ? selected : notSelected}>기타</option>
					</select>
				</div>
				<br>
				<div class="form-group">
					<label><b>최대 수용 인원</b></label><input type="number"
						class="form-control" name="capacity" value="${house.capacity}" />
				</div>
				<br>
				<div class="form-group">
					<label for="price"><b>숙박 가격 (1인 / 1박 기준)</b></label> <input
						type="text" class="form-control" name="oneDayPrice"
						value="${house.oneDayPrice}" />
				</div>
				<br> <label><b>사진 등록</b></label>
				<div class="custom-file">
					<input type="file" name="file" class="custom-file-input"
						value="${house.image.originFileName}" /> <label
						class="custom-file-label">${house.image.originFileName}</label>
				</div>
				<br> <br>
				<div class="form-group">
					<br /> <label for="infoText"><b>숙소 소개</b></label>
					<textarea class="form-control summernote" rows="10" name="infoText">${house.infoText}</textarea>
				</div>
			</div>
			<br>
			<button type="submit" class="custom-btn" id="btn-update">수정</button>
		</form>
	</div>
</section>
<br>
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

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<%@ include file="../layout/footer.jsp"%>