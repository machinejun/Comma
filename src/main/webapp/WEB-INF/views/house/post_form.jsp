<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/style.css" />

<br />
<br />
<section>
	<div class="container">
		<h2>나의 숙소 등록</h2>
		<p>나의 숙소 사진을 등록하고 소개해주세요 !</p>
		<form action="/house/post" enctype="multipart/form-data" method="post">
			<div class="form-group">
				<div class="form-group">
					<label for="name"><b>이름</b></label> <input type="text" class="form-control" id="name" name="name" />
				</div>
				<div class="form-group">
					<label><b>지역</b></label> <select class="form-control" name="address">
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
				<div class="form-group">
					<label><b>숙소 유형</b></label> <select class="form-control" name="type">
						<option>호텔</option>
						<option>모텔</option>
						<option>펜션</option>
						<option>게스트하우스</option>
					</select>
				</div>
				<div class="form-group">
					<label for="price"><b>숙박 가격 (1인 / 1박 기준)</b></label> <input type="text" class="form-control" name="oneDayPrice" />
				</div>
				<label><b>사진 등록</b></label>
				<div class="custom-file">
					<input type="file" name="file" class="custom-file-input" required="required" /> <label class="custom-file-label">파일을 선택하세요</label>
				</div>
				<div class="form-group">
					<br /> <label for="infoText"><b>숙소 소개</b></label>
					<textarea class="form-control" rows="10" name="infoText"></textarea>
				</div>
			</div>
			<button type="submit" class="btn btn-primary" id="btn-register">등록</button>
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
</script>
