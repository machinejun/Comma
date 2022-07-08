<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>

<br />
<br />
<div class="container">
	<h2>리뷰 등록</h2>
	<p>숙소가 어땠는지 알려주세요 !</p>
	<form action="/house/image/upload" enctype="multipart/form-data" method="post">
		<div class="form-group">
			<div class="form-group">
				<label for="name"><b>이름</b></label> <input type="text" class="form-control" id="name" disabled="disabled" />
			</div>
			<label><b>사진 등록</b></label>
			<div class="custom-file">
				<input type="file" name="file" class="custom-file-input" id="customFile" required="required" /> <label class="custom-file-label">파일을 선택하세요</label>
			</div>
			<div class="form-group">
				<br /> <label for="infoText"><b></b></label>
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
<script src="/js/house/house.js"></script>
<%@ include file="../layout/footer.jsp"%>