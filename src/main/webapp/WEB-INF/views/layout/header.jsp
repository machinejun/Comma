<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<html>
<head>
<<<<<<< HEAD
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Shop Homepage - Start Bootstrap Template</title>
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

=======
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Shop Homepage - Start Bootstrap Template</title>
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <link rel="stylesheet" href="/css/icomoon/style.css">
  <link href="/css/main.550dcf66.css" rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link href="/css/style.css" rel="stylesheet">
>>>>>>> feature_junic
</head>

<body>
	<input id="isNaviFocus" type="hidden" value=0 />
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light fiexed-top">
		<div id="naviBar" class="navbar-expand-lg bg-light fixed-top" style="background-color: #1763e9; width: 100%;">
			<a class="navbar-brand text-warning" href="#">JMT HOUSE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item" style="margin-right: 10px;"><a class="nav-link" href="/"><span class="icon-home2"></span>&nbsp;&nbsp;Home</a></li>
					<li class="nav-item"><a class="nav-link" href="/house/list"><span></span>&nbsp;&nbsp;숙소 둘러보기</a></li>
					<li id="user-content" class="nav-item" style="position: relative; left: 1000px;"><a class="btn nav-link"><span class="icon-user-circle"></span>&nbsp;&nbsp;user</a>
						<div id="user-table" class="list-group" style="width: 180px; font-size: 20px; position: fixed; left: 70%; top: 6%;">
							<input id="isUserTable" type="hidden" value=0 /> <a href="/auth/login_form" class="list-group-item list-group-item-action"> <span class="icon-drivers-license-o"></span>&nbsp;&nbsp;로그인
							</a> <a href="/auth/join_form" class="list-group-item list-group-item-action"> <span class="icon-user-plus"></span>&nbsp;&nbsp;회원가입
							</a>
							<button type="button" class="list-group-item list-group-item-action">
								<span class="icon-black-tie"></span>&nbsp;&nbsp;호스트 되기
							</button>
							<a class="list-group-item list-group-item-action" href="/reservation-history/${principal.user.id}">
								<span class="icon-suitcase"></span>&nbsp;&nbsp;예약 내역
							</a>
							<button type="button" class="list-group-item list-group-item-action">
								<span class="icon-users"></span>&nbsp;&nbsp;예약자 확인
							</button>
							<button type="button" class="list-group-item list-group-item-action">
								<span class="icon-gittip"></span>&nbsp;&nbsp;예약하기
							</button>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>