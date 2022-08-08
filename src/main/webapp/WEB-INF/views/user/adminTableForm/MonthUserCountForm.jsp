<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<h2 id="title"
		style="color: rgb(77, 77, 77, 0.9); font-family: SUIT-Medium;">월 별 증가/감소 조회</h2>
	<br />
	<div class="select-area">
		<h4>월 별 조회</h4>
		<button class="custom-sm-btn" onclick="loadIndexDate()">검색</button>
	</div>
	<canvas id="myChart_month" ></canvas>
</div>