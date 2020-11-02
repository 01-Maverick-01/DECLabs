<%@ page language="java" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:generic>
	<jsp:attribute name="script">
		<script>
			$(document).ready(function(){
				$(".form-control").change(function(){
					var input = $(this)
					var quantity = parseInt(input.val());
					if (quantity >= 0) {
						var bookName = $(this).attr("data-book-name");
						var dataString = "name="+ bookName +"&quantity="+quantity;
						$.ajax ({
							type: "GET",
						  	url: "/BookWala/purchase/checkInventory",
						  	data: dataString,
						  	success: function(data, status){
						  		if (data == "true")
						  			input.removeClass("is-invalid");
						  		else {
						  			input.addClass("is-invalid");
						  			alert("Error: Not enough items present in inventory");
						  		}
						  	}
						});	
					}
					else
						$(this).addClass("is-invalid");
			  	});
			});
		</script> 
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
				    	<div class="card border-primary mb-3">
				    		<div class="card-header">
								<h3>Select Items</h3>
							</div>
							<div class="card-body">
						    	<form:form modelAttribute="order" method="post" action="purchase/submitItems">
									<table class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
										      	<th scope="col">Item</th>
										      	<th scope="col">Price</th>
										      	<th scope="col">Quantity</th>
										    </tr>
										</thead>
								   		<c:forEach items="${inventory.items}" var="item" varStatus="loop">
								   			<tr>
								   				<td><c:out value="${item.name}"></c:out></td>
								   				<td><c:out value="$${item.price}"></c:out></td>
								   				<form:hidden path="items[${loop.index}].name" value="${item.name}"/>
								   				<form:hidden path="items[${loop.index}].price" value="${item.price}"/>
								   				<form:hidden path="items[${loop.index}].itemNumber" value="${item.itemNumber}"/>
								   				<td><form:input data-book-name="${item.name}" class="form-control" path="items[${loop.index}].quantity" /></td>
								   			</tr>
								   		</c:forEach>
								   	</table>
								   	<button type="submit" class="btn btn-primary" value="Purchase">Purchase</button>
								</form:form>
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