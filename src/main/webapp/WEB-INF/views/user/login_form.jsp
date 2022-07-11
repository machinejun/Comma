<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="/auth/loginProc"  method="post">
<div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('images/bg_1.jpg');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>Sign In</h3>
              
            </div>
              <div class="form-group first">
                <label for="username">Username</label>
                <input type="text" class="form-control"  name="username">

              </div>
              <div class="form-group last mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password">
                
              </div>


</div>
</div>
</div>
              </div>
              </div>
  </form>
              <button type="submit" id="btn-login" class="btn btn-primary">log in</button>
  
   <script src="/js/user.js"></script>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<form action="/auth/loginProc" method="post"
				class="login100-form validate-form">
				<span class="login100-form-title p-b-26"> Welcome </span> <span
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

				<div class="container-login100-form-btn">
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn">Login</button>
					</div>
				</div>

				<div class="text-center p-t-115">
					<span class="txt1"> 계정이 없으신가요? </span> <a class="txt2"
						href="#"> 가입하기 </a>
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
