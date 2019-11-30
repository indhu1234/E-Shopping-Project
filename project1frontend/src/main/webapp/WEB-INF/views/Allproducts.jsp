<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:pink;">
<h2 align="center" style="color:black;font-family:Arial Black;">ALL PRODUCTS</h2>
 <div class="container">
	<div  class="row text-center text-lg-left">
	
	
	 <c:forEach items="${productsList }" var="product"> 
	
		<div class="col-md-3 col-sm-4 col-xs-12">
			
		<a style="color:black;font-family:Arial;font-size:18px;" href="<c:url value='/all/getproduct/${product.id}'/>" class="d-block mb-4 h-100">
			
			<img class="img-fluid img-thumbnail" id="img" src="<c:url value="/resources/images/${product.id}.jpg"/>" />
			
			<table>
			      <tr><div align="center">${product.productdesc}</div></tr>
			      <tr><div align="center">Price :${product.price} / ${product.units }</div></tr>
			      <tr><div align="center">Stock :${product.quantity}</div></tr>
			      
		        <security:authorize access="hasRole('ROLE_ADMIN')">
				<a href="<c:url value='/admin/deleteproduct/${p.id }'></c:url>">
				<span class="glyphicon glyphicon-trash"></span></a> 
								
			<a href="<c:url value='/admin/getupdateform/${p.id }'></c:url>"><span class="glyphicon glyphicon-pencil"></span></a>
			</security:authorize>

			</table>
			</a>
	
		</div>
	</c:forEach>
	</div>
</div>
 
 <br><br><br><br>
<center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:black;"><b>© 2019 Grocerry World All Rights Reserved. &nbsp;</b></p>
                    </div>
                </div></center>


</body>
</html>