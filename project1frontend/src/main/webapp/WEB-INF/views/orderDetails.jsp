<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
 <%-- <%@ include file="UserHome.jsp"%> --%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
th
{
   font-family:Arial Black;
   font-size:16px;
}
</style>
</head>
<body>
<div class="container-wrapper">
    <div class="container">
    
       	<div style="background-color:Blue; color:white">
		<h2 align="center">Products Purchased </h2>
	</div>
	
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
        <form action="<c:url value="/updateCartItem/${cartItem.cartItemId}"/>" method="get">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Units</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                	
                	
                    <c:forEach items="${listCartItems}" var="cartItem">
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="<c:url value="/resources/images/${cartItem.product.id}.jpg"/>" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${cartItem.product.productname}</a></h4>
                                <!-- <h5 class="media-heading"> by <a href="#">Brand name</a></h5> -->
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                       		${cartItem.quantity}
                        </td>
                        <td>${cartItem.product.units } </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cartItem.product.price}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cartItem.product.price * cartItem.quantity}</strong></td>
                     </tr>
                     </form>
                	</c:forEach>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong>${total_Amount}</strong></h5></td>
                    </tr>
                    <tr>
        
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>${total_Amount /10}</strong></h5></td>
                    </tr>
                    <tr>
                       <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>INR. ${total_Amount+ (total_Amount/10)}/-</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="<c:url value="/cart/getcart"/>" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Edit Cart
                        </a></td>
                        <td>
                         <a href="<c:url value='/cart/shipping'></c:url>" class="btn btn-default" />
                           Checkout <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
                    <tr><td>
                    <%-- <div align="right"><a href="<c:url value='/cart/shipping'></c:url>">Do you need to give shipping address?</a></div> --%>
                    </td></tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
       
       
       
      <%--   <div class="container">
        

            <div class="row">

                             <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

                       <div >
                            <h1 align="center">Invoice</h1>
                       </div>
                        ORDER ID: ${customerorder.orderId }
                  
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong><button disabled>Shipping Address</button></strong><br/>
                                        ${customerorder.user.customer.shippingaddress.apartmentnumber },
                                   ${customerorder.user.customer.shippingaddress.streetname }
                                <br/>
                                    ${customerorder.user.customer.shippingaddress.state},
                                     ${customerorder.user.customer.shippingaddress.city}
                                <br/>
                                   ${customerorder.user.customer.shippingaddress.zipcode}
                                </address>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <p>Shipping Date: ${customerorder.purchaseDate }</p>
                            </div>
                        </div>
                       <hr>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong><button disabled>Billing Address</button></strong><br/>
                                        ${customerorder.user.customer.billingaddress.apartmentnumber},
                                        ${customerorder.user.customer.billingaddress.streetname}
                                    <br/>
                                        ${customerorder.user.customer.billingaddress.city}, ${customerorder.user.customer.billingaddress.state}
                                    <br/>
                                        ${customerorder.user.customer.billingaddress.zipcode}
                                </address>
                            </div>
                        </div>

                        <div class="row">
                            <table class="table table-hover" border="1">
                                <thead>
                                    <tr>
                                        <td>Image</td>
                                        <td>Product</td>
                                        <td>Units</td>
                                        <td class="text-center">Price</td>
                                        <td class="text-center">Total</td>
                                    </tr>
                                </thead>
                                <tbody>
                              
                                <c:forEach var="cartItem" items="${cartItems}">
                                    <tr>
                            <c:url value="/resources/images/${cartItem.product.id }.png" var="imgUrl"></c:url>
                                        <td><img src="${imgUrl }" height="50px" width="50px">  </td>
                                        <td class="col-md-9"><em>${cartItem.product.productname}</em></td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.quantity}</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.product.price}</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.totalPrice}</td>
                                       
                                    </tr>
                                </c:forEach>

                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="text-right">
                                        <h4><strong>Grand Total:</strong></h4>
                                    </td>
                                    <td class="text-center text-danger">
                                        <h4><strong>Rs. ${customerorder.grandTotal }</strong></h4>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                           
                        </div>


                      
                    </div>
             
            </div>
            
          
        </div>
        </div>
        </div>

 --%>

<center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:black;"><b>© 2019 Grocerry World All Rights Reserved. &nbsp;</b></p>
                    </div>
                </div></center>

</body>
</html>

