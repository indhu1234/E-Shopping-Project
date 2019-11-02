<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value ='/UpdateCategory'/>"  method="post">
	

			<table align="center">
				<tr>
					<td colspan="2">Category Information</td>
				</tr>
				<tr>
				<td>Category Id </td>
				<td><input type="text" value="${category.categoryId}" name="catId"></td>
				</tr>
				<tr>
					<td> Name of the Category</td>
					<td><input type="text" value="${category.categoryName}" name="catName" /></td>
				</tr>
				<tr>
					<td>Category Description</td>
					<td><input type="text" value="${category.categoryDesc}" name="catDesc" /></td>
				</tr>
				<tr>
					<td colspan="2"><center>
							<input type="submit" value="Update Category" />
						</center>
						</td>
				</tr>
</form>

			</table>
			</br></br>
			<table align="center" border="1">
				<tr>
					<td>Category ID</td>
					<td>Category Name</td>
					<td>Category Desc</td>
					<td>Operation</td>
				</tr>
				<c:forEach items="${categoryList}" var="category">
					<tr>
						<td>${category.categoryId}</td>
						<td>${category.categoryName}</td>
						<td>${category.categoryDesc}</td>
						<td>
						<a href="<c:url value="/editcategory/${category.categoryId}"/>"class="btn btn-success">Edit</a>
							<a href="<c:url value="/deletecategory/${category.categoryId}"/>"class="btn btn-danger">Delete</a>
					</tr>
				</c:forEach>

			</table>

		</form>

</body>
</html>