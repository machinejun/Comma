<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="/css/house/list.css" rel="stylesheet">

<section>
	<div class="section-container">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-8 col-md-offset-2">
					<div class="text-center">
						<h2>About Us</h2>
						<p>설명</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container justify-content-center">
		<form class="form-inline" action="/house/list" method="get">
			<c:set var="searchedAddress" value="${searchedAddress}"></c:set>
			<c:set var="selected" value="selected"></c:set>
			<c:set var="notSelected" value=""></c:set>
			<div class="form-group col-sm-4 justify-content-center">
				<h4>지역</h4>
				<select class="form-control selector" name="address">
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

			<div class="form-group col-sm-4 justify-content-center">
				<c:set var="searchedType" value="${searchedType}"></c:set>
				<h4>숙소 유형</h4>
				<select class="form-control selector" name="type">
					<option value="">전체</option>
					<option ${searchedType eq '호텔' ? selected : notSelected}>호텔</option>
					<option ${searchedType eq '모텔' ? selected : notSelected}>모텔</option>
					<option ${searchedType eq '펜션' ? selected : notSelected}>펜션</option>
					<option ${searchedType eq '게스트 하우스' ? selected : notSelected}>게스트 하우스</option>
				</select>
			</div>
			<button class="custom-btn" type="submit" style="margin-top: 33px;">검색</button>
		</form>
	</div>
	<br> <br>
	<div class="container">
		<c:if test="${empty houseList}">
			<h4>검색하신 결과가 존재하지 않습니다.</h4>
			<br>
		</c:if>
		<div class="row">
			<c:forEach var="house" items="${houseList}">
				<div class="col-sm-4">
					<a href="/house/detail/${house.id}"><img class="custom-img list-img" src="http://localhost:9090/upload/${house.image.imageUrl}"></a>
					<h4 class="multiLine">
						<b>${house.name}</b>
					</h4>
					<div>
						<label class="star-score">⭐&nbsp;${house.starScore}</label>
					</div>
					<p>₩&nbsp;${house.oneDayPrice}&nbsp;&nbsp;/ 박</p>
					<br>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<script src="/js/house/house.js"></script>
<%@ include file="../layout/footer.jsp"%>