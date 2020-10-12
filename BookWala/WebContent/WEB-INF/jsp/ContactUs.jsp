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
			<div class="container-fluid">
				<div class="row justify-content-md-center">
				    <div class="col-md-8">
				    	<br/>
				    	<c:if test="${errors != null}">
							<div class="alert alert-danger alert-dismissible fade show" role="alert">
								<c:out value="${errors}"></c:out>
								<button type="button" class="close" data-dismiss="alert" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</c:if>
						<div class="row">
							<br/>
							<div class="col-md-6">
								<div class="card border-primary mb-3">
						    		<div style="width: 100%">
										<embed width="100%" height="548" 
												src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=2015%20Neil%20Avenue+(BookWala)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">
										</embed>
									</div>
								</div>
							</div>
							<div class="col-md-6">
						    	<div class="card border-primary mb-3">
						    		<div class="card-header">
										<h3>Contact Us</h3>
									</div>
									<div class="card-body">
										<form:form modelAttribute="contactInfo" method="post" action="submitContactForm">
											<table class="table table-borderless">
										   		<tr>
										   			<th>Name:</th>
										 			<td><form:input id="cardNumber" class="form-control form-control-sm" path="name" /></td>
										 		</tr>
										 		<tr>
										   			<th>Phone:</th>
										 			<td><form:input class="form-control form-control-sm" path="phone" /></td>
										 		</tr>
										 		<tr>
										   			<th>Email:</th>
										 			<td><form:input id="cvvCode" class="form-control form-control-sm" path="email"/></td>
										 		</tr>
										 		<tr>
										   			<th>Message:</th>
										 			<td><form:textarea id="expiry" class="form-control form-control-sm" path="message" style="min-height:180px;"/></td>
										 		</tr>
										   	</table>
										   	<button type="submit" class="btn btn-primary" value="Payment">Send</button>
										</form:form>
								  	</div>
								</div>
							</div>
						</div>
				    </div>
				</div>
			</div>
		</main>
		<br/>
		<br/>
		<br/>
	</jsp:body>
</t:generic>