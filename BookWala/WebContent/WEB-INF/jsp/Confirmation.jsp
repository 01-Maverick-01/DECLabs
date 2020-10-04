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