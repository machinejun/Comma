<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<code>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</code>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="${_csrf.parameterName}" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="description" content="">
<meta name="author" content="">
<link rel="favicon" href="/favicon.ico">
<title>Comma - 쉼표를 찍는 공간</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/icomoon/style.css">
<link href="/css/main.550dcf66.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="/css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<style>
code {
	display: none;
}

.body {
	font-family: '' SUIT-Medium ';
}

#header-text {
	font-family: Martel, Times New Roman, Times, serif;
	color: rgba(255, 149, 149, 0.9);
	font-weight: bold;
	margin-left: 200px;
}

.nav-link {
	font-family: 'SUIT-Medium';	
	color: rgba(255, 149, 149, 1);
	margin-left: 30px;
}
.nav-link:hover {
   /* transform: translate(1px, -2%); */
	color: rgba(255, 100, 100, 0.9);
}

nav {
	position: relative;
	z-index: 1;
	background-color: rgba(255, 149, 149, 0.03)
}

#user-table {
	z-index: 4;
	position: fixed;
	top: 2%;
	right: 8%;
}

.user-btn {
	width: 180px;
	z-index: 4;
	padding: 5px;
	font-size: 35px;
	color: rgba(255, 149, 149, 0.7);
}

.user-btn:hover {
	padding: 5px;
	font-size: 35px;
	color: rgba(255, 100, 100, 0.9);
}


.list-group>.list-group-item {
	position: relative;
	display: block;
	padding: 10px 15px;
	margin-bottom: -1px;
	background-color: #fff;
	border: 1px solid #ddd;
}

#user-box-header {
	display: none;
}
</style>
</head>

<body>
	<input id="isNaviFocus" type="hidden" value=0 />
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg">
		<div id="naviBar" class="navbar-expand-lg ">
			<a id="header-text" class="navbar-brand" href="/">Comma</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/house/list">숙소 보기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">고객 센터</a></li>
			</ul>

		</div>

	</nav>
	<div id="user-table" class="list-group">
		<a onclick="openUserBox()" id="user-btn-header" class="user-btn"><i class="bi bi-person-lines-fill"></i></a>
		<div id="user-box-header">
			<input id="isUserTable" type="hidden" value=0 />
			<c:choose>
				<c:when test="${empty principal}">
					<a href="/auth/login_form" class="list-group-item list-group-item-action"> <span class="icon-drivers-license-o"></span>&nbsp;&nbsp;로그인
					</a>
					<a href="/auth/join_form" class="list-group-item list-group-item-action"> <span class="icon-user-plus"></span>&nbsp;&nbsp;회원가입
					</a>

				</c:when>
				<c:otherwise>
					<a href="/auth/update_form" class="list-group-item list-group-item-action"> <span class="icon-user"></span>&nbsp;&nbsp;회원정보 수정
					</a>
					<a class="list-group-item list-group-item-action" href="/logout"> <span class="icon-drivers-license-o"></span>&nbsp;&nbsp;로그아웃
					</a>

				</c:otherwise>
			</c:choose>

			<sec:authorize access="hasRole('ROLE_GUEST')">
				<a type="button" class="list-group-item list-group-item-action" href="/be-host"> <span class="icon-black-tie"></span>&nbsp;&nbsp;호스트 되기
				</a>
				<a class="list-group-item list-group-item-action" href="/reserveTable/user"> <span class="icon-suitcase"></span>&nbsp;&nbsp;예약 내역
				</a>
				<a type="button" href="/wish-list/${principal.user.id}" class="list-group-item list-group-item-action"> <span class="icon-gittip"></span>&nbsp;&nbsp;위시 리스트
				</a>
				<a type="button" href="/review/my-review-list/${principal.user.id}" class="list-group-item list-group-item-action"> <span class="icon-note"></span>&nbsp;&nbsp;리뷰 관리
				</a>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_HOST')">
				<a type="button" class="list-group-item list-group-item-action" href="/be-guest"> <span class="icon-black-tie"></span>&nbsp;&nbsp;게스트 되기
				</a>
				<a type="button" class="list-group-item list-group-item-action" href="/reserveTable/host"> <span class="icon-users"></span>&nbsp;&nbsp;예약 관리
				</a>
				<a type="button" class="list-group-item list-group-item-action" href="/house/management"> <span class="icon-home"></span>&nbsp;&nbsp;숙소 관리
				</a>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a class="list-group-item list-group-item-action" href="/admin_form"> <span class="icon-server"></span>&nbsp;&nbsp;관리자 상세
				</a>
			</sec:authorize>

		</div>
	</div>