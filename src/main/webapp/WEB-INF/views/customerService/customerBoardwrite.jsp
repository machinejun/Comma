<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<style>
h2 {
	font-family: 'SUIT-Medium';
	color: rgba(255,149,149,0.7) ; 
}
h2::after {
	content: ""
}
.panel-default>.panel-heading {
    color: rgba(255,255,255,1);
    background-color: rgba(255,149,149,0.3) ;
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
</style>



<div class="container">
	<h2 id="pTranMsg" class="info-txt text-center">게시글 작성</h1>
	<input type="hidden" id="userId" value="${principal.id}"></input>
	<br/>
	<div class="container">
		<div class="container">
			<label for="indvdlNm">제목</label>
			<input class ="form-control" type="text" id="title" name="title" />
		</div>
		<br/>
		<div id="dl_tel" class="container">
			<label for="moblPhon">내용</label><!-- 181023_접근성 수정 추가 -->
			<div class="contentArea"><textarea type="text" id="content" name="moblPhon" maxlength="11" class="summernote"></textarea></div>
		</div>		
	</div>
	<div class="container">
		<div class="container">
			<br/>
			<span> 비밀글 check →</span>
			<input type="checkbox" id="secret-check" name="moblAgree" class="m-2">
		</div>
		<div class="container" id="write-password-box" type="hidden">
			<br/>
			<span>비밀번호</span><input type="password" id="write-password" name="write-password" class="form-control">
			<br/>
		</div>		
	</div>
	<button type="button" class="custom-sm-btn float-right" onclick="writeBoard()"><span>글 작성</span></button>
	<br/><br/><br/><br/><br/>
</div>

<script src="/js/customerService/board.js"></script>
<%@ include file="../layout/footer.jsp" %>