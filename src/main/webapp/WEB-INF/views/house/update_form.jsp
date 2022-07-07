<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>

<br />
<br />
<div class="container">
	<input type="hidden" id="house-id" value="${house.id}">
	<h2>나의 숙소 정보 수정</h2>
	<p>나의 숙소 사진을 등록하고 소개해주세요 !</p>
	<form action="#">
		<div class="form-group">
			<div class="form-group">
				<label for="username">이름</label> <input type="text" class="form-control" id="username">
			</div>
			<div class="form-group">
				<label for="sel1">지역</label> <select class="form-control" id="sel1">
					<option>서울</option>
					<option selected>부산</option>
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
			<div class="form-group">
				<label><b>숙소 유형</b></label> <select class="form-control" id="sel1" name="type">
					<option>호텔</option>
					<option>모텔</option>
					<option>펜션</option>
					<option>게스트하우스</option>
				</select>
			</div>
			<div class="form-group">
				<label for="price"><b>숙박 가격 (1인 / 1박 기준)</b></label> <input type="text" name="name" class="form-control" id="price" />
			</div>
			<label><b>사진 등록</b></label>
			<div class="custom-file">
				<input type="file" name="file" class="custom-file-input" id="imageFile" /> <label class="custom-file-label" for="imageFile">Choose file</label>
			</div>
			<div class="form-group">
				<br /> <label for="infoText"><b>숙소 소개</b></label>
				<textarea class="form-control" rows="10" name="infoText" id="infoText"></textarea>
			</div>
		</div>
		<button type="submit" class="btn btn-primary" id="btn-register">수정</button>
	</form>
</div>

<script>
	$(".custom-file-input").on(
			"change",
			function() {
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});
</script>
<%@ include file="../layout/footer.jsp"%>