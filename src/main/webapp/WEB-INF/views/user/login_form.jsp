<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/user/util.css" />
<link rel="stylesheet" type="text/css" href="/css/user/main.css" />
<%@ include file="../layout/header.jsp"%>
<title>로그인 페이지</title>
<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">
			<div class="login100-pic js-tilt" data-tilt>
				<img src="/assets/images/img-01.png" alt="IMG" />
			</div>

			<form class="login100-form validate-form" action="/user/loginProc"
				method="post" class="needs-validation" novalidate>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
				<span class="login100-form-title"> Member Login </span>

				<div class="wrap-input100 validate-input"
					data-validate="아이디를 입력하세요">
					<input class="input100" type="text" name="username"
						placeholder="username" value="test" /> <span
						class="focus-input100"></span> <span class="symbol-input100">
						<i class="fa fa-user" aria-hidden="true"></i>
					</span>
				</div>

				<div class="wrap-input100 validate-input"
					data-validate="비밀번호를 입력하세요">
					<input class="input100" type="password" id="password"
						name="password" required placeholder="Password" value="12345678" /> <span
						class="focus-input100"></span> <span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>

				<div class="container-login100-form-btn">
					<button type="submit" class="login100-form-btn" style="margin-right: 25px;">Login</button>
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=485a62ce5a393a9978ea206241668428&redirect_uri=http://localhost:9090/auth/kakao/login_proc&response_type=code" class="login100-form-btn" style="background-image: Url('/assets/kakao_login_large.png'); background-position: center; background-size: cover;"></a>
				</div>
				<br />

				<div class="text-center p-t-50">
					<h4>
						<a class="txt2" href="/user/join_form" style="font-size: 15px;"> 계정이 없으신가요? </a><br>
					</h4>
				</div>
			</form>
		</div>
	</div>
</div>

<script>

</script>

<script src="/js/user/user.js"></script>
<%@ include file="../layout/footer.jsp"%>