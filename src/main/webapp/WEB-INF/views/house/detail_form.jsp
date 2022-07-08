<!-- /*
* Template Name: LuxuryHotel
* Template Author: Untree.co
* Tempalte URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Future Imperfect by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="/js/house/ie/html5shiv.js"></script>
<link rel="stylesheet" href="/css/house/main.css" />
<link rel="stylesheet" href="/css/house/ie9.css" />
<link rel="stylesheet" href="/css/house/ie8.css" />
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section>

			<!-- Actions -->
			<section>
				<ul class="actions vertical">
					<li><a href="#" class="button big fit">Log In</a></li>
				</ul>
			</section>

		</section>

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">${house.name}</a>
						</h2>
						<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-11-01">November 1, 2015</time>
						<a href="#" class="author"><span class="name">Jane Doe</span><img src="/images/house/avatar.jpg" alt="" /></a>
					</div>
				</header>
				<a href="#" class="image featured"><img src="/images/house/pic01.jpg" alt="" /></a>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue
					ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
				<footer>
					<ul class="actions">
						<li><a href="#" class="button big">예약하기</a></li>
					</ul>
				</footer>
			</article>


		</div>

		<!-- Sidebar -->
		<section id="sidebar">

			<!-- Intro -->
			<section id="intro">
				<a class="logo"><img src="/images/house/logo.jpg" alt="" /></a>
				<header>
					<h2>Future Imperfect</h2>
					<p>
						Another fine responsive site template by <p >HTML5 UP</p>
					</p>
				</header>
			</section>

			<!-- Mini Posts -->
			<section>
				<div class="mini-posts">

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a >Vitae sed condimentum</a>
							</h3>
							<time class="published" datetime="2015-10-20">October 20, 2015</time>
							<a href="#" class="author"><img src="/images/house/avatar.jpg" alt="" /></a>
						</header>
						<a href="#" class="image"><img src="/images/house/pic04.jpg" alt="" /></a>
					</article>

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="#">Rutrum neque accumsan</a>
							</h3>
							<time class="published" datetime="2015-10-19">October 19, 2015</time>
							<a href="#" class="author"><img src="/images/house/avatar.jpg" alt="" /></a>
						</header>
						<a href="#" class="image"><img src="/images/house/pic04.jpg" alt="" /></a>
					</article>

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="#">Odio congue mattis</a>
							</h3>
							<time class="published" datetime="2015-10-18">October 18, 2015</time>
							<a href="#" class="author"><img src="/images/house/avatar.jpg" alt="" /></a>
						</header>
						<a href="#" class="image"><img src="/images/house/pic04.jpg" alt="" /></a>
					</article>

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="#">Enim nisl veroeros</a>
							</h3>
							<time class="published" datetime="2015-10-17">October 17, 2015</time>
							<a href="#" class="author"><img src="/images/house/avatar.jpg" alt="" /></a>
						</header>
						<a href="#" class="image"><img src="/images/house/pic04.jpg" alt="" /></a>
					</article>

				</div>
			</section>
	</div>

	<!-- Scripts -->
	<script src="/js/house/jquery.min.js"></script>
	<script src="/js/house/skel.min.js"></script>
	<script src="/js/house/util.js"></script>
	<script src="/js/house/ie/respond.min.js"></script>
	<script src="/js/house/main.js"></script>

</body>
</html>
<%@ include file="../layout/footer.jsp"%>