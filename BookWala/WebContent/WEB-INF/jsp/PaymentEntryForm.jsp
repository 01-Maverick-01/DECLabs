<%@ page language="java" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
	<head>
		<title>BookWala</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
			  integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" 
			  crossorigin="anonymous">
	</head>
	<body style="background-color: #f0f0f0;">
		<nav class="navbar navbar-dark bg-dark">
  			<a class="navbar-brand" href="/BookWala/purchase"><h2>BookWala</h2></a>
		</nav>
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
		
		<!-- JS, Popper.js, and jQuery -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
		        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" 
		        crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" 
		        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" 
		        crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
		        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" 
		        crossorigin="anonymous"></script>
	</body>
</html>