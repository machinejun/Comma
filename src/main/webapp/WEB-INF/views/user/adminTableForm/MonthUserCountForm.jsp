<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<div class="container">
	<h2 id="title"
		style="color: rgba(255, 149, 149, 0.9); font-family: SUIT-Medium;">월별 유저 가입 수</h2>
	<br />
	<div class="select-area" style="border-color: transparent;">
		<button class="custom-sm-btn" onclick="loadDate()">조회</button>
	</div>
	<canvas id="myChart" height="60" width="100"></canvas>
</div>