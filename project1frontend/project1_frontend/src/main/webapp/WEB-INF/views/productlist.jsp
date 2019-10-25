<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		var searchCondition = '${searchCondition}';
		$('.table').DataTable({
			"lengthMenu" : [ [  5, 7, -1 ], [  5, 7, "All" ] ],
			"oSearch" : {
				"sSearch" : searchCondition
			}
		})
	});
</script>
</head>
<body>
<div class="container">

<table class ="table table-striped">
      <thead>
		<tr>
			<th>Image</th>
			<th>ProductName</th>
			<th>Price</th>
			<th>Category</th>
			<th>Action</th>
		</tr>		
      </thead>

      <tbody>
		<c:forEach items="${productsAttr }" var="p">
		<tr>
			<td><img src='<c:url value='/resources/images/${p.id }.png'></c:url>' height="40" width="50" alt="Image not Available"></td>
			<td>${p.productname }</td>
			<td>${p.price }</td>
			<td>${p.category.categoryname}</td>
			
			<c:url value="/all/viewproduct/${p.id }" var="viewUrl"></c:url>
			
			<c:url value="/admin/deleteproduct/${p.id }" var="deleteUrl"></c:url>
			<c:url value="/admin/getproductform?id=${p.id }" var="editUrl"></c:url>
			
			<td>
			
			<a href="${viewUrl }"><span class="glyphicon glyphicon-info-sign"></span></a>
			<security:authorize access="hasRole('ROLE_ADMIN')">
			<a href="${deleteUrl }"><span class="glyphicon glyphicon-trash"></span></a>
			<a href="${editUrl }"><span class="glyphicon glyphicon-pencil"></span></a>
			</security:authorize>
			</td>
		</tr>
        </c:forEach>
     </tbody>
     
</table>
</div>
</body>
</html>