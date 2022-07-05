<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Grid Loading and Hover Effect | Demo 1</title>
<meta name="description"
	content="Grid Loading and Hover Effect: Recreating Samsung's grid loading effect" />
<meta name="keywords"
	content="grid loading, swipe, effect, slide, masonry, web design, tutorial" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="/css/house/normalize.css" />
<link rel="stylesheet" type="text/css" href="/css/house/demo.css" />
<link rel="stylesheet" type="text/css" href="/css/house/component.css" />
<script src="/js/house/modernizr.custom.js"></script>
</head>
<body>
	<div class="container">

		<section class="grid-wrap">
			<ul class="grid swipe-right" id="grid">
				<li class="title-box">
					<h2>
						Illustrations by <a href="http://ryotakemasa.com/">Ryo
							Takemasa</a>
					</h2>
				</li>
				<!-- 숙소 사진 리스트 -->
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png"
						alt="dummy">
						<h3>A fantastic title</h3></a></li>

			</ul>
		</section>
	</div>

	<script src="/js/house/masonry.pkgd.min.js"></script>
	<script src="/js/house/imagesloaded.pkgd.min.js"></script>
	<script src="/js/house/classie.js"></script>
	<script src="/js/house/colorfinder-1.1.js"></script>
	<script src="/js/house/gridScrollFx.js"></script>
	<script>
		new GridScrollFx(document.getElementById('grid'), {
			viewportFactor : 0.4
		});
	</script>
</body>