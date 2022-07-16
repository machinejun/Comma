<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css" />
<link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css" />
<link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css" />
<link rel="stylesheet" type="text/css" href="/css/user/util.css" />
<link rel="stylesheet" type="text/css" href="/css/user/main.css" />
<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">
			<div class="login100-pic js-tilt" data-tilt>
				<img src="/assets/images/img-01.png" alt="IMG" />
			</div>

			<form class="login100-form validate-form" action="/auth/loginProc" method="post" class="needs-validation" novalidate>
				<span class="login100-form-title"> Member Login </span>

				<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
					<input class="input100" type="text" name="username" placeholder="username" /> <span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-user" aria-hidden="true"></i>
					</span>
				</div>

				<div class="wrap-input100 validate-input" data-validate="Password is required">
					<input class="input100" type="password" id="password" name="password" required placeholder="Password" /> <span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-lock"
						aria-hidden="true"></i>
					</span>
				</div>

				<div class="container-login100-form-btn">
					<button type="submit" class="login100-form-btn">Login</button>
				</div>
				<br />

				<div class="text-center p-t-50">
					<h4>
						<a class="txt2" href="/auth/join_form"> 계정이 없으신가요? </a>
					</h4>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="/vendor/bootstrap/js/popper.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/vendor/select2/select2.min.js"></script>
<script src="/vendor/tilt/tilt.jquery.min.js"></script>
<script>
	$(".js-tilt").tilt({
		scale : 1.1,
	});
</script>
<script src="/js/user/main.js"></script>
<%@ include file="../layout/footer.jsp"%>
</body>
