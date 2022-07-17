<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/css/style.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<%@ include file="../layout/header.jsp"%>

<section>
	<div class="container">
		<h2>나의 숙소 정보 수정</h2>
		<br> <br>
		<form action="/house/update/${house.id}" enctype="multipart/form-data" method="post">
			<div class="form-group">
				<div class="form-group">
					<label for="name"><b>이름</b></label> <input type="text" class="form-control" id="name" name="name" value="${house.name}" />
				</div>
				<br>
				<c:set var="selected" value="selected"></c:set>
				<c:set var="notSelected" value=""></c:set>
				<c:set var="selectedAddress" value="${house.address}"></c:set>
				<div class="form-group">
					<label><b>지역</b></label> <select class="form-control" name="address">
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
				<c:set var="selectedtype" value="${house.type}"></c:set>
					<label><b>숙소 유형</b></label> <select class="form-control" name="type">
						<option ${selectedtype eq '호텔' ? selected : notSelected}>호텔</option>
						<option ${selectedtype eq '모텔' ? selected : notSelected}>모텔</option>
						<option ${selectedtype eq '펜션' ? selected : notSelected}>펜션</option>
						<option ${selectedtype eq '게스트 하우스' ? selected : notSelected}>게스트 하우스</option>
					</select>
				</div>
				<br>
				<div class="form-group">
					<label for="price"><b>숙박 가격 (1인 / 1박 기준)</b></label> <input type="text" class="form-control" name="oneDayPrice" value="${house.oneDayPrice}" />
				</div>
				<br> <label><b>사진 등록</b></label>
				<div class="custom-file">
					<input type="file" name="file" class="custom-file-input" required="required" value="http://localhost:9090/upload/${house.image.imageUrl}" /> <label class="custom-file-label">파일을 선택하세요</label>
				</div>
				<br> <br>
				<div class="form-group">
					<br /> <label for="infoText"><b>숙소 소개</b></label>
					<textarea class="form-control summernote" rows="10" name="infoText">${house.infoText}</textarea>
				</div>
			</div>
			<br>
			<button type="submit" class="btn btn-primary" id="btn-update">수정</button>
		</form>
	</div>
</section>

<script>
	$(".custom-file-input").on(
			"change",
			function() {
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});

	$('.summernote').summernote({
		tabsize : 2,
		height : 300,
		toolbar : []
	});
</script>

<%@ include file="../layout/footer.jsp"%>