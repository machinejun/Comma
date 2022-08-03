<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<title>회원가입 수정 페이지</title>

<link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css" />
<link rel="stylesheet" href="/css/user/style.css" />

<div class="main">
	<section class="signup">
		<div class="container-signup">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">회원정보 수정</h2>
					<input type="hidden" value="${principal.user.loginType}" id="login-type">
					<c:set var="isDisabled" value="disabled" />
					<c:set var="isAbled" value="" />
					<div class="form-group">
						<input value="${principal.user.id}" id="user-id" type="hidden"> <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> <input type="text" value="${principal.user.username}"
							id="username" disabled />
					</div>
					<p id="passwordCheck" style="color: rgb(203, 0, 0)"></p>
					<div class="form-group">
						<label for="password"><i class="zmdi zmdi-lock-outline"></i></label> <input type="password" id="password" placeholder="Password" ${principal.user.loginType == 'KAKAO' ? isDisabled : isAbled} />
					</div>
					<input type="hidden" id="loginType" value="${principal.user.loginType}">
					<div class="form-group">
						<label for="password"><i class="zmdi zmdi-lock-outline"></i></label> <input type="password" id="re-password" placeholder="Repeat your password" ${principal.user.loginType == 'KAKAO' ? isDisabled : isAbled } />
					</div>

					<div class="form-group">
						<label for="email"><i class="zmdi zmdi-email"></i></label> <input type="email" value="${principal.user.email}" id="email" placeholder="Your Email" />
					</div>

					<p id="phoneNumberCheck"></p>
					<div class="form-group">
						<label for="phoneNumber"><i class="zmdi zmdi-phone"></i></label> <input type="text" value="${principal.user.phoneNumber}" id="phoneNumber" placeholder="Your Phone Number" />
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

<script>
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");

	$("#btn-update").bind(
			"click",
			function() {
				let data = {
					id : $("#user-id").val(),
					username : $("#username").val(),
					password : $("#password").val(),
					email : $("#email").val(),
					phoneNumber : $("#phoneNumber").val()
				}

				if (data.phoneNumber.indexOf("-") != -1) {
					$("#phoneNumberCheck").text("하이픈(-)을 제외한 번호를 입력해주세요.");
				} else if (data.phoneNumber.length != 11) {
					$("#phoneNumberCheck").text("휴대폰 번호 11자리를 입력해주세요.");
				} else if (data.phoneNumber.charAt(0) != 0
						|| data.phoneNumber.charAt(1) != 1
						|| data.phoneNumber.charAt(2) != 0) {
					$("#phoneNumberCheck").text("휴대폰 번호의 형식은 010으로 시작해야 합니다.");
				} else {

					$.ajax({

						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token)
						},
						type : "PUT",
						url : "/user/update",
						data : JSON.stringify(data),
						contentType : "application/json; charset=utf-8",
						dataType : "json",
					}).done(function(response) {
						console.log(response);
						if (response.status == 200) {
							alert("회원정보 수정이 완료되었습니다.");
							location.href = "/";
						} else {
							alert("회원정보 수정이 완료되지 않았습니다.");
						}
					}).fail(function(error) {
						alert("회원정보 수정이 완료되지 않았습니다.");
						console.log(error);
					});
				}
			});

	$(document)
			.ready(
					function() {
						$("#password, #re-password")
								.keyup(
										function() {
											let password = $("#password").val();
											let passwordCheck = $(
													"#re-password").val();
											let loginType = $("#loginType")
													.val();

											if (loginType == "ORIGIN") {
												if (password.trim() != ""
													&& passwordCheck.trim() != "") {
												if (password != passwordCheck) {
													$("#passwordCheck").text(
															"비밀번호가 일치하지 않습니다.");
													document
															.getElementById('passwordCheck').style.color = "red";
													return false;
												} else if (password == passwordCheck) {

													if (password.length < 8 || password.length > 16) {
														$("#passwordCheck")
																.text(
																		"비밀번호는 8~16자여야 합니다.");
														document
														.getElementById('passwordCheck').style.color = "red";
														return false;
													} else {
														$("#passwordCheck").text(
														"");
													}

												}
											}
											}
										});
					});
</script>

<script src="/vendor/jquery/jquery.min.js"></script>
<%@ include file="../layout/footer.jsp"%>
