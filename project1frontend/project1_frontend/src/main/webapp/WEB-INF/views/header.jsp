<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="security"
    uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored ="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="<c:url value='/resources/css/login.css'></c:url>">
 
  <!-- Angular Js -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
      
       <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
 
 <title>sports</title>
</head>
<body>
<nav class="navbar navbar-default">
		<div class="container-fluid">
		<button type="button" class="navbar-toggle collapsed" 
   data-toggle="collapse" data-target="#collapse-example" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
		<div class="navbar-header">
		<c:url value="resources/images/ast1.jpg" var="url"></c:url>
		<a class="navbar-brand" href=""><img src="${url }" alt="logo" height="50px" width="50px"></a>
			</div>
			<div  class="collapse navbar-collapse" id="collapse-example">
		<ul class="nav navbar-nav">
		<c:url value="/home" var="homeUrl"></c:url>
			<li class="active"><a href="${homeUrl }">Home<span class="sr-only">You are in home page link</span></a></li>
			<c:url value="/aboutus" var="aboutUsUrl"></c:url>
			<li><a href="${aboutUsUrl }">AboutUs</a>
			
			<c:url value="/admin/getproductform?id=0" var="productForm"></c:url>
			<security:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="${productForm }">Add Product</a></li>
			</security:authorize>
			
			<c:url value="/all/getallproducts" var="productsUrl"></c:url>
			<li><a href="${productsUrl }">Browse all products</a>
		
			
			
			 <security:authorize access="hasRole('ROLE_USER')">
			<li><a href="<c:url value='/cart/getcart'></c:url>">cart</a></li>
			</security:authorize>
			
			<c:if test="${pageContext.request.userPrincipal.name==null }">
			<li><a href="<c:url value='/login'></c:url>">Sign In</a></li>
			<li><a href='<c:url value='/all/registrationform'></c:url>'>Sign Up</a></li>
			</c:if>
			
			<c:if test="${pageContext.request.userPrincipal.name!=null }">
			<li><a href="">Welcome ${pageContext.request.userPrincipal.name}</a></li>
			<li><a href="<c:url value='/j_spring_security_logout'></c:url>">logout</a></li>
			</c:if>
	        
				
		    </ul>
			
			
			
		</div>
		</nav>
</body>
</html>