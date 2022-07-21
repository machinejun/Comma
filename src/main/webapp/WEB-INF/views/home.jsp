<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<style>
.custom-img:hover {
	animation: box-ani 0.5s linear forwards;
}

@keyframes box-ani {
	from { transform:translate(0, 0);
		
	}to {
		transform: translate(0, -15px);
	}
}
.text-center>h2 {
	color: rgba(255, 149, 149, 0.7);
}

.text-center>h2::after {
	color: rgba(255, 149, 149, 0.7);
	content: "";
}

.col-xs-12>h2::after {
	content: "";
}

.custom-sm-btn {
	padding: 0px;
	margin-left: 420px;
	width: 135px;
	height: 45px;
}

.custom-sm-btn:hover {
	text-decoration: none;
	color: white;
}

.fa {
	color: rgba(255, 149, 149, 0.7);
}

p {
	font-family: 'SUIT-Medium';
}
</style>
<div class="section-container">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-8 col-md-offset-2">
				<div class="text-center">
					<h2>Comma(,)</h2>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas
						luctus at sem quis varius. <br> Class aptent taciti sociosqu
						ad litora torquent per conubia nostra, per inceptos himenaeos.
						Phasellus iaculis magna sagittis elit sagittis, at hendrerit lorem
						venenatis. Morbi accumsan iaculis blandit. Cras ultrices hendrerit
						nisl.
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="section-container">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">

				<div id="carousel-example-generic"
					class="carousel carousel-fade slide" data-ride="carousel">

					<div class="carousel-inner" role="listbox">

						<div class="item active">
							<img class="img-responsive"
								src="https://cdn.pixabay.com/photo/2016/01/31/14/32/architecture-1171462_960_720.jpg"
								alt="First slide">
							<div class="carousel-caption card-shadow reveal">

								<h3>Stay</h3>
								<a class="left carousel-control"
									href="#carousel-example-generic" role="button"
									data-slide="prev"> <i class="fa fa-chevron-left"
									aria-hidden="true"></i> <span class="sr-only">Previous</span>
								</a> <a class="right carousel-control"
									href="#carousel-example-generic" role="button"
									data-slide="next"> <i class="fa fa-chevron-right"
									aria-hidden="true"></i> <span class="sr-only">Next</span>
								</a>
								<p>EVERYWHERE, WEHNEVER</p>

								<p>편안한 숙소에서 휴식을 취해보세요.</p>
								<br> <a href="/house/list" class="custom-sm-btn" title="">
									숙소 보러가기 </a>
							</div>
						</div>
						<div class="item">
							<img class="img-responsive"
								src="https://cdn.pixabay.com/photo/2018/01/18/20/56/auto-3091234_960_720.jpg"
								alt="First slide">
							<div class="carousel-caption card-shadow reveal">

								<h3>Be Host</h3>
								<a class="left carousel-control"
									href="#carousel-example-generic" role="button"
									data-slide="prev"> <i class="fa fa-chevron-left"
									aria-hidden="true"></i> <span class="sr-only">Previous</span>
								</a> <a class="right carousel-control"
									href="#carousel-example-generic" role="button"
									data-slide="next"> <i class="fa fa-chevron-right"
									aria-hidden="true"></i> <span class="sr-only">Next</span>
								</a>
								<p>누구나 호스트가 될 수 있습니다.</p>
								<p>숙소를 등록하고 최고의 호스트가 되어보세요.</p>
								<br>
								<a href="../project.html" class="custom-sm-btn" title="">
									호스트 되기 </a>
							</div>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
</div>

<div class="section-container">
	<div class="container text-center">

		<div class="row section-container-spacer">

			<div class="col-xs-12 col-md-12">
				<h2 style="color: rgba(255, 149, 149, 0.7);">Best House</h2>
				<p>
					Praesent at feugiat est, at faucibus ipsum. Aenean condimentum
					mauris vel malesuada pulvinar. <br>Vestibulum sit amet
					hendrerit leo, quis vehicula mi.
				</p>
			</div>
		</div>

		<div class="row">
			<c:forEach var="house" items="${houses}">
				<div class="col-xs-12 col-md-4">
					<a href="/house/detail/${house.id}"> <img class="custom-img"
						src="http://localhost:9090/upload/${house.image.imageUrl}"
						class="
						reveal img-responsive
						reveal-contentimage-center"
						style="width: 210px; height: 210px;"></a>
					<h3 style="color: rgba(255, 149, 149, 0.7);">Best</h3>
					<h4>UX designer</h4>
					<p>Sed elementum vehicula nisl, a egestas velit rhoncus
						nec.Cras vel sapien tincidunt, lacinia risus vel, imperdiet neque.</p>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<div class="section-container">
	<div class="container text-center">
		<div class="row section-container-spacer">
			<div class="col-xs-12 col-md-12">
				<h2 class="text-center" style="color: rgba(255, 149, 149, 0.7);">Our
					Service</h2>
				<p>
					Praesent at feugiat est, at faucibus ipsum. Aenean condimentum
					mauris vel malesuada pulvinar. <br>Vestibulum sit amet
					hendrerit leo, quis vehicula mi.
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-4">
				<i class="bi bi-person-check" style="width: 210px; height: 210px;"></i>
			</div>
			<div class="col-xs-12 col-md-4">
				<img src="../assets/images/logo-02.png" alt=""
					class="img-responsive reveal-content image-center">
			</div>
			<div class="col-xs-12 col-md-4">
				<img src="../assets/images/logo-03.png" alt=""
					class="img-responsive reveal-content image-center">
			</div>
		</div>
	</div>
</div>
<%@ include file="layout/footer.jsp"%>