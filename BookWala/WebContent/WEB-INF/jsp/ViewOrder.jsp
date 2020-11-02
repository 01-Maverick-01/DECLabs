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
									   	<span class="float-right">
									   		<b>Total: </b>
									   		<c:out value="$${total}"></c:out>
									   	</span>
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
									   			<th>Name:</th>
									   			<td><c:out value="${shipping.name}"></c:out></td>
									 		</tr>
									 		<tr>
									   			<th>Email:</th>
									   			<td><c:out value="${shipping.email}"></c:out></td>
									 		</tr>
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
									   			<th>Country:</th>
									   			<td><c:out value="${shipping.country}"></c:out></td>
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
		</main>
	</jsp:body>
</t:generic>