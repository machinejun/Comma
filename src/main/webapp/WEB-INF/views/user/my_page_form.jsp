<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/detail.css" rel="stylesheet">

<style>
.my-card {
	border-radius: 20px;
	height: 200px;
}

.my-icon {
	font-size: 50px;
	color: black;
}
</style>

<div class="container">

	<div class="p-4 p-lg-5 rounded-3">
		<div class="m-4 m-lg-5">
			<h2 class="display-5 fw-bold">마이 페이지</h2>
			<h4 style="color: rgb(89, 89, 89)">&nbsp;&nbsp;${principal.user.username}님,&nbsp;반갑습니다.</h4>
		</div>
	</div>
	<br />
	<div class="row gx-4 gx-lg-5">
		<div class="col-sm-6 mb-5" onclick="location.href='/auth/update_form'" style="cursor: pointer;">
			<div class="card h-100 my-card">
				<div class="card-body">
					<i class="bi bi-person-bounding-box my-icon"></i> <br> <br>
					<h3 class="card-title">내 정보 수정</h3>
					<p class="card-text">비밀번호를 주기적으로 변경하고 계정을 안전하게 보호하세요.</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 mb-5" onclick="location.href='/auth/update_form'" style="cursor: pointer;">
			<div class="card h-100 my-card">
				<div class="card-body">
					<i class="bi bi-pencil-square my-icon"></i><br> <br>
					<h3 class="card-title">리뷰 내역</h3>
					<p class="card-text">내가 쓴 리뷰에 대한 호스트의 답글을 확인하세요.</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 mb-5" onclick="location.href='/report-history'" style="cursor: pointer;">
			<div class="card-body">
				<div class="card h-100 my-card">
					<i class="bi bi-bell my-icon"></i><br>
					<h3 class="card-title">신고 내역</h3>
					<p class="card-text">나의 신고 내역을 확인하세요.</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 mb-5" onclick="location.href='/wish-list/${principal.user.id}'" style="cursor: pointer;">
			<div class="card-body">
				<div class="card h-100 my-card">
					<i class="bi bi-bookmark-heart my-icon"></i><br>
					<h3 class="card-title">위시리스트</h3>
					<p class="card-text">나의 위시리스트를 확인하고 원하는 숙소를 예약해보세요.</p>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript" src="/js/home.js"></script>