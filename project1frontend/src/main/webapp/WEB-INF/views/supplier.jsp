<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
		
	
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body background="resources/images/bg6.jpg">

	<h2 align="center">Supplier Page</h2>

	<form action="<c:url value ='/InsertSupplier'/>"  method="post">
	

			<table align="center">
				<tr>
					<td colspan="2">Supplier Info</td>
				</tr>
				<tr>
					<td>Supplier Name</td>
					<td><input type="text" name="supName" /></td>
				</tr>
				<tr>
					<td>Supplier Desc</td>
					<td><input type="text" name="supDesc" /></td>
				</tr>
				<tr>
					<td colspan="2"><center>
							<input type="submit" value="Save Supplier" />
						</center>
						</td>
				</tr>
</form>

			</table>
			</br></br>
			<table align="center" border="1">
				<tr>
					<td>Supplier ID</td>
					<td>Supplier Name</td>
					<td>Supplier Desc</td>
					<td>Operation</td>
				</tr>
				<c:forEach items="${supplierList}" var="supplier">
					<tr>
						<td>${supplier.supplierId}</td>
						<td>${supplier.supplierName}</td>
						<td>${supplier.supplierDesc}</td>
						<td>
						<a href="<c:url value="/editSupplier/${supplier.supplierId}"/>"class="btn btn-success">Edit</a>
							<a href="<c:url value="/deleteSupplier/${supplier.supplierId}"/>"class="btn btn-danger">Delete</a>
					</tr>
				</c:forEach>

			</table>

		</form>
</body>
</html>