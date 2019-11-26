<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ include file="header.jsp"%>
     <%-- <%@ include file="UserHome.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:pink;font-family:Arial;color:black;font-size:20px;">
<form action="<c:url value ='/UpdateSupplier'/>"  method="post">
	

			<table align="center">
				<tr>
					<td colspan="2">Supplier Information</td>
				</tr>
				<tr>
					<td> Supplier ID</td>
					<td><input type="text" name="supId" value="${supplier.supplierId}" /></td>
				</tr>
			
				<tr>
					<td> Name of the Supplier</td>
					<td><input type="text" name="supName" value="${supplier.supplierName}" /></td>
				</tr>
				<tr>
					<td>Supplier Description</td>
					<td><input type="text" name="supDesc" value="${supplier.supplierDesc}" /></td>
				</tr>
				<tr>
					<td colspan="2"><center>
							<input type="submit" value="Update Supplier" />
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
						<a href="<c:url value="/editsupplier/${supplier.supplierId}"/>"class="btn btn-success">Edit</a>
							<a href="<c:url value="/deletesupplier/${supplier.supplierId}"/>"class="btn btn-danger">Delete</a>
					</tr>
				</c:forEach>

			</table>

		</form>
<center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:white;">© 2019 Grocerry World All Rights Reserved. &nbsp;</p>
                    </div>
                </div></center>

</body>
</html>