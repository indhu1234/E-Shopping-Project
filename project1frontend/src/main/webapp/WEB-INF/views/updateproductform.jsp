<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
 <%-- <%@ include file="UserHome.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:green;font-family:Arial;color:white;font-size:20px;">
<div class="container">
<c:url value="/admin/updateproduct" var="url"></c:url>
<form:form modelAttribute="product" action="${url }" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td></td>
				<!-- user need not
				 give value for id, auto generation -->
				<td><form:hidden path="id"></form:hidden></td>
			</tr>
			<tr>
				<td> Product Name
				</td>
				<td><form:input path="productname" value="${product.productname }"></form:input>
				<form:errors path="productname" cssStyle="color:white"></form:errors>
				</td>
			</tr>
			<tr>
			<td> Product Description</td>
			<td><form:textarea path="productdesc" value="${product.productdesc }"></form:textarea>
			<form:errors path="productdesc" cssStyle="color:white"></form:errors>
			</td></tr>
			<tr>
			<td> Price</td>
			<td><form:input path="price" value="${product.price }"></form:input>
			<form:errors path="price" cssStyle="color:white"></form:errors>
			</td><td>
				<form:select path="units">
			<form:option value="Kg"></form:option>
			<form:option value="Ltr"></form:option>
			</form:select>
			</td></tr>
			<tr><td> Quantity</td>
			<td><form:input path="quantity" type="number" value="${product.quantity}"></form:input>
			<form:errors path="quantity" cssStyle="color:white"></form:errors></td>
				
		
			
			
			</tr>
			<tr><td>Select the Category</td>
			
			<td><form:select path="category.categoryId"><!-- FK column value -->
			<!-- value is to set the value for the path category.id -->
		    <c:forEach items="${categories }" var="c">
		    <form:option value="${c.categoryId }">${c.categoryName }</form:option>
		    </c:forEach>
			</form:select></td></tr>
			<tr><td>Upload image</td><td>
			<form:input path="image" type="file"/>
			</td></tr>
			<tr>
			
			<tr>
			<td></td>
			<td><input type="submit" value="Edit Product"></td>
			</tr>


		</table>

	</form:form>
</div>
<center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:white;">© 2019 Grocerry World All Rights Reserved. &nbsp;</p>
                    </div>
                </div></center>

</body>
</html>
