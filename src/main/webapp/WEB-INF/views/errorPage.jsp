<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/style.css" rel="stylesheet">
<title>Comma - 쉼표를 찍는 공간</title>

<style type="text/css">
img{
	width: 500px;
	height: 500px;
	position: absolute;
	left: 35%;
}
.text{
	font-family: 'SUIT-Medium';
	position: absolute;
	top: 50%;
	left: 30%;
}
.text > p {
	font-size: 20px;
}
.text > p > span {
	font-size: 25px;
}
h2 {
	margin-left: 270px;
	font-size: 40px;
}
.custom-sm-btn{
	margin-left: 600px;
	width: 200px;
	height: 50px;
}
</style>
</head>
<body>
	<img src="https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061132_960_720.png"/>
	<div class="text">
		<h2>Error Occured</h2>
		<p><span>에러 클래스</span> : ${error.errorClass}<p>
		<p><span>에러 메세지</span> : ${error.errorMessage}<p>
		<p><span>에러 원인</span> : ${error.errorCause}<p>
		<button onclick="location.href='/'" class="custom-sm-btn">홈으로 돌아가기</button>
	</div>
	
	
</body>
</html>