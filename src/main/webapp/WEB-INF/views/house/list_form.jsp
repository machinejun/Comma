<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/list.css" rel="stylesheet">

<section>
	<div class="section-container">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-8 col-md-offset-2">
					<div class="text-center">
						<h2>Comma(,)</h2>
						<p>당신의 쉼표를 찍을 공간을 찾아보세요.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container d-flex justify-content-end" style="width: 1050px;">
		<form class="form-inline" action="/house/list" method="get">
			<c:set var="searchedAddress" value="${searchedAddress}"></c:set>
			<c:set var="selected" value="selected"></c:set>
			<c:set var="notSelected" value=""></c:set>
			<div class="form-group col-sm-6">
				<h4 style="text-align: right; margin-right: 10px;">지역</h4>
				<select class="form-control custom-selector" name="address" onchange="this.form.submit()" style="width: 130px;">
					<option value="">전체</option>
					<option ${searchedAddress eq '서울' ? selected : notSelected}>서울</option>
					<option ${searchedAddress eq '대전' ? selected : notSelected}>대전</option>
					<option ${searchedAddress eq '대구' ? selected : notSelected}>대구</option>
					<option ${searchedAddress eq '부산' ? selected : notSelected}>부산</option>
					<option ${searchedAddress eq '경기도' ? selected : notSelected}>경기도</option>
					<option ${searchedAddress eq '강원도' ? selected : notSelected}>강원도</option>
					<option ${searchedAddress eq '충청도' ? selected : notSelected}>충청도</option>
					<option ${searchedAddress eq '전라도' ? selected : notSelected}>전라도</option>
					<option ${searchedAddress eq '경상도' ? selected : notSelected}>경상도</option>
					<option ${searchedAddress eq '제주도' ? selected : notSelected}>제주도</option>
				</select>
			</div>

			<div class="form-group col-sm-6">
				<c:set var="searchedType" value="${searchedType}"></c:set>
				<h4 style="text-align: right; margin-right: 10px;">숙소 유형</h4>
				<select class="form-control custom-selector" name="type" onchange="this.form.submit()" style="width: 130px;">
					<option value="">전체</option>
					<option ${searchedType eq '호텔' ? selected : notSelected}>호텔</option>
					<option ${searchedType eq '모텔' ? selected : notSelected}>모텔</option>
					<option ${searchedType eq '펜션' ? selected : notSelected}>펜션</option>
					<option ${searchedType eq '게스트 하우스' ? selected : notSelected}>게스트 하우스</option>
				</select>
			</div>
		</form>
	</div>
	<br> <br>
	<div class="container">
		<c:set var="notExist" value="bi-suit-heart"></c:set>
		<c:set var="exist" value="bi-suit-heart-fill"></c:set>
		<c:if test="${empty houseList}">
			<h4>검색하신 결과가 존재하지 않습니다.</h4>
			<br>
			<br>
		</c:if>
		<div class="row">
			<c:forEach var="house" items="${houseList}">
				<input type="hidden" value="${house.id}" id="house-id-${house.id}">
				<div class="col-sm-4">
					<div>
						<a href="/user/house-detail/${house.id}"><img class="custom-img list-img" src="http://localhost:9090/upload/${house.image.imageUrl}" style="object-fit: cover;"></a>
					</div>
					<div class="row">
						<h4 class="d-flex" style="margin-left: 15px;">
							<b class="multiLine">${house.name}</b>
						</h4>

						<div class="d-flex" style="margin-top: 10px; margin-left: 35px;">
							<label>⭐&nbsp;${house.starScore}</label>
						</div>
					</div>
					<p>
						₩&nbsp;
						<fmt:formatNumber value="${house.oneDayPrice}" pattern="#,###" />
						&nbsp;&nbsp;/ 박
					</p>
					<br>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<%@ include file="../layout/footer.jsp"%>