<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<title>회원가입 페이지</title>
<<<<<<< HEAD

=======
>>>>>>> 108973e8f0937ee0e0831ea7aeea43b644353260

<style>
body {
	min-height: 70vh;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 20px;
	margin: auto;
	background: #f8f9fa;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.2);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.2);
	background: #f8f9fa;
}

.custom-control-input {
	width: 20px;
	height: 20px;
}
</style>
</head>

<body>
	<div class="container" style="align-items: center;">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h3 class="mb-3">Join</h3>
				<br>
				<form action="/auth/joinProc" method="post" onsubmit="return joinCheck()" class="needs-validation" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">아이디</label> <input type="text" class="form-control" id="username" name="username" required> <input type="hidden" id="checkUsername" value="">
							<div class="invalid-feedback">아이디를 입력하세요.</div>
						</div>
					</div>
					<div>
						<button id="btn-checkUsername" class="btn btn-primary btn-sm" type="button">중복체크</button>
					</div>
					<br>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">비밀번호</label> <input type="password" class="form-control" id="password" name="password" required>
							<div class="invalid-feedback">비밀번호를 입력하세요.</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">비밀번호 재확인</label> <input type="password" class="form-control" id="password-check" name="password-check" required> <input type="hidden" id="checkPassword" value="">
							<div class="invalid-feedback password">비밀번호를 한 번 더 입력하세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
						<div class="invalid-feedback">이메일을 입력하세요.</div>
					</div>

					<div class="mb-3">
						<label for="phoneNumber">Phone Number</label> <input type="number"
							class="form-control" id="phoneNumber"
							placeholder="하이픈(-)을 제외하고 입력하세요." name="phoneNumber" required>
						<div class="invalid-feedback">전화번호를 입력하세요.</div>
					</div>

					<br>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement" required> <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
						<div class="invalid-feedback">약관에 동의하셔야 합니다.</div>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary" type="submit">가입 하기</button>
				</form>
			</div>
		</div>
	</div>
<<<<<<< HEAD

	<script type="text/javascript" src="/js/main.0cf8b554.js"></script></body>
	<script type="text/javascript" src="/js/home.js"></script></body>

	<br>
	<br>


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
=======
</body>
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

	$("#btn-checkUsername").bind("click", function() {
		let data = {
			username : $("#username").val()
		}

		console.log(data.username);

		$.ajax({
			type : "POST",
			url : "/auth/username-check",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			dataType : "json"
		}).done(function(response) {
			console.log(response)
			if (response.data.username != null) {
				$("#checkUsername").text("사용 불가");
			} else {
				$("#checkUsername").text("사용 가능");
			}
		}).fail(function(error) {
			console.log(error);
		});

	});

	function joinCheck() {
		let password = $("#password").val();
		let passwordCheck = $("#password-check").val();

		if (password != "" || passwordCheck != "") {
			if (password != passwordCheck) {
				alert("입력하신 비밀번호가 일치하지 않습니다.")
				return false;
			}
		} else if ($("#checkUsername").text() == "사용 불가"
				|| $("#checkUsername").text() == "") {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}

	}
</script>
<%@ include file="../layout/footer.jsp"%>
>>>>>>> 108973e8f0937ee0e0831ea7aeea43b644353260
