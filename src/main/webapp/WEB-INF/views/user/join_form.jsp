<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form action="/auth/joinProc" method="post" class="validation-form"
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
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" placeholder="you@example.com"
							required>
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
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						하기</button>
				</form>
			</div>
		</div>
	</div>