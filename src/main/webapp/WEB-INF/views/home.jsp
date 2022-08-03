<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<style>
.ranking-list:hover {
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

.img-responsive {
	width: 600px;
	height: 600px;
}

.custom-img {
	border-radius: 10px;
}
</style>
<div class="section-container">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-8 col-md-offset-2">
				<div class="text-center">
					<h2>Comma(,)</h2>
					<p>
						콤마(Comma)는 쉼표를 의미합니다. <br> 쉼표가 문장 안에서의 쉼을 나타내듯이, <br> 우리의 일상에도 쉼표를 찍는 순간이 필요합니다. <br> 콤마와 함께 일상에 쉼표를 찍어보세요.
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
							<img class="img-responsive" src="https://cdn.pixabay.com/photo/2016/01/31/14/32/architecture-1171462_960_720.jpg" style="height: 700px; width: 800px" alt="First slide">
							<div class="carousel-caption card-shadow reveal">

								<h3>Stay</h3>
								<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <i class="fa fa-chevron-left" aria-hidden="true"></i> <span class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <i class="fa fa-chevron-right" aria-hidden="true"></i> <span class="sr-only">Next</span>
								</a>
								<p>EVERYWHERE, WEHNEVER</p>

								<p>편안한 숙소에서 휴식을 취해보세요.</p>
								<br> <a href="/house/list" class="custom-sm-btn" title=""> 숙소 보러가기 </a>
							</div>
						</div>
						<div class="item">
							<img class="img-responsive" src="https://cdn.pixabay.com/photo/2014/12/28/09/52/friends-581753_960_720.jpg" style="height: 700px; width: 800px; object-fit: cover;">
							<div class="carousel-caption card-shadow reveal">

								<h3>Be Host</h3>
								<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <i class="fa fa-chevron-left" aria-hidden="true"></i> <span class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <i class="fa fa-chevron-right" aria-hidden="true"></i> <span class="sr-only">Next</span>
								</a>
								<p>누구나 호스트가 될 수 있습니다.</p>
								<p>숙소를 등록하고 최고의 호스트가 되어보세요.</p>
								<br> <a href="/be-host" class="custom-sm-btn" title=""> 호스트 되기 </a>

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
				<p>게스트들이 뽑은 최고의 숙소</p>
			</div>
		</div>

		<div class="row">
			<c:forEach var="house" items="${houses}">
				<%!int number = 1;%>
				<div class="ranking-list col-xs-12 col-md-4">
					<a href="/house/detail/${house.id}"> <img class="custom-img" src="http://localhost:9090/upload/${house.image.imageUrl}" class="
						reveal img-responsive
						reveal-contentimage-center" style="width: 210px; height: 210px; object-fit: cover;"></a>
					<h3 style="color: rgba(255, 149, 149, 0.7);">
						Best
						<%=number++%></h3>

				</div>
			</c:forEach>
			<%
			number = 1;
			%>
		</div>
	</div>
</div>
<div class="section-container">
	<div class="container text-center">
		<div class="row section-container-spacer">
			<div class="col-xs-12 col-md-12">
				<h2 class="text-center" style="color: rgba(255, 149, 149, 0.7);">Our Service</h2>
				<p>
					콤마에서 제공하는 서비스 <br>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-8 col-md-3">
				<i class="bi bi-calendar-check" style="font-size: 170px; color: rgba(255, 149, 149, 0.7);"></i>
				<h3 style="color: rgba(255, 149, 149, 0.7);">Reservations</h3>
			</div>
			<div class="col-xs-8  col-md-3">
				<i class="bi bi-house-fill" style="font-size: 170px; color: rgba(255, 149, 149, 0.7);"></i>
				<h3 style="color: rgba(255, 149, 149, 0.7);">Hosting</h3>
			</div>
			<div class="col-xs-8  col-md-3">
				<i class="bi bi-card-list" style="font-size: 170px; color: rgba(255, 149, 149, 0.7);"></i>
				<h3 style="color: rgba(255, 149, 149, 0.7); font-style: bold;">Browse</h3>
			</div>
			<div class="col-xs-8 col-md-3">
				<i class="bi bi-pencil-square" style="font-size: 170px; color: rgba(255, 149, 149, 0.7);"></i>
				<h3 style="color: rgba(255, 149, 149, 0.7); font-style: bold;">Review</h3>
			</div>
		</div>
		<br><br>
	</div>
</div>
<%@ include file="layout/footer.jsp"%>