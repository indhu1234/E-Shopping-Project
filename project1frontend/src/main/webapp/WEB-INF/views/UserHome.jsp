<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%-- <%@ include file="header.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<!--Bootstrap JS CDN-->
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 -->
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<ul class="wrapper"> 
        <li><a href="vegetables">Vegetables</a></li>
        <li><a href="fruits">Fruits</a></li>
        <li><a href="nuts">Nuts</a></li>
        <li><a href="rice">Rice</a></li>
        <li><a href="oils">Oil Items</a></li>
</ul>
<hr>
<div class="container">
	<div  class="row text-center text-lg-left">
	<c:forEach items="${productsList}" var="product">
		<div class="col-md-3 col-sm-4 col-xs-12">
			<a href="<c:url value="/all/getproduct/${product.id}"/>" class="d-block mb-4 h-100">
			<img class="img-fluid img-thumbnail" id="img" src="<c:url value="/resources/images/${product.id}.jpg"/>" />
			<table>
			      <tr><div align="center">${product.productdesc}</div></tr>
			      <tr><div align="center">Price :${product.price} / ${product.units }</div></tr>
			      <tr><div align="center">Stock :${product.quantity}</div></tr>
			</table>
			</a>
		</div>
	</c:forEach>
	</div>
</div>

     

</body>
</html>