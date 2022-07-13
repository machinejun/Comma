<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<<<<<<< HEAD

=======
<title>회원가입 페이지</title>
>>>>>>> e45826e2ca8d287956ab050537f27d088be68253

<style>
body {
	min-height: 70vh;
}

.input-form {
	max-width: 680px;
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

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h3 class="mb-3">Join</h3><br>
				<form action="/auth/joinProc" method="post" class="needs-validation"
					novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">Username</label> <input type="text"
								class="form-control" id="name" name="username" required>
							<div class="invalid-feedback">아이디를 입력하세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">Password</label> <input type="password"
								class="form-control" id="password" name="password" required>
							<div class="invalid-feedback">비밀번호를 입력하세요.</div>
						</div>
					</div>

					<div class="mb-3">
<<<<<<< HEAD
						<label for="email">Email</label> <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
=======
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" placeholder="you@example.com"
							required>
>>>>>>> e45826e2ca8d287956ab050537f27d088be68253
						<div class="invalid-feedback">이메일을 입력하세요.</div>
					</div>

					<div class="mb-3">
<<<<<<< HEAD
						<label for="phoneNumber">Phone Number</label> <input type="tel" class="form-control" id="phoneNumber" placeholder="하이픈(-)을 제외하고 입력하세요." name="phoneNumber" required>
=======
						<label for="phoneNumber">Phone Number</label> <input type="number"
							class="form-control" id="phoneNumber"
							placeholder="하이픈(-)을 제외하고 입력하세요." name="phoneNumber" required>
>>>>>>> e45826e2ca8d287956ab050537f27d088be68253
						<div class="invalid-feedback">전화번호를 입력하세요.</div>
					</div>
					<br>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
						<div class="invalid-feedback">약관에 동의하셔야 합니다.</div>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						하기</button>
				</form>
			</div>
		</div>
	</div>
<<<<<<< HEAD
	<script type="text/javascript" src="/js/main.0cf8b554.js"></script></body>
	<script type="text/javascript" src="/js/home.js"></script></body>
=======
	<br>
	<br>

>>>>>>> e45826e2ca8d287956ab050537f27d088be68253
	<script>
		/* validation 체크 필요 */
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						let forms = document
								.getElementsByClassName('needs-validation');
						let validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
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
	<%@ include file="../layout/footer.jsp"%>