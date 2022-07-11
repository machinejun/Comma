<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" href="../favicon.ico" />
<link rel="stylesheet" type="text/css" href="/css/house/normalize.css" />
<link rel="stylesheet" type="text/css" href="/css/house/demo.css" />
<link rel="stylesheet" type="text/css" href="/css/house/component.css" />
<script src="/js/house/modernizr.custom.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
</head>
<body>
	<br />
	<br />
	<div class="container">
		<section class="grid-wrap">
			<ul class="grid swipe-right" id="grid">
				<li class="title-box">
					<h2>
						Everywhere, Whenever <a href="/">JMT HOUSE</a>
					</h2>
				</li>
				<!-- 숙소 사진 리스트 -->
				<c:forEach var="house" items="${houseList}">
					<li><a href="/house/list"><img src="http://localhost:9090/upload/${house.image.imageUrl}" width="301px" height="381px" />
							<h3>${house.name}</h3></a></li>
				</c:forEach>

				<li><a href="#"><img src="/images/house/dummy.png" alt="dummy" />
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png" alt="dummy" />
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png" alt="dummy" />
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png" alt="dummy" />
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png" alt="dummy" />
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png" alt="dummy" />
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png" alt="dummy" />
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png" alt="dummy" />
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png" />
						<h3>A fantastic title</h3></a></li>
				<li><a href="#"><img src="/images/house/dummy.png" />
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
		new GridScrollFx(document.getElementById("grid"), {
			viewportFactor : 0.4,
		});
	</script>
</body>
</html>
<%@ include file="../layout/footer.jsp"%>