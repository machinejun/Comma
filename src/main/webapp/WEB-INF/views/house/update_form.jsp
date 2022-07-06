<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<h2>나의 숙소 정보 수정</h2>
	<p>나의 숙소 사진을 등록하고 소개해주세요 !</p>
	<form action="#" >
		<div class="form-group">
			<div class="form-group">
				<label for="usr">이름</label> <input type="text" class="form-control" id="usr">
			</div>
			<div class="form-group">
				<label for="sel1">지역</label> <select class="form-control" id="sel1">
					<option>서울</option>
					<option>경기도</option>
					<option>충청도</option>
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
			<label for="file">사진 등록</label>
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="imageFile" name="file"> <label class="custom-file-label" for="imageFile">Choose file</label>
			</div>
			<div class="form-group">
				<br /> <label for="comment">숙소 소개</label>
				<textarea class="infoText" rows="10" id="infoText" name="infoText"></textarea>
			</div>
		</div>
		<button type="submit" class="btn btn-primary" id="btn-update">등록</button>
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
