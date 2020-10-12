<%@ page language="java" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:generic>
	<jsp:attribute name="script">
	</jsp:attribute>
	<jsp:attribute name="header">
		<jsp:include page="Header.jsp" /> 
	</jsp:attribute>
	<jsp:attribute name="footer">
		<jsp:include page="Footer.jsp" /> 
	</jsp:attribute>
	<jsp:body>
		<main role="main">
			<div class="bg-secondary text-center py-4 mb-5">
				<div class="container">
					<h1 class="font-weight-bold text-white">Meet the Team</h1>
				</div>
			</div>
			<div class="container">
				<div class="row  justify-content-md-center">
			    	<div class="col-md-4 mb-5">
			      		<div class="card border-0 shadow">
			        		<img src="/BookWala/images/dp1.jpg" class="card-img-top" alt="...">
			        		<div class="card-body text-center">
			          			<h5 class="card-title mb-0">Team Member</h5>
			          			<div class="card-text text-black-50">Masters Student (CSE)</div>
			        		</div>
			      		</div>
			    	</div>
			    	<div class="col-md-4 mb-4">
			      		<div class="card border-0 shadow">
			        		<img src="/BookWala/images/dp2.jpg" class="card-img-top" alt="...">
			        		<div class="card-body text-center">
			          			<h5 class="card-title mb-0">Team Member</h5>
			          			<div class="card-text text-black-50">Masters Student (CSE)</div>
			        		</div>
			      		</div>
			    	</div>
			  	</div>
			</div>
		</main>
	</jsp:body>
</t:generic>