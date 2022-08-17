<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<style>
h2 {
	font-family: 'SUIT-Medium';
	color: black;
}

h2::after {
	content: ""
}

.panel-default>.panel-heading {
	color: rgba(255, 255, 255, 1);
	background-color: transparent;
	border-color: #ddd;
}

.btn-default {
	color: #838383;
	background-color: transparent;
	border-color: transparent;
}

label {
	color: #838383;
	font-size: 22px;
	margin-bottom: 10px;
}

#footer {
	position: relative;
	bottom: 0
}

.form-control:focus {
	border-color: rgba(255, 149, 149, 0.7);
	outline: 0;
	box-shadow: 0 0 10px rgba(255, 149, 149, 0.5);
}
</style>

<div class="container">

	<h2 id="pTranMsg" class="info-txt text-center">문의글 작성</h2>
	<input type="hidden" id="userId" value="${principal.user.id}"></input> <br />
	<div class="container">
		<div class="container">
			<label for="title">제목</label> <input class="form-control" type="text" id="title" name="title" value="" />
		</div>
		<br />
		<div id="dl_tel" class="container">
			<label for="content">내용</label>
			<!-- 181023_접근성 수정 추가 -->
			<div class="contentArea">
				<textarea type="text" id="content" name="content" maxlength="11" class="summernote"></textarea>
			</div>
		</div>

		<c:if test="${principal.user.role ne 'ADMIN'}">
			<div class="container">
				<br /> <span> 비밀글 check →</span> <input type="checkbox" id="secret-check" name="moblAgree" class="m-2">
			</div>
		</c:if>
	</div>

	<button type="button" class="custom-sm-btn float-right" onclick="writeBoard()">
		<span>저장</span>
	</button>
	<br /> <br /> <br /> <br /> <br />
</div>

<script src="/js/customerService/board.js"></script>
<%@ include file="../layout/footer.jsp"%>