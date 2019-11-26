<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#f
{
 font-size:18px;
 font-family:Arial;
 }
</style>
</head>
<body style="background-color:lightblue;">
	<div class="container">
	<center><h1>Product Details</h1></center>
	<div  class="row text-center text-lg-left">
<%-- 	<c:forEach items="${productObj}" var="product"> --%>
		<div class="col-md-3 col-sm-4 col-xs-12">
		
		<%-- 	<a href="<c:url value="/cart/addtocart/${productObj.id}"/>" class="d-block mb-4 h-100">
			<img class="img-fluid img-thumbnail" id="img" src="<c:url value="/resources/images/${productObj.id}.jpg"/>" style:"width="100" height="100""/>
			<table>
			      <tr><div align="center">Product Desc : ${productObj.productdesc}</div></tr>
			      <tr><div align="center">Price : ${productObj.price} /${productObj.units }</div></tr>
			      <tr><div align="center">Units : /${productObj.units}</div></tr>
			      <tr><div align="center">Quantity : ${productObj.quantity}</div></tr>
			</table>
			</a>
		</div>
		<c:if test="${productObj.quantity==0 }">
			<button class="btn btn-primary btn-lg" disabled>Out Of Stock</button>
			</c:if>
			<c:if test="${productObj.quantity>0 }">
			<security:authorize access="hasRole('ROLE_USER')">
			Enter Quantity:<input type="number" min="1" max="${productObj.quantity }" name="requestedQuantity">
			<select>
			<option>Kg</option>
			<option>Ltr</option>
			</select>
			<button "<c:url value="/cart/addtocart/${productObj.id}"/>"class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-shopping-cart" ></span>Add To Cart</button>
			</security:authorize>
			</c:if>
	</c:forEach>
	
	
	</div>
</div>
	 --%>
	
		<%-- <center><h1>Product Details</h1><br></center>
		<div class="panel-info">
			<div class="panel panel-heading">Product Details</div>
			<div class="panel panel-body"> --%>
			<c:url value="/cart/addtocart/${productObj.id}" var="url"></c:url>
			<form action="${url }" >
			<table>
			<tr><img class="img-fluid img-thumbnail" id="img" src="<c:url value='/resources/images/${productObj.id}.jpg'></c:url>"></tr>
			<tr><div id="f"><b>Product Name:</b>${productObj.productname }</div></tr>
			<tr><div id="f"><b>Product Description:</b>${productObj.productdesc }</div></tr>
			<tr><div id="f"><b>Price:</b>${productObj.price } /${productObj.units }</div></tr>
			<tr><div id="f"><b>Quantity:</b>${productObj.quantity }</div></tr>
			</table>
			<%-- <b>Category:</b>${productObj.category.categoryName}<br> --%>
			<c:if test="${productObj.quantity==0 }">
			<button class="btn btn-primary btn-lg" disabled>Out Of Stock</button>
			</c:if>
			<c:if test="${productObj.quantity>0 }">
			<security:authorize access="hasRole('ROLE_USER')">
			Enter Quantity:<input type="number" min="1" max="${productObj.quantity }" name="requestedQuantity">
			<select>
			<option>Kg</option>
			<option>Ltr</option>
			</select>
			<button class="btn btn-primary btn-lg" type="submit"><span class="glyphicon glyphicon-shopping-cart" ></span>Add To Cart</button>
			</security:authorize>
			</c:if>
			</form>
			</div>
		</div>
	</div>
	<%-- <a href="<c:url value='/all/getallproducts'></c:url>">Browse all products</a> --%>
 <center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:white;">© 2019 Grocerry World All Rights Reserved. &nbsp;</p>
                    </div>
                </div></center>
 
 </body>
</html>
