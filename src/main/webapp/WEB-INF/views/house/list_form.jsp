<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/house/list.css" />
<header class="major">
	<h2>Ipsum sed dolor</h2>
</header>
<section>
	<div class="container posts">
		<c:forEach var="house" items="${houseList}">
			<article>
				<a href="#" class="image"><img src="http://localhost:9090/upload/${house.image.imageUrl}" ></a>
				<h3>${house.name}</h3>
				<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
				<ul class="actions">
					<li><a href="#" class="button">More</a></li>
				</ul>
			</article>

		</c:forEach>
		<article>
			<a href="#" class="image"><img src="images/pic02.jpg" alt=""></a>
			<h3>Nulla amet dolore</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
		</article>
		<article>
			<a href="#" class="image"><img src="images/pic03.jpg" alt=""></a>
			<h3>Tempus ullamcorper</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
		</article>
		<article>
			<a href="#" class="image"><img src="images/pic04.jpg" alt=""></a>
			<h3>Sed etiam facilis</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
		</article>
		<article>
			<a href="#" class="image"><img src="images/pic05.jpg" alt=""></a>
			<h3>Feugiat lorem aenean</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
		</article>
		<article>
			<a href="#" class="image"><img src="images/pic06.jpg" alt=""></a>
			<h3>Amet varius aliquam</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
		</article>
	</div>
</section>

<script src="/js/house/jquery.min.js"></script>
<script src="/js/house/skel.min.js"></script>
<script src="/js/house/util.js"></script>
<script src="/js/house/main.js"></script>

<%@ include file="../layout/footer.jsp"%>