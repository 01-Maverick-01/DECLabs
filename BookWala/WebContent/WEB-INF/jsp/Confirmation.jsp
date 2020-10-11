<%@ page language="java" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
			<div class="container-fluid" style="min-height:87%">
				<div class="row justify-content-md-center">
					<div class="col-md-8">
						<br/>
						<div class="card text-center">
							<div class="card-body">
						    	<h2 class="card-title">Your order is confirmed!</h2>
						    	<p class="card-text">Thank you for shopping. We will notify you once your order has shipped.</p>
						    	<p class="card-text">Order#: ${orderId}</p>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</jsp:body>
</t:generic>