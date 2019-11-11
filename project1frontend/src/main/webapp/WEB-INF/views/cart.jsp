<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <div class="container">
<c:if test="${ !empty(cartItems) }">
<a href="<c:url value='/cart/clearcart'></c:url>" class="btn btn-danger" pull-left  >
<span class="glyphicon glypicon-remove"></span>
Clear Cart
</a>
</c:if>
<table class="table table-striped">
<thead id="thead">
 <tr><th>Cartitem Id</th><th>Quantity</th><th>Price</th><th>Total Pri 	ce</th><th>Operations</th> 
</tr>
</thead>
<c:set var="grandTotal" value="0"></c:set>
<tbody id="tbody"><!-- cartItems is List<CartItem>, cartItem is CartItem obj -->
<c:forEach items="${cartItems }" var="cartItem">
<form action="<c:url value="/cart/updateCart/${cartItem.cartItemId }"></c:url>" method="get">
<tr>

<td class="col-sm-8 col-md-6">
                        <div>${cartItem.cartItemId }</div>
                        <div class="media">
                            <!-- <a class="thumbnail pull-left" href="#"> --> <img class="media-object" src="<c:url value="/resources/images/${cartItem.product.id}.jpg"/>" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">Product Name: ${cartItem.product.productname}</a></h4>
                                <!-- <h5 class="media-heading"> by <a href="#">Brand name</a></h5> -->
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <input type="text" class="form-control" name="quantity" id="quantity" value="${cartItem.quantity}">
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cartItem.price}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cartItem.price * cartItem.quantity}</strong></td>
                        <td class="col-sm-1 col-md-1">
                        <button type="submit" class="btn btn-primary">
                            <span class="glyphicon glyphicon-update"></span> update 
                        </button>
                        <a href="<c:url value="/cart/removecartitem/${cartItem.cartItemId}"/>" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Remove
                        </a>
                        </td>
                     </tr>


<%-- <td>${cartItem.cartItemId }</td>

<td>${cartItem.product.productname }</td>
<td><input type="text" value=${cartItem.quantity } name="qty" /></td>
<td>${cartItem.totalPrice }</td>
<c:set var="grandTotal" value="${grandTotal + cartItem.totalPrice }"></c:set>

<td><a href="<c:url value='/cart/removecartitem/${cartItem.cartItemId }'></c:url>" class="label label-danger" pull-left >

<span class="glyphicon glyphicon-remove" ></span>Remove
</a></td>
<td><a href="<c:url value='/cart/updateCart/${cartItem.cartItemId }'></c:url>" class="label label-success" pull-left>

<span class="glyphicon glyphicon-pencil" ></span>update
</a></td>


</tr> --%>

</form>
</c:forEach>

                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong>${total_Amount}</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>${total_Amount /10}</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>INR. ${total_Amount+ (total_Amount/10)}/-</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="<c:url value="/productdisplay"/>" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </a></td>
                        <td>
                         <a href="<c:url value="/confirmOrder"/>" class="btn btn-default">
                            Order Confirm <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%-- </tbody>
</table>
Total Price : ${grandTotal }
<c:if test="${empty(cartItems) }">
<h3>Your Cart is Empty</h3>
</c:if>
<c:if test="${ !empty(cartItems) }">
<a href="<c:url value='/cart/shippingaddressform'></c:url>" class="btn btn-success pull-right">
<span class="glyphicon glyphicon-shopping-cart"></span> Place Order  </a>
</c:if>
</div>
 --%>
</body>

</html>

