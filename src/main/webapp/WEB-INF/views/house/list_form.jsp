<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/house/list.css" />
<%@ include file="../layout/re_header.jsp"%>

<section>
	<div class="section-container">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-8 col-md-offset-2">
					<div class="text-center">
						<h3>About Us</h3>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<form class="form-inline" action="/house/list" method="get">
			<c:set var="searchedAddress" value="${searchedAddress}"></c:set>
			<c:set var="selected" value="selected"></c:set>
			<c:set var="notSelected" value=""></c:set>
			<div class="form-group justify-content-center col-sm-4">
				<label><b>지역</b></label> <select class="form-control" name="address">
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

			<div class="form-group justify-content-center col-sm-4">
			<c:set var="searchedType" value="${searchedType}"></c:set>
				<label><b>숙소 유형</b></label> <select class="form-control" name="type">
					<option value="">전체</option>
					<option ${searchedType eq '호텔' ? selected : notSelected}>호텔</option>
					<option ${searchedType eq '모텔' ? selected : notSelected}>모텔</option>
					<option ${searchedType eq '펜션' ? selected : notSelected}>펜션</option>
					<option ${searchedType eq '게스트 하우스' ? selected : notSelected}>게스트 하우스</option>
				</select>
			</div>
			<button class="custom-btn col-sm-4" type="submit">검색</button>
		</form>
	</div>
	<br> <br>
	<div class="container posts">
		<c:forEach var="house" items="${houseList}">
			<article>
				<a href="/house/detail/${house.id}" class="image"><img
					src="http://localhost:9090/upload/${house.image.imageUrl}"></a>
				<h3 class="multiLine">${house.name}</h3>
				<div>
					&nbsp;&nbsp;<label>⭐&nbsp;${house.starScore}</label>
				</div>
				<p>₩&nbsp;${house.oneDayPrice}&nbsp;&nbsp;/박</p>
			</article>
		</c:forEach>
	</div>
</section>

<script src="/js/house/jquery.min.js"></script>
<script src="/js/house/skel.min.js"></script>
<script src="/js/house/util.js"></script>
<script src="/js/house/main.js"></script>

<script src="/js/house/house.js"></script>
<%@ include file="../layout/re_footer.jsp"%>