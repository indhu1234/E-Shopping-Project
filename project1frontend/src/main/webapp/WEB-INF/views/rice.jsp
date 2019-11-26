<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:brown;color:white;">
<h2 align="center">RICE</h2>
<hr>
    <div class="container">
	<div  class="row text-center text-lg-left">
	<c:forEach items="${productsList}" var="product">
		<div class="col-md-3 col-sm-4 col-xs-12">
			<a  style="color:white;font-family:Arial;font-size:18px;" href="<c:url value="/all/getproduct/${product.id}"/>" class="d-block mb-4 h-100">
			<img class="img-fluid img-thumbnail" id="img" src="<c:url value="/resources/images/${product.id}.jpg"/>" style:"width="100" height="100""/>
			<table>
			      <tr><div align="center">${product.productdesc}</div></tr>
			      <tr><div align="center">Price :${product.price} /${product.units }</div></tr>
			      <tr><div align="center">Stock :${product.quantity}</div></tr>
			</table>
			</a>
		</div>
	</c:forEach>
	</div>
</div>

</body>
</html>