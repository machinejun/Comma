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
					<div class="form-group">
						<input value="${principal.user.id}" id="user-id" type="hidden"> <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> <input type="text" value="${principal.user.username}"
							id="username" disabled />
					</div>
					<div class="form-group">
						<label for="password"><i class="zmdi zmdi-lock"></i></label> <input type="password" id="password" placeholder="Password" required />
					</div>
					<div class="form-group">
						<label for="password"><i class="zmdi zmdi-lock-outline"></i></label> <input type="password" id="re-password" placeholder="Repeat your password" required />
					</div>

					<div class="form-group">
						<label for="email"><i class="zmdi zmdi-email"></i></label> <input type="email" value="${principal.user.email}" id="email" placeholder="Your Email" />
					</div>

					<div class="form-group">
						<label for="phoneNumber"><i class="zmdi zmdi-email"></i></label> <input type="text" value="${principal.user.phoneNumber}" id="phoneNumber" placeholder="Your Phone Number" />
					</div>
					<button type="button" onsubmit="return passwordCheck()" id="btn-update" class="btn btn-sm btn-primary">수정하기</button>
				</div>

				<div class="signup-image">
					<figure>
						<img src="/assets/images/signup-image.jpg" />
					</figure>
				</div>
			</div>
		</div>
	</section>
</div>
<script>

function passwordCheck() {
    let password = $("#password").val();
    let passwordCheck = $("#re-password").val();

    if (password != "" || passwordCheck != "") {
      if (password != passwordCheck) {
        alert("입력하신 비밀번호가 일치하지 않습니다.");
        return false;
      }
    }
</script>

<script src="/js/user/user.js"></script>
<script src="/vendor/jquery/jquery.min.js"></script>
<%@ include file="../layout/footer.jsp"%>
