<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
    
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
 <body> 
<div class="container">
		<br>
		<div class="panel-info">
			<div class="panel panel-heading">Product Details</div>
			<div class="panel panel-body">
			<c:url value="/cart/updateCart" var="url"></c:url>
			<form action="${url}" >
			<img src="<c:url value='/resources/images/${cartitem.product.getId()}.jpg'></c:url>"><br>
			<b>Product Name:</b>${cartitem.product.getProductname() }<br>
		    <b>Product Desc:</b>${cartitem.product.getProductdesc() }<br> 
			<b>Price:</b>${cartitem.product.getPrice() }<br>
			<b>Quantity:</b>${cartitem.product.getQuantity() }<br>
			<%-- <b>Category:</b>${productObj.category.categoryname}<br> --%>
			<c:if test="${cartitem.product.getQuantity()==0 }">
			<button class="btn btn-primary btn-lg" disabled>Out Of Stock</button>
			</c:if>
			<c:if test="${cartitem.product.getQuantity()>0 }">
			<security:authorize access="hasRole('ROLE_USER')">
			<%-- Enter Quantity:<input type="number" min="1" max="${cartitem.getQuantity() }" name="requestedQuantity"> --%>
			Enter Quantity:<input type="text" name="requestedQuantity" value=${cartitem.quantity }>
			<!-- <button class="btn btn-primary btn-lg" type="submit"><span class="glyphicon glyphicon-shopping-cart" ></span>Add To Cart</button> -->
			<input type="submit" value="Add To Cart" />
			</security:authorize>
			</c:if>
			</form>
			</div>
		</div>
	</div>
	
	$
	<a href="<c:url value='/all/getallproducts'></c:url>">Browse all products</a>

</body>
</html>