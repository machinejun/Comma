<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>

<div class="container">
		<form action="/auth/joinProc" method="post"> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  <div class="form-group">
    <label for="username">user name:</label>
    <input type="text" class="form-control" placeholder="Enter username" id="username" name="username">
  </div>
  <div class="form-group">
    <label for="password">Password:</label>
    <input type="password" class="form-control" placeholder="Enter password" id="password" name="password">
  </div>
  
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email" name="email">
  </div>
  
    <div class="form-group">
    <label for="phoneNumber">phoneNumber:</label>
    <input class="form-control"  id="phoneNumber" name="phoneNumber">
  </div>
  
  <button id="btn-save"  type="submit" class="btn btn-primary" >회원가입</button>
</form>
	</div>
	<br/>

<!-- <script src="/js/user.js"></script> -->
=======
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<head>
	<title>회원가입 페이지</title>
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
			<form action="/auth/joinProc" method="post"
				class="login100-form validate-form">
				<span class="login100-form-title p-b-26"> 회원가입 </span> <span
					class="login100-form-title p-b-48"> <i
					class="zmdi zmdi-font"></i>
				</span>

				<div class="wrap-input100 validate-input"
					data-validate="Valid email is: a@b.c">
					<input class="input100" type="text" name="username"> <span
						class="focus-input100" data-placeholder="Username"></span>
				</div>

				<div class="wrap-input100 validate-input"
					data-validate="Enter password">
					<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
					</span> <input class="input100" type="password" name="password"> <span
						class="focus-input100" data-placeholder="Password"></span>
				</div>
				
				<div class="wrap-input100 validate-input"
					data-validate="Enter password">
					<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
					</span> <input class="input100" type="email" name="email"> <span
						class="focus-input100" data-placeholder="Email"></span>
				</div>
				
				<div class="wrap-input100 validate-input"
					data-validate="Enter password">
					<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
					</span> <input class="input100" type="text" name="phoneNumber"> <span
						class="focus-input100" data-placeholder="Phone Number"></span>
				</div>

				<div class="container-login100-form-btn">
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn">Join</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>

<div id="dropDownSelect1"></div>

<script src="/vendor/login/jquery/jquery-3.2.1.min.js"></script>
<script src="/vendor/login/animsition/js/animsition.min.js"></script>
<script src="/vendor/login/bootstrap/js/popper.js"></script>
<script src="/vendor/login/bootstrap/js/bootstrap.min.js"></script>
<script src="/vendor/login/select2/select2.min.js"></script>
<script src="/vendor/login/daterangepicker/moment.min.js"></script>
<script src="/vendor/login/daterangepicker/daterangepicker.js"></script>
<script src="/vendor/login/countdowntime/countdowntime.js"></script>
<script src="/js/login/main.js"></script>
>>>>>>> feature_login
