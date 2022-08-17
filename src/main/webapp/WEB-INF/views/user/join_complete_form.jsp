<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css" />
<link rel="stylesheet" href="/css/user/style.css" />
<link href="/css/house/list.css" rel="stylesheet">

<style>
.container-signup {
	width: 800px;
	background: #fff;
	margin: 0 auto;
	box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	-moz-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	-webkit-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	-o-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	-ms-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
	border-radius: 20px;
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	-o-border-radius: 20px;
	-ms-border-radius: 20px;
}

.signup-form, .signup-image, .signin-form, .signin-image {
	width: 150%;
	overflow: hidden;
}

</style>

<div class="section-container">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-8 col-md-offset-2">
				<div class="text-center">
					<h3>
						<b>"${user.username}"</b>님의&nbsp;회원가입이&nbsp;완료되었습니다.
					</h3>
					<p>콤마의 회원이 되신 것을 환영합니다.</p>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	<div class="container-signup d-flex justify-content-center">
		<div class="signup-content">
			<div class="signup-form needs-validation">
				<p>아이디</p>
				<div class="form-group">
					<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> <input type="text" name="username" id="username" value="${user.username}" disabled="disabled" />
				</div>

				<p>가입 일자</p>
				<div class="form-group">
					<label for="name"><i class="zmdi zmdi-calendar"></i></label> <input type="text" name="join Date" id="username" value="${user.creationDate}" disabled="disabled" />
				</div>

				<p>이메일</p>
				<div class="form-group">
					<label for="email"><i class="zmdi zmdi-email"></i></label> <input type="email" name="email" id="email" value="${user.email}" disabled="disabled" />
				</div>

				<p>전화번호</p>
				<div class="form-group">
					<label for="email"><i class="zmdi zmdi-phone"></i></label> <input type="text" name="phoneNumber" id="phoneNumber" value="${user.phoneNumber}" disabled="disabled" />
				</div>
				<a class="custom-btn d-flex justify-content-center" type="button" href="/" style="margin-left: 80px;">홈으로</a>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>