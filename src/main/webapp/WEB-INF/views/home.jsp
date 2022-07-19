<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<div class="section-container">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-8 col-md-offset-2">
				<div class="text-center">
					<h2>About Us</h2>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas luctus at sem quis varius. <br> Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus iaculis
						magna sagittis elit sagittis, at hendrerit lorem venenatis. Morbi accumsan iaculis blandit. Cras ultrices hendrerit nisl.
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

				<div id="carousel-example-generic" class="carousel carousel-fade slide" data-ride="carousel">

					<div class="carousel-inner" role="listbox">

						<div class="item active">
							<img class="img-responsive" src="https://cdn.pixabay.com/photo/2016/01/31/14/32/architecture-1171462_960_720.jpg" alt="First slide">
							<div class="carousel-caption card-shadow reveal">

								<h3>Stay</h3>
								<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <i class="fa fa-chevron-left" aria-hidden="true"></i> <span class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <i class="fa fa-chevron-right" aria-hidden="true"></i> <span class="sr-only">Next</span>
								</a>
								<p>EVERYWHERE, WEHNEVER</p>

								<p>편안한 숙소에서 휴식을 취해보세요.</p>
								<br> <a href="/house/list" class="btn btn-primary" title=""> 숙소 보러가기 </a>
							</div>
						</div>
						<div class="item">
							<img class="img-responsive" src="https://cdn.pixabay.com/photo/2018/01/18/20/56/auto-3091234_960_720.jpg" alt="First slide">
							<div class="carousel-caption card-shadow reveal">

								<h3>Be Host</h3>
								<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <i class="fa fa-chevron-left" aria-hidden="true"></i> <span class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <i class="fa fa-chevron-right" aria-hidden="true"></i> <span class="sr-only">Next</span>
								</a>
								<p>누구나 호스트가 될 수 있습니다.</p>
								<p>숙소를 등록하고 최고의 호스트가 되어보세요.</p>
								<br>
								<p>Quisque tempor, ligula pharetra luctus elementum, arcu nisl suscipit ante, pharetra commodo dui est et enim. Sed eu vestibulum elit. Donec ut libero non.</p>
								<a href="../project.html" class="btn btn-primary" title=""> 호스트 되기 </a>
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
				<h2>Partners</h2>
				<p>
					Praesent at feugiat est, at faucibus ipsum. Aenean condimentum mauris vel malesuada pulvinar. <br>Vestibulum sit amet hendrerit leo, quis vehicula mi.
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-4">
				<img src="../assets/images/profil-01.jpg" alt="" class="reveal img-responsive reveal-content image-center">
				<h3>John Snow</h3>
				<h4>UX designer</h4>
				<p>Sed elementum vehicula nisl, a egestas velit rhoncus nec.Cras vel sapien tincidunt, lacinia risus vel, imperdiet neque.</p>

			</div>

			<div class="col-xs-12 col-md-4">
				<img src="../assets/images/profil-02.jpg" alt="" class="reveal img-responsive reveal-content image-center">
				<h3>Sansa Stark</h3>
				<h4>UI designer</h4>
				<p>Praesent at feugiat est, at faucibus ipsum. Aenean condimentum mauris vel malesuadav pulvinar. Vestibulum sit amet hendrerit leo, quis vehicula mi.</p>

			</div>
			<div class="col-xs-12 col-md-4">
				<img src="../assets/images/profil-03.jpg" alt="" class="reveal img-responsive reveal-content image-center">
				<h3>Gregor Clegane</h3>
				<h4>Developer</h4>
				<p>Busce rutrum nisi non dui placerat sodales. Vivamus feugiat rutrum malesuada. Nulla volutpat sapien ac gravida varius</p>

			</div>
		</div>
	</div>
</div>

<div class="section-container">
	<div class="container text-center">
		<div class="row section-container-spacer">
			<div class="col-xs-12 col-md-12">
				<h2 class="text-center">Customers</h2>
				<p>
					Praesent at feugiat est, at faucibus ipsum. Aenean condimentum mauris vel malesuada pulvinar. <br>Vestibulum sit amet hendrerit leo, quis vehicula mi.
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-4">
				<img src="../assets/images/logo-01.png" alt="" class="img-responsive reveal-content image-center">

			</div>

			<div class="col-xs-12 col-md-4">
				<img src="../assets/images/logo-02.png" alt="" class="img-responsive reveal-content image-center">
			</div>
			<div class="col-xs-12 col-md-4">
				<img src="../assets/images/logo-03.png" alt="" class="img-responsive reveal-content image-center">
			</div>
		</div>
	</div>
</div>

<%@ include file="layout/footer.jsp"%>