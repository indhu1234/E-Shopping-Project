<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp"%>
     <%-- <%@ include file="UserHome.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:orange;font-size:20px;font-family:Arial;">
<h2 align="center">Category Page</h2>

	<form action="<c:url value ='/InsertCategory'/>"  method="post">
	

			<table align="center">
				<tr>
					<td align="center" colspan="2"><h2>Category Information</h2></td>
				</tr>
				<tr>
					<td> Name of the Category</td>
					<td><input type="text" name="catName" /></td>
				</tr>
				<tr>
					<td>Category Description</td>
					<td><input type="text" name="catDesc" /></td>
				</tr>
				<tr>
					<td colspan="2"><center>
							<input type="submit" value="Save Category" />
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
<center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:white;"><b>© 2019 Grocerry World All Rights Reserved. &nbsp;</b></p>
                    </div>
                </div></center>

</body>
</html>