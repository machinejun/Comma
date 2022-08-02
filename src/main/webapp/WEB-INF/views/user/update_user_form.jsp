<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<title>회원가입 수정 페이지</title>

<link rel="stylesheet"
	href="/fonts/material-icon/css/material-design-iconic-font.min.css" />
<link rel="stylesheet" href="/css/user/style.css" />

<div class="main">
	<section class="signup">
		<div class="container-signup">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">회원정보 수정</h2>
					<input type="hidden" value="${principal.user.loginType}" id="login-type">
					<c:set var="isDisabled" value="disabled"/>
					<c:set var="isAbled" value=""/>
					<div class="form-group">
						<input value="${principal.user.id}" id="user-id" type="hidden">
						<label for="name"><i
							class="zmdi zmdi-account material-icons-name"></i></label> <input
							type="text" value="${principal.user.username}" id="username"
							disabled />
					</div>
					<div class="form-group">
						<label for="password"><i class="zmdi zmdi-lock-outline"></i></label>
						<input type="password" id="password" placeholder="Password"
							 ${principal.user.loginType == 'KAKAO' ? isDisabled : isAbled}/>
					</div>
					<input type="hidden" id="loginType" value="${principal.user.loginType}">
					<div class="form-group">
						<label for="password"><i class="zmdi zmdi-lock-outline"></i></label>
						<input type="password" id="re-password"
							placeholder="Repeat your password" ${principal.user.loginType == 'KAKAO' ? isDisabled : isAbled } />
					</div>

					<div class="form-group">
						<label for="email"><i class="zmdi zmdi-email"></i></label> <input
							type="email" value="${principal.user.email}" id="email"
							placeholder="Your Email" />
					</div>

					<div class="form-group">
						<label for="phoneNumber"><i class="zmdi zmdi-phone"></i></label> <input
							type="text" value="${principal.user.phoneNumber}"
							id="phoneNumber" placeholder="Your Phone Number" />
					</div>
					<button type="button" id="btn-update" class="custom-btn">수정하기</button>
				</div>

				<div class="signup-image" style="margin-top: 50px;">
					<figure>
						<img src="/assets/images/img-01.png" />
					</figure>
				</div>
			</div>
		</div>
	</section>
</div>

<script src="/js/user/user.js"></script>
<script src="/vendor/jquery/jquery.min.js"></script>
<%@ include file="../layout/footer.jsp"%>
