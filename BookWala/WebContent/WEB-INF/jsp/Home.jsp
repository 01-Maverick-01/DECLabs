<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:generic>
	<jsp:attribute name="header">
		<jsp:include page="Header.jsp" /> 
	</jsp:attribute>
	<jsp:attribute name="footer">
		<jsp:include page="Footer.jsp" /> 
	</jsp:attribute>
	<jsp:body>
		<main role="main">
			<div class="container-fluid">
				<div class="row justify-content-md-center" style="padding: 5px; background-image: url('/BookWala/images/background.jpg');">
					<div class="col-md-8">
						<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
						  	<div class="carousel-inner">
								<div class="carousel-item active">
									<img class="d-block w-100" src="/BookWala/images/banner1.jpg" alt="First slide">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" src="/BookWala/images/banner2.jpg" alt="Second slide">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" src="/BookWala/images/banner3.jpg" alt="Third slide">
								</div>
						  	</div>
						  	<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
						  	</a>
						  	<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
						  	</a>
						</div>
					</div>
				</div>
				<div class="row justify-content-md-center">
					<div class="col-md-12">
						<div class="album py-3">
							<div class="row">
							    <div class="col-lg-11">
							        <h3 class="one">Fresh Arrivals</h3>
							    </div>
							    <a href="/BookWala/purchase" class="btn btn-primary active float-right" role="button" aria-pressed="true">View All</a>
							</div>
							<hr/>
							<div class="container">
								<div class="row">
									<div class="col-md-3">
										<div class="card mb-4 shadow-sm">
											<img class="card-img-top" style="height: 180px; display: block;" src="/BookWala/images/book1.jpg" data-holder-rendered="true">
											<div class="card-body">
												<p class="font-weight-bold mb-0">A Promised Land</p>
												<p class="font-weight-light">By Barack Obama</p>
												<p class="text-muted">$10.99</p>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="card mb-4 shadow-sm">
											<img class="card-img-top" style="height: 180px; display: block;" src="/BookWala/images/book2.jpg" data-holder-rendered="true">
											<div class="card-body">
												<p class="font-weight-bold mb-0">The Guardians</p>
												<p class="font-weight-light">By John Grisham</p>
												<p class="text-muted">$12.99</p>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="card mb-4 shadow-sm">
											<img class="card-img-top" style="height: 180px; display: block;" src="/BookWala/images/book3.jpg" data-holder-rendered="true">
											<div class="card-body">
												<p class="font-weight-bold mb-0">The Fall of Gondolin</p>
												<p class="font-weight-light">By J.R.R. Toliken</p>
												<p class="text-muted">$14.99</p>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="card mb-4 shadow-sm">
											<img class="card-img-top" style="height: 180px; display: block;" src="/BookWala/images/book4.jpg" data-holder-rendered="true">
											<div class="card-body">
												<p class="font-weight-bold mb-0">The Chamber of Secrets</p>
												<p class="font-weight-light">By J.K. Rowling</p>
												<p class="text-muted">$7.99</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<br/>
	</jsp:body>
</t:generic>