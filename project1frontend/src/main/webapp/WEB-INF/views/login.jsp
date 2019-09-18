<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<span style="color:red">${error }</span><br>
${msg }<br>
<b>Login Page</b>
<c:url value="/j_spring_security_check" var="url"></c:url>
<form method="post" action="${url }">
Enter Email :<input type="text" name="j_username"><br>
Enter password : <input type="password" name="j_password">
<input type="submit" value="Login">

</form>
</body>
</html>

