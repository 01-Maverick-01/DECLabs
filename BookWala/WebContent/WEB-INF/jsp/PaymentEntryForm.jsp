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
				    	<div class="card border-primary mb-3">
				    		<div class="card-header">
								<h3>Payment Information</h3>
							</div>
							<div class="card-body">
								<form:form modelAttribute="payment" method="post" action="submitPayment">
									<table class="table table-borderless">
								   		<tr>
								   			<th>Card Number:</th>
								 			<td><form:input class="form-control form-control-sm" path="cardNumber" /></td>
								 		</tr>
								 		<tr>
								   			<th>Name:</th>
								 			<td><form:input class="form-control form-control-sm" path="personName" /></td>
								 		</tr>
								 		<tr>
								   			<th>CVV Code:</th>
								 			<td><form:input class="form-control form-control-sm" path="cvvCode" /></td>
								 		</tr>
								 		<tr>
								   			<th>Expiry Date:</th>
								 			<td><form:input class="form-control form-control-sm" path="expiryDate" /></td>
								 		</tr>
								   	</table>
								   	<button type="submit" class="btn btn-primary" value="Payment">Save</button>
								</form:form>
						  	</div>
						</div>
				    </div>
				</div>
			</div>
		</main>
	</jsp:body>
</t:generic>