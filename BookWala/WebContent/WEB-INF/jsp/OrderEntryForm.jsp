<%@ page language="java" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form modelAttribute="order" method="post" action="purchase/submitItems">
	<table>
   		<c:forEach items="${order.items}" var="item" varStatus="loop">
   			<tr>
   				<td><c:out value="${item.name}"></c:out></td>
   				<td><c:out value="$${item.price}"></c:out></td>
   				<td><form:input path="items[${loop.index}].quantity" /></td>
   			</tr>
   		</c:forEach>
   		<tr>
   			<td colspan="2"><input type="submit" value="Purchase"></td>  
   		</tr>
   	</table>
</form:form>