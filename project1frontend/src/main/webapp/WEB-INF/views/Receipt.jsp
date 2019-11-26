<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
     <%-- <%@ include file="UserHome.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#tab {
  width:800px;
  margin: auto;
  border: 1px solid red;
}
</style>

</head>
<body>

<div class="container">
        

            <div class="row">

            <div  id="tab" class="well col-xs-20 col-sm-20 col-md-15 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div >
              <h1 align="center">Invoice</h1>
                       </div>
                  
                        ORDER ID: ${order.orderId }
                        <div class="row">
                    	<div class="col-xs-9" >
    				<address>
    				<strong>Billed To:</strong>
       				    	${customer}</br>
    						${street}</br>
    						${city }</br>
    						${zip }</br>
    						${mobile }</br>
    				</address>
    			</div>
    			
    			<div >
    				<address>
    					<strong>Total shopping Amount :</strong><br/>
    					${total_Amount+ (total_Amount/10)}/-<br/>
    				</address>
    			</div>
    			
    				<div class="row">
    			<div class="col-xs-13">
    				<address>
    					<strong>Payment Method:</strong><br/>
    					${order.pmode}<br/>
    				</address>
    			</div>
    	
    			<div class="col-xs-10">
    				<address>
    					<strong>Order Date:</strong><br>
    					${order.orderDate}<br><br>
    				</address>
    			</div>
    		</div>
    		
    				
        <div class="row">
    	<!-- <div>
    		<div class="panel panel-default">
 -->
 	    			<div class="panel-heading">
    				<h3 class="panel-title"><center><strong>Order summary</strong></center></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
          
        <!--                <div class="row">
                            <table class="table table-hover" border="1">
                                <thead>
         -->                            <tr>
                                        <td>Image</td>
                                        <td>Product</td>
                                        <td>Units</td>
                                        <td class="text-center">Price</td>
                                        <td class="text-center">Total</td>
                                    </tr>
                                </thead>
                                <tbody>
                              
                                <c:forEach var="cartItem" items="${listCartItems}">
                                    <tr>
                            <c:url value="/resources/images/${cartItem.product.id }.jpg" var="imgUrl"></c:url>
                                        <td><img src="${imgUrl }" height="50px" width="50px">  </td>
                                        <td class="col-md-9"><em>${cartItem.product.productname}</em></td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.quantity}</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.product.price}</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.price}</td>
                                       
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
                                        <h4><strong>Rs. ${total_Amount+ (total_Amount/10)}/-</strong></h4>
                                        <%-- <h4><strong>Rs. ${cartItem.price * cartItem.quantity }</strong></h4> --%>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                           
                        </div>

           
                      
                    </div>
             
            </div>
            
          
        
<div>

<h4><strong>Shipping Address : </strong></h4> ${street},${city }, ${zip }</br>
    					${mobile }</br>	

</div>
 </div>
        


       <h1 align="center">Thank you!!! </h1>
    </div>
</div>
</div>
<%-- <div class="container">

    <div class="row">
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>Invoice</h2><h3 class="pull-right">Order # ${order.orderId}</h3>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Billed To:</strong><br>
    					${street}</br>
    					${city }</br>
    					${zip }</br>
    					${mobile }</br>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
        			<strong>Total Shopping Amount:</strong><br>
    					${total_Amount}
    				</address>
    			</div>
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					<strong>Payment Method:</strong><br/>
    					${order.pmode}<br/>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Order Date:</strong><br>
    					${order.orderDate}<br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Order Summary</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Item</strong></td>
        							<td class="text-center"><strong>Price</strong></td>
        							<td class="text-center"><strong>Quantity</strong></td>
        							<td class="text-center"><strong>Units</strong></td>
        							<td class="text-right"><strong>Totals</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<c:forEach items="${listCartItems}" var="cartItem">
    							<tr>
    								<td>${cartItem.product.productName }</td>
    								<td class="text-center">${cartItem.price}</td>
    								<td class="text-center">${cartItem.quantity}</td>
    								<td class="text-center">${cartItem.product.units }</td>
    								<td class="text-right">${cartItem.productprice * cartItem.quantity}</td>
    							</tr>
    							</c:forEach>
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
                        <p style="color:white;">© 2019 Grocerry World All Rights Reserved. &nbsp;</p>
                    </div>
                </div></center>

</body>
</html>