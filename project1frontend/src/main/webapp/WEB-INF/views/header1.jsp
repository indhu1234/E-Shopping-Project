<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/css/navbar.css'></c:url>">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Courgette|Dancing+Script|Great+Vibes|Lobster|Pacifico|Satisfy&display=swap" rel="stylesheet">

<!-- JQuery -->
    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
<title>FashionHi5</title>

</head>
<body>
	<div class="container-fluid" >
		<nav class="navbar navbar-default" id="nav_bar" >
			<div class="navbar-header-inverse">
				<a href="resources/images/logo.png" class="navbar-brand">
					
					<span class="logo_style"><i>FashionHi5</i></span>
				</a>	
<button type="button" class="navbar-toggle collapsed" 
   data-toggle="collapse" data-target="#navbardemo" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
			</div>
			<div class="collapse navbar-collapse" id="navbardemo">
			<ul class="nav navbar-nav">
				<li><a href='<c:url value='/home'></c:url>' class="fontSize">Home</a></li>
				<li><a href="<c:url value='/aboutus'></c:url>" >About Contact Us</a></li>
				<li><a href="<c:url value='/all/getallproducts'></c:url>">New IN</a>
				<li>
				
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dresses<span class="caret"></span></a>	
				<ul class="dropdown-menu">
				<c:forEach items="${categories }" var="category">
				<li><a href="<c:url value='/all/searchByCategory?searchCondition=${category.categoryname }'></c:url>">${category.categoryname }</a>
				</li>
				
				</c:forEach>
				<li>
				<a href="<c:url value='/all/searchByCategory?searchCondition=All'></c:url>">All</a>
				
				</li>
				</ul>
			   </li>
			  
			   <security:authorize access="hasRole('ROLE_ADMIN')">
			   <li><a href="<c:url value='/admin/getproductform'></c:url>">Add Product</a></li>
				</security:authorize> 
				<security:authorize access="hasRole('ROLE_ADMIN')">
			   <li><a href="<c:url value='/admin/getcategory'></c:url>">Manage Category</a></li>
				</security:authorize>    
			   <security:authorize access="hasRole('ROLE_ADMIN')">
			   <li><a href="<c:url value='/admin/getsupplier'></c:url>">Manage Supplier</a></li>
				</security:authorize> 
			   <security:authorize access="hasRole('ROLE_USER')">
			   <li><a href="<c:url value='/cart/getcart'></c:url>">MyCart(${cartSize})<span class="glyphicon glyphicon-shopping-cart"></span></a></li>
			   </security:authorize>
			   </ul>
			   <c:if test="${pageContext.request.userPrincipal.name==null }">
			   <ul class="nav navbar-nav navbar-right">
			    <li><a href="<c:url value='/all/registrationform'></c:url>"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="<c:url value='/login'></c:url>"><span class="glyphicon glyphicon-log-in"></span> LogIn</a></li>
				</ul>
				</c:if>
				
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
				 <ul class="nav navbar-nav navbar-right">
				<li><a href="#">${pageContext.request.userPrincipal.name }</a></li>
				<li><a href="<c:url value='/j_spring_security_logout'></c:url>"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li></ul>
			    </c:if>

            </div>
			</nav>
			</div>
	</body>
</html>