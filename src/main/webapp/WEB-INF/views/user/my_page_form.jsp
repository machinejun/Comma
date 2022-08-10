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
			<c:choose>
				<c:when test="${principal.user.role eq 'ADMIN'}">
					<h2 class="display-5 fw-bold">관리자 페이지</h2>
					<h4 style="color: rgb(89, 89, 89)">&nbsp;&nbsp;관리자님,&nbsp;반갑습니다.</h4>

				</c:when>
				<c:otherwise>
					<h2 class="display-5 fw-bold">마이페이지</h2>
					<h4 style="color: rgb(89, 89, 89)">&nbsp;&nbsp;${principal.user.username}님,&nbsp;반갑습니다.</h4>

				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<br />
	<div class="row gx-4 gx-lg-5">

		<sec:authorize access="hasRole('ROLE_GUEST')">
			<div class="col-sm-4 mb-5" onclick="location.href='/auth/update_form'" style="cursor: pointer;">
				<div class="card h-100 my-card">
					<div class="card-body">
						<i class="bi bi-person-bounding-box my-icon"></i> <br> <br>
						<h3 class="card-title">내 정보 수정</h3>
						<p class="card-text">비밀번호를 주기적으로 변경하고 계정을 안전하게 보호하세요.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4 mb-5" onclick="location.href='/report-history'" style="cursor: pointer;">
				<div class="card-body">
					<div class="card h-100 my-card">
						<i class="bi bi-bell my-icon"></i><br>
						<h3 class="card-title">신고 내역</h3>
						<p class="card-text">나의 신고 내역을 확인하세요.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4 mb-5" onclick="location.href='/wish-list/${principal.user.id}'" style="cursor: pointer;">
				<div class="card-body">
					<div class="card h-100 my-card">
						<i class="bi bi-bookmark-heart my-icon"></i><br>
						<h3 class="card-title">위시리스트</h3>
						<p class="card-text">나의 위시리스트를 확인하고 원하는 숙소를 예약해보세요.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4 mb-5" onclick="location.href='/reserveTable/user'" style="cursor: pointer;">
				<div class="card h-100 my-card">
					<div class="card-body">
						<i class="bi bi-card-checklist my-icon"></i><br> <br>
						<h3 class="card-title">예약 내역</h3>
						<p class="card-text">나의 예약 정보와 결제 정보를 확인하세요.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4 mb-5" onclick="location.href='/review/my-review-list/${principal.user.id}'" style="cursor: pointer;">
				<div class="card h-100 my-card">
					<div class="card-body">
						<i class="bi bi-pencil-square my-icon"></i><br> <br>
						<h3 class="card-title">리뷰 내역</h3>
						<p class="card-text">내가 쓴 리뷰에 대한 호스트의 답글을 확인하세요.</p>
					</div>
				</div>
			</div>
		</sec:authorize>

		<sec:authorize access="hasRole('ROLE_HOST')">
			<div class="col-sm-6 mb-5" onclick="location.href='/auth/update_form'" style="cursor: pointer;">
				<div class="card h-100 my-card">
					<div class="card-body">
						<i class="bi bi-person-bounding-box my-icon"></i> <br> <br>
						<h3 class="card-title">내 정보 수정</h3>
						<p class="card-text">비밀번호를 주기적으로 변경하고 계정을 안전하게 보호하세요.</p>
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
			<div class="col-sm-6 mb-5" onclick="location.href='/reserveTable/host'" style="cursor: pointer;">
				<div class="card h-100 my-card">
					<div class="card-body">
						<i class="bi bi-card-checklist my-icon"></i><br> <br>
						<h3 class="card-title">예약 관리</h3>
						<p class="card-text">나의 숙소에 대한 게스트들의 예약 내역을 확인하세요.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 mb-5" onclick="location.href='/house/management'" style="cursor: pointer;">
				<div class="card h-100 my-card">
					<div class="card-body">
						<i class="bi bi-house-door my-icon"></i><br> <br>
						<h3 class="card-title">숙소 관리</h3>
						<p class="card-text">숙소를 등록하고 나의 숙소에 대한 게스트들의 리뷰를 확인하세요.</p>
					</div>
				</div>
			</div>
		</sec:authorize>

		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="col-sm-4 mb-5" onclick="location.href='/admin/user-management'" style="cursor: pointer;">
				<div class="card h-100 my-card">
					<div class="card-body">
						<i class="bi bi-people my-icon"></i><br> <br>
						<h3 class="card-title">회원 관리</h3>
						<p class="card-text">콤마 회원의 가입 현황을 확인하세요.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4 mb-5" onclick="location.href='/admin/report-management'" style="cursor: pointer;">
				<div class="card h-100 my-card">
					<div class="card-body">
						<i class="bi bi-bell my-icon"></i><br> <br>
						<h3 class="card-title">신고 관리</h3>
						<p class="card-text">회원의 신고 내역을 확인하고 승인 및 취소하세요.</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4 mb-5" onclick="location.href='/admin/show-statistics'" style="cursor: pointer;">
				<div class="card h-100 my-card">
					<div class="card-body">
						<i class="bi bi-bar-chart-line my-icon"></i><br> <br>
						<h3 class="card-title">통계</h3>
						<p class="card-text">콤마 회원과 숙소의 데이터 현황을 확인하세요.</p>
					</div>
				</div>
			</div>
		</sec:authorize>
	</div>

</div>

<script type="text/javascript" src="/js/home.js"></script>