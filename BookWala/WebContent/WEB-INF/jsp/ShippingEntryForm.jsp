<%@ page language="java" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:generic>
	<jsp:attribute name="script">
		<script>
			$(document).ready(function(){
				$(".form-control").change(function(){
					var data = $.trim($(this).val());
					var id = $(this).attr('id');
					if (data.length == 0 && id != "ad2")
						$(this).addClass("is-invalid");
					else if (id == "zip" && data.length != 5)
						$(this).addClass("is-invalid");
					else
						$(this).removeClass("is-invalid");
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
			<div class="container-fluid" style="min-height:87%">
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
								<h3>Shipping Information</h3>
							</div>
							<div class="card-body">
								<form:form modelAttribute="shipping" method="post" action="submitShipping">
									<table class="table table-borderless">
								   		<tr>
								   			<th>Address Line 1:</th>
								 			<td><form:input id="ad1" class="form-control form-control-sm" path="addressLine1" /></td>
								 		</tr>
								 		<tr>
								   			<th>Address Line 2:</th>
								 			<td><form:input id="ad2" class="form-control form-control-sm" path="addressLine2" /></td>
								 		</tr>
								 		<tr>
								   			<th>City:</th>
								 			<td><form:input id="city" class="form-control form-control-sm" path="city" /></td>
								 		</tr>
								 		<tr>
								   			<th>State:</th>
								 			<td><form:input id="state" class="form-control form-control-sm" path="state" /></td>
								 		</tr>
								 		<tr>
								   			<th>Zip Code:</th>
								 			<td><form:input id="zip" class="form-control form-control-sm" path="zipCode" /></td>
								 		</tr>
								   	</table>
								   	<button type="submit" class="btn btn-primary" value="Shipping">Save</button>
								</form:form>
						  	</div>
						</div>
				    </div>
				</div>
			</div>
		</main>
	</jsp:body>
</t:generic>