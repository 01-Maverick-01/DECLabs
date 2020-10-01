<%@ page language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form modelAttribute="shipping" method="post" action="submitShipping">
	<table>
   		<tr>
   			<td>Address Line 1</td>
 			<td><form:input path="addressLine1" /></td>
 		</tr>
 		<tr>
   			<td>Address Line 2</td>
 			<td><form:input path="addressLine2" /></td>
 		</tr>
 		<tr>
   			<td>City</td>
 			<td><form:input path="city" /></td>
 		</tr>
 		<tr>
   			<td>State</td>
 			<td><form:input path="state" /></td>
 		</tr>
 		<tr>
   			<td>Zip Code</td>
 			<td><form:input path="zipCode" /></td>
 		</tr>
   		<tr>
   			<td colspan="2"><input type="submit" value="Shipping"></td>  
   		</tr>
   	</table>
</form:form>