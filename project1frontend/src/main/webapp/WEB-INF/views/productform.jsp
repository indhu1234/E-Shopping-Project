<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

form
{
   background-color:green;
   
   text-align:left;
}
tr
{
   background-color:green;
}
td
{
   background-color:green;
   
}
</style>
</head>
<body>
<div class="container">
	<!--  p=new Product(), initially all the properties will have default values
	var url="/admin/addproduct"
	 -->
	<c:url value="/admin/addproduct" var="url"></c:url>
	<form:form modelAttribute="product" action="${url }" method="post" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
				
				<!-- user need not give value for id, auto generation -->
				<td><form:hidden path="id"></form:hidden></td>
			</tr>
			<tr>
				<td style="color:white;">Enter Product Name
				</td>
				<td><form:input path="productname" placeholder="Productname is mandatory"></form:input>
				<form:errors path="productname" cssStyle="color:white"></form:errors>
				</td>
				
			</tr>
			<tr>
			<td style="color:white;">Enter Product Description</td>
			<td><form:textarea path="productdesc"></form:textarea>
			<form:errors path="productdesc" cssStyle="color:white"> </form:errors>
			</td>
			
			<tr>
			</tr>
			<td style="color:white;">Enter Price</td>
			<td><form:input path="price" type="text"></form:input>
			<form:errors path="price" cssStyle="color:white"></form:errors>
			</td></tr>
			<tr><td style="color:white;">Enter Quantity</td>
			<td><form:input path="quantity" type="number"></form:input>
			<form:errors path="quantity" cssStyle="color:white"></form:errors>
			<!-- </td>
			<td> -->
			<form:select path="units">
			<form:option value="Kg"></form:option>
			<form:option value="Ltr"></form:option>
			</form:select>
			</td>
			
			</tr>
			
			<tr><td style="color:white;">Select the Category</td>
			
			<td><form:select path="category.categoryId"><!-- FK column value -->
			<!-- value is to set the value for the path category.id -->
		    <c:forEach items="${categories }" var="c">
		    <form:option value="${c.categoryId }">${c.categoryName }</form:option>
		    </c:forEach>
			</form:select></td></tr>
			
			
			<tr><td style="color:white;">Upload image</td><td>
			<form:input path="image" type="file"/>
			</td></tr>
			<tr>
			
			<td></td>
			<td><input type="submit" value="Add Product" class="btn btn-primary"></td>
			</tr>

		</table>

	</form:form>
	</div>
	<br>
	<table align="center" border="1" style="color:white;font-family:Arial;font-size:15px;">
	<tr>
			<td>Product ID</td>
			<td>Product Name</td>
			<td>Product Desc</td>
			<td>price / Units</td>
			<td>Quantity</td>
			<td>Operation</td>
	</tr>
				<c:forEach items="${productsList}" var="product">
					<tr>
						<td>${product.id}</td>
						<td>${product.productname}</td>
					
						<td>${product.productdesc}</td>
						<td>${product.price } / ${product.units}</td>
						<td>${product.quantity }</td>
						<td>
						<a href="<c:url value="/admin/getupdateform/${product.id}"/>"class="btn btn-success">Edit</a>
							<a href="<c:url value="/admin/deleteproduct/${product.id}"/>"class="btn btn-danger">Delete</a>
					</tr>
				</c:forEach>

			</table>
	<br><br><br>

	<center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:white;"><b>� 2019 Grocerry World All Rights Reserved. &nbsp;</b></p>
                    </div>
                </div></center>
	
</body>
</html>

