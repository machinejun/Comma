<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<h2>나의 숙소 등록</h2>
	<p>나의 숙소 사진을 등록하고 소개해주세요 !</p>
	<form action="/api/house/add" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<div class="form-group">
				<label for="name"><b>이름</b></label> <input type="text" name="name" class="form-control" id="name" />
			</div>
			<div class="form-group">
				<label><b>지역</b></label> <select class="form-control" id="sel1" name="location">
					<option>서울</option>
					<option>경기도</option>
					<option>강원도</option>
					<option>충청남도</option>
					<option>충청북도</option>
					<option>전라남도</option>
					<option>전라북도</option>
					<option>부산</option>
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
			<label><b>사진 등록</b></label>
			<div class="custom-file">
				<input type="file" name="file" class="custom-file-input" id="imageFile"/> <label class="custom-file-label" for="imageFile">Choose file</label>
			</div>
			<div class="form-group">
				<br /> <label for="infoText"><b>숙소 소개</b></label>
				<textarea class="form-control" rows="10" name="infoText" id="infoText"></textarea>
			</div>
		</div>
		<button type="submit" class="btn btn-primary" id="btn-register">등록</button>
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
