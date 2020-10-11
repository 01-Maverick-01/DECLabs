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
				    	<div class="card border-primary mb-3">
				    		<div class="card-header">
								<h3>Contact Us</h3>
							</div>
							<div class="card-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
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