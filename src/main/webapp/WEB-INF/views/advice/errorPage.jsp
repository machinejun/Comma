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
	left: 22%;
}
.text > p {
	font-size: 20px;
}
.text > p > span {
	margin-left: 15px;
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
	<img src="/assets/error_img.png"/>
	<div class="text">
		<h2>무엇인가 잘못된거 같습니다</h2>
		<p><span>아래의 버튼을 누르시면 메인으로 가실 수 있습니다</span><p>
		<p><span>다시 한번 요청을 부탁드릴게요 </span><p>
		
		<button onclick="location.href='/'" class="custom-sm-btn">홈으로 돌아가기</button>
	</div>
	
	
</body>
</html>