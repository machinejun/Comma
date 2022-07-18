<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/house/list.css" />

<section>
	<div class="container posts">
		<c:forEach var="house" items="${houseList}">
			<article>
				<a href="/house/detail/${house.id}" class="image"><img src="http://localhost:9090/upload/${house.image.imageUrl}"></a>
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
<%@ include file="../layout/footer.jsp"%>