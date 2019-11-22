<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page isELIgnored="false" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/navbar.css'></c:url>"> --%>
<!-- <meta charset="utf-8"> -->

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

 <title>Insert title here</title>
</head>
<body>
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header" >
		
		 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
		       
				<a class="navbar-brand" href=""><img src="<c:url value='/resources/images/logo1.png'></c:url>" alt="ESTORE" height="80px" width="80px" class="navbar-brand"></a>
 			</div>
			<!-- <div class="collapse navbar-collapse" id="navbardemo"> -->
			 <div class="collapse navbar-collapse" id="myNavbar">
			
			<ul class="nav navbar-nav">
			
				<li class="active"><a href='<c:url value='/home'></c:url>' >&nbsp;  &nbsp;Home</a></li>
				<li><a href="<c:url value='/aboutus'></c:url>" >About Us</a></li>
				<li><a href="<c:url value='/all/getallproducts'></c:url>"  >Products</a>
				
				<li class="dropdown-toggle"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" >Category<span class="caret"></span></a>
					
				<ul class="dropdown-menu">
				<c:forEach items="${categories }" var="category">
				<li><a href="<c:url value='/all/searchByCategory?searchCondition=${category.categoryName }'></c:url>">${category.categoryName }</a>
				</li>
				
				</c:forEach>
				<li>
				<a href="<c:url value='/all/searchByCategory?searchCondition=All'></c:url>" >All</a>
				</li>
				</ul>
			   
			  
			  
			   <security:authorize access="hasRole('ROLE_ADMIN')">
			   <li><a href="<c:url value='/admin/getproductform'></c:url>" >Manage Product</a></li>
				</security:authorize>    
			   
			   <security:authorize access="hasRole('ROLE_ADMIN')">
			   <li><a href="<c:url value='/admin/category'></c:url>" >Manage Category</a></li>
				</security:authorize>    
			   
			   <security:authorize access="hasRole('ROLE_ADMIN')">
			   <li><a href="<c:url value='/admin/supplier'></c:url>" >Manage Supplier</a></li>
				</security:authorize>    
			   
			   
			   <security:authorize access="hasRole('ROLE_USER')">
			   <li><a href="<c:url value='/cart/getcart'></c:url>" ><span class="glyphicon glyphicon-shopping-cart"></span>(${cartSize})</a></li>
			   </security:authorize>
			   
			   <c:if test="${pageContext.request.userPrincipal.name==null }">
				 <li><a href="<c:url value='/all/registrationform'></c:url>">Sign Up</a></li>
			<%-- 	<li><a href="<c:url value='/register'></c:url>"  >Sign Up</a></li> --%>
				<li><a href="<c:url value='/login'></c:url>" >Sign In</a></li>
				</c:if>
			</ul>	
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
				<li><a href="#" >Welcome ${pageContext.request.userPrincipal.name }</a></li>
				<li><a href="<c:url value='/j_spring_security_logout'></c:url>" >Sign out</a></li>
			    </c:if>
			   </ul>
              </div>			
			</div>
		</nav>

</body>
</html>
