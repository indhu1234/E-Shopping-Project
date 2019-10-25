<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div>
<c:url value="/admin/saveorupdateproduct" var="url"></c:url>
<form:form action="${url }" modelAttribute="product" enctype="multipart/form-data"> <!-- 2 -->
<form:hidden path="id"/>
Enter Product Name

<div class="form-group">
<form:label path="productname">Enter Product Name:</form:label>
<form:input path="productname" class="form-control"/>
<form:errors path="productname" cssStyle="color:red"></form:errors>
</div>

<div class="form-group">
<form:label path="quantity">Enter Quantity</form:label>
<form:input path="quantity" class="form-control"/>
</div>

<div class="form-group">
<form:label path="price">Enter Price</form:label>
<form:input path="price" class="form-control" type="number"/>
<form:errors path="price" cssStyle="color:red"></form:errors>
</div>

<div class="form-group">
<form:label path="productDescription">Enter ProductDescription</form:label>
<form:textarea path="productDescription" class="form-control"/>
<form:errors path="productDescription" cssStyle="color:red"></form:errors>
</div>

<div class="form-group">
<form:label path="category.id">Select Category</form:label>
<form:select path="category.id">


<c:forEach items="${categories }" var="c"><!--  c is an object of type Category -->
<form:option value="${c.id }">${c.categoryname}</form:option>
</c:forEach>
</form:select>

<div class="form-group">
<form:label path="image">Upload image</form:label>
<form:input path="image" type="file"/>
</div>
</div>

<div class="form-group">
<c:if test="${product.id==0 }">
<input type="submit" value="Add Product" class="form-control">
</c:if>

<c:if test="${product.id>0 }">
<input type="submit" value="Edit Product" class="form-control">
</c:if>

</div>


</form:form>
</div>
</div>
</body>
</html>