<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<head>
<title>로그인 페이지</title>
<style>
body {
	min-height: 70vh;
}

.input-form {
	max-width: 600px;
	margin-top: 80px;
	padding: 32px;
	background: #f8f9fa;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.2);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.2)
}
</style>
</head>

<div class="container">
	<div class="input-form-backgroud row justify-content-center">
		<div class="input-form col-md-12 mx-auto">
			<form action="/auth/loginProc" method="post" class="needs-validation" novalidate>
				<h3 class="mb-3">Welcome</h3>
				<br>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="name">Username</label> <input type="text"
							class="form-control" id="name" name="username" required>
						<div class="invalid-feedback">아이디를 입력하세요.</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="name">Password</label> <input type="password"
							class="form-control" id="password" name="password" required>
						<div class="invalid-feedback">비밀번호를 입력하세요.</div>
					</div>
				</div>
				<br>
				<div class="mb-4">
					<button class="btn btn-primary btn-block">Login</button>
				</div>
				<div class="text-center p-t-115">
					<span class="txt1"> 계정이 없으신가요? </span> <a class="txt2"
						href="/auth/join_form"> 가입하기 </a>
				</div>
			</form>
		</div>
	</div>
</div>

<div></div>
<script type="text/javascript" src="/js/main.0cf8b554.js"></script></body>
<script type="text/javascript" src="/js/home.js"></script></body>
<script src="/js/login/main.js"></script>
<br>
<br>
<script>
	(function() {
		'use strict';
		window.addEventListener('load', function() {
			let forms = document.getElementsByClassName('needs-validation');
			let validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>
<script src="/js/login/main.js"></script>
<%@ include file="../layout/footer.jsp"%>
