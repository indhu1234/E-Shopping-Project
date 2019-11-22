<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/registration.css"></c:url>'>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$('#form').validate({
			rules:{
				"apartmentnumber":{required:true},
				"street":{required:true},
				
				"city":{required:true},
				
				"zipcode":{required:true,number:true}
			}
		})
	})
</script>

</head>
<body>
<p align="center"><b>Shipping Address</b></p>
<div class="container">
<c:url var="url" value="/receipt/address"></c:url>
<form action="${url }" method="post">
ID :
<input type="hidden" name="id" value=${address.id }  > <br>
Enter Apartment Number :
<input type="text" name="apartmentnumber"><br>
Enter Street Name :
<input type="text" name="streetname"><br>
Enter City:
<input type="text" name="city"><br>

Enter State :
<input type="text" name="state"><br>
Enter Country :
<input type="text" name="country"><br>

Enter Zip Code :
<input type="text" name="zipcode"><br>
<br>
<input type="submit" value="Submit">
<input type="reset" value="reset">

<%-- 	
<form:hidden path="id"/>

<form:label path="apartmentnumber">Enter Apartmentnumber</form:label>
<form:input path="apartmentnumber" id="apartmentnumber"/>


<form:label path="streetname">Enter Streetname</form:label>
<form:input path="streetname" id="streetname"/>


<form:label path="city">Enter city</form:label>
<form:input path="city" id="city"/>


<form:label path="state">Enter State</form:label>
<form:input path="state" id="state"/>


<form:label path="country">Enter country</form:label>
<form:input path="country" id="country"/>


<form:label path="zipcode">Enter zipcode</form:label>
<form:input path="zipcode" id="zipcode"/>


<button type="submit" >Next</button>
</form:form>
</div>
 --%>
 </form>
<center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:white;">© 2019 Grocerry World All Rights Reserved. &nbsp;</p>
                    </div>
                </div></center>

</body>
</html>
