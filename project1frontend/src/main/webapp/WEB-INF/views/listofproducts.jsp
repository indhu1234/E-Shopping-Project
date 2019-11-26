<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
 <%-- <%@ include file="UserHome.jsp"%> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	var searchCondition='${searchCondition}'
	$('.table').DataTable({
		"lengthMenu":[[5,7,-1],[5,7,"All"]],
	    "oSearch" : {
		"sSearch" : searchCondition
		}
	})
})


</script>

<!-- <script type="text/javascript">
$(document).ready(function(){
	var searchCondition='${searchCondition}'
	$("div").filter(searchCondition);
		
})
 -->

</script>


</head>
<body style=background-color:pink;">
<center><h1><b>List of Products</b></h1></center>

<%-- 	<div class="container">

<div  class="row text-center text-lg-left">
	<c:forEach items="${productsList}" var="p">
		<div class="col-md-3 col-sm-4 col-xs-12">
			<a href="<c:url value="/totalProductDisplay/${product.productId}"/>" class="d-block mb-4 h-100">
			
			<a href="<c:url value='/all/getproduct/${p.id }'></c:url>">${p.id }
			<img class="img-fluid img-thumbnail" id="img" src="<c:url value="/resources/images/${p.id}.jpg"/>" style:"width="100" height="100""/></a>
			<table>
			      <tr><div align="center">${p.productdesc}</div></tr>
			      <tr><div align="center">Price :${p.price}</div></tr>
			      <tr><div align="center">Stock :${p.quantity}</div></tr>
			</table>
						<!-- <span class="glyphicon glyphicon-info-sign"></span></a> --> 
				
                                <security:authorize access="hasRole('ROLE_ADMIN')">
								<a href="<c:url value='/admin/deleteproduct/${p.id }'></c:url>"><span
								class="glyphicon glyphicon-trash"></span></a> 
								
								<a href="<c:url value='/admin/getupdateform/${p.id }'></c:url>"><span
								class="glyphicon glyphicon-pencil"></span></a>
								  </security:authorize>
				
			</a>
		</div>
	</c:forEach>
	</div>
</div>


				<table class="table table-striped" border="1">
			<thead>
				<tr>
					<th>Id</th>
					<th>Image</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Category</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<!-- For each object in the list, tr has to be repeated -->
				<!--  items refers to the collection of objects -->
				<!-- var is local variable ,takes objects one by one from the collection -->
				<c:forEach items="${productsList }"  var="p" >
					<tr >
						<td><a href="<c:url value='/all/getproduct/${p.id }'></c:url>">${p.id }</a></td>
					   <td>
					   <img class="img-fluid img-thumbnail" id="img" src="<c:url value="/resources/images/${p.id}.jpg"/>" style:"width="100" height="100""/></td>
					   <img src="<c:url value='resources/images/${p.id }.jpg'></c:url>" height="30px" width="30px"></td>
						<td><a href="<c:url value='/all/getproduct/${p.id }'></c:url>">${p.productname }</a></td>
						<td>${p.price }</td>
						<td>${p.category.categoryName }</td>
						<td>
						
						   <a href="<c:url value='/all/getproduct/${p.id }'></c:url>">
							<span
								class="glyphicon glyphicon-info-sign"></span></a> 
				
                                <security:authorize access="hasRole('ROLE_ADMIN')">
								<a href="<c:url value='/admin/deleteproduct/${p.id }'></c:url>"><span
								class="glyphicon glyphicon-trash"></span></a> 
								
								<a href="<c:url value='/admin/getupdateform/${p.id }'></c:url>"><span
								class="glyphicon glyphicon-pencil"></span></a>
								  </security:authorize>
									</td>
                              
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div> 
 --%>
 
 <div class="container">
	<div  class="row text-center text-lg-left">
	<c:forEach items="${productsList}" var="product">
		<div class="col-md-3 col-sm-4 col-xs-12">
			<a style="color:black;font-family:Arial;font-size:18px;" href="<c:url value="/all/getproduct/${product.id}"/>" class="d-block mb-4 h-100">
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
 
 
<center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:black;">© 2019 Grocerry World All Rights Reserved. &nbsp;</p>
                    </div>
                </div></center>

</body>

</html>


