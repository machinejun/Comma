<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<head>
<title>로그인 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="/css/login/util.css">
<link rel="stylesheet" type="text/css" href="/css/login/main.css">
</head>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">
			<form action="/auth/loginProc" method="post" class="login100-form validate-form">
				<span class="login100-form-title p-b-26"> Welcome </span> <span class="login100-form-title p-b-48"> <i class="zmdi zmdi-font"></i>
				</span>

				<div class="wrap-input100 validate-input" data-validate="Valid email is: a@b.c">
					<input class="input100" type="text" name="username" value="test"> <span class="focus-input100" data-placeholder="Username"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate="Enter password">
					<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
					</span> <input class="input100" type="password" name="password" value="1234"> <span class="focus-input100" data-placeholder="Password"></span>
				</div>

				<div class="container-login100-form-btn">
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn">Login</button>
					</div>
				</div>

				<div class="text-center p-t-115">
					<span class="txt1"> 계정이 없으신가요? </span> <a class="txt2" href="/auth/join_form"> 가입하기 </a>
				</div>
			</form>
		</div>
	</div>
</div>

<div></div>

<script src="/js/login/main.js"></script>