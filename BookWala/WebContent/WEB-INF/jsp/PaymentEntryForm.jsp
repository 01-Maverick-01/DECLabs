<%@ page language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form modelAttribute="payment" method="post" action="submitPayment">
	<table>
   		<tr>
   			<td>Card Number</td>
 			<td><form:input path="cardNumber" /></td>
 		</tr>
 		<tr>
   			<td>Name</td>
 			<td><form:input path="personName" /></td>
 		</tr>
 		<tr>
   			<td>CVV Code</td>
 			<td><form:input path="cvvCode" /></td>
 		</tr>
 		<tr>
   			<td>Expiry Date</td>
 			<td><form:input path="expiryDate" /></td>
 		</tr>
   		<tr>
   			<td colspan="2"><input type="submit" value="Payment"></td>  
   		</tr>
   	</table>
</form:form>