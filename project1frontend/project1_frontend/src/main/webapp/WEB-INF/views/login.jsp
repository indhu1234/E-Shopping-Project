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
  Login Page<br>
  	${error }<br>
  	${msg }<br>
  	
  	<form action="<c:url value='/j_spring_security_check'></c:url>" method="post">
  	
  	<table>
  		<tr>
  			<td>Enter Username</td>
  			<td><input type="text" name="j_username"></td>
  		</tr>
  	
  		<tr>
  			<td>Enter Password</td>
  			<td><input type="password" name="j_password"></td>
  		</tr>
  		<tr>
  		<td><input type="submit" value="submit"></td>
  		</tr>
  	
  	
  	</table>
  	</form>
  
  
  
  
  
</body>
</html>