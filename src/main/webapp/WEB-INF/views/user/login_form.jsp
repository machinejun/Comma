<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>로그인 페이지</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/js/vendor/login/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="/js/vendor/login/animate/animate.css">
<link rel="stylesheet" type="text/css" href="/js/vendor/login/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="/js/vendor/login/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="/js/vendor/login/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="/js/vendor/login/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="/css/login/util.css">
<link rel="stylesheet" type="text/css" href="/css/login/main.css">
</head>

<div class="container">
	<form action="/auth/loginProc" method="post">
		<div class="container-login100">
			<div class="wrap-login100">
				<span class="login100-form-title p-b-26"> Welcome </span> <span class="login100-form-title p-b-48"> <i class="zmdi zmdi-font"></i>
				</span>

				<div class="wrap-input100 validate-input" data-validate="Valid username is: a@b.c">
					<input class="input100" type="text" name="username"> <span class="focus-input100" data-placeholder="username"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate="Enter password">
					<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
					</span> <input class="input100" type="password" name="password"> <span class="focus-input100" data-placeholder="Password"></span>
				</div>

			</div>
		</div>

	</form>
	<div class="container-login100-form-btn">
		<div class="wrap-login100-form-btn">
			<div class="login100-form-bgbtn"></div>
			<button type="submit" class="login100-form-btn">Login</button>
		</div>
	</div>

	<div class="text-center p-t-115">
		<span class="txt1"> Don’t have an account? </span> <a class="txt2" href="/auth/join_form"> Sign Up </a>
	</div>
</div>


<script src="/js/vendor/login/jquery/jquery-3.2.1.min.js"></script>
<script src="/js/vendor/login/animsition/js/animsition.min.js"></script>
<script src="/js/vendor/login/bootstrap/js/popper.js"></script>
<script src="/js/vendor/login/bootstrap/js/bootstrap.min.js"></script>
<script src="/js/vendor/login/select2/select2.min.js"></script>
<script src="/js/vendor/login/daterangepicker/moment.min.js"></script>
<script src="/js/vendor/login/daterangepicker/daterangepicker.js"></script>
<script src="/js/vendor/login/countdowntime/countdowntime.js"></script>
<script src="/js/login/main.js"></script>