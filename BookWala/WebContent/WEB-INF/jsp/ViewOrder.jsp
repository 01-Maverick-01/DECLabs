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
					<div class="row">
						<div class="col-md-12">
							<div class="card border-primary mb-3">
					    		<div class="card-header">
									<h4>Selected Items</h4>
								</div>
								<div class="card-body">
							    	<table class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
										      	<th scope="col">Item</th>
										      	<th scope="col">Price</th>
										      	<th scope="col">Quantity</th>
										    </tr>
										</thead>
								   		<c:forEach items="${order.items}" var="item" varStatus="loop">
								   			<tr>
								   				<td><c:out value="${item.name}"></c:out></td>
								   				<td><c:out value="$${item.price}"></c:out></td>
								   				<td><c:out value="${item.quantity}"></c:out></td>
								   			</tr>
								   		</c:forEach>
								   	</table>
							  	</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="card border-primary h-100">
					    		<div class="card-header">
									<h4>Payment Information</h4>
								</div>
								<div class="card-body">
									<table class="table table-borderless">
								   		<tr>
								   			<th>Card Number:</th>
								   			<td><c:out value="${payment.cardNumber}"></c:out></td>
								 		</tr>
								 		<tr>
								   			<th>Name:</th>
								   			<td><c:out value="${payment.personName}"></c:out></td>
								 		</tr>
								 		<tr>
								   			<th>CVV Code:</th>
								   			<td><c:out value="${payment.cvvCode}"></c:out></td>
								 		</tr>
								 		<tr>
								   			<th>Expiry Date:</th>
								   			<td><c:out value="${payment.expiryDate}"></c:out></td>
								 		</tr>
								   	</table>
							  	</div>
							</div>
					    </div>
						<div class="col-md-6">
							<div class="card border-primary h-100">
					    		<div class="card-header">
									<h4>Shipping Information</h4>
								</div>
								<div class="card-body">
									<table class="table table-borderless">
								   		<tr>
								   			<th>Address Line 1:</th>
								   			<td><c:out value="${shipping.addressLine1}"></c:out></td>
								 		</tr>
								 		<tr>
								   			<th>Address Line 2:</th>
								   			<td><c:out value="${shipping.addressLine2}"></c:out></td>
								 		</tr>
								 		<tr>
								   			<th>City:</th>
								   			<td><c:out value="${shipping.city}"></c:out></td>
								 		</tr>
								 		<tr>
								   			<th>State:</th>
								   			<td><c:out value="${shipping.state}"></c:out></td>
								 		</tr>
								 		<tr>
								   			<th>Zip Code:</th>
								   			<td><c:out value="${shipping.zipCode}"></c:out></td>
								 		</tr>
								   	</table>
							  	</div>
							</div>
					    </div>
					</div>
					<div class="row justify-content-md-center">
						<div class="col-md-3">
							<br/>
							<form:form method="post" action="confirmOrder">
								<button type="submit" class="btn btn-warning btn-block" value="Confirm">Place Order</button>
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