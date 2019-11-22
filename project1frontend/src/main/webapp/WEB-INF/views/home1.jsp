<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="default-style" content="width=device-width; charset=ISO-8859-1">
<title>Grocerry World</title> 
<style>
.flip-box {
  background-color: green;
  width: 700px;
  height: 200px;
  border: 1px solid green;
  perspective: 1000px;
}

.flip-box-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
  
}

.flip-box:hover .flip-box-inner {
  transform: rotateY(180deg);
}

.flip-box-front, .flip-box-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
}

.flip-box-front {
  background-color: green;
  color: black;
}

.flip-box-back {
  background-color: green;
  color:red;
  transform: rotateY(180deg);
}
.column {
  float: left;
  width: 50%;
  margin-top: 6px;
  padding: 70px;
  font-family: 'Lobster', cursive;
  font-size:24px;
  
}

</style>      
</head>

<body>

<section class="container-fluid" style="margin-bottom:50px;">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
           
            <!-- Indicators -->
            
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                   <center> <img class="img" src="resources/images/carou3.jpg" alt="first slide" height="40%" width="40%"></center>
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>WELCOME   TO   THE  WORLD  OF GROCERRY WEB</h1>
                              <p>feel free to shop</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <center><img class="img" src="resources/images/carou1.jpg" alt="Second slide"></center>
                   <div class="container">
                        <div class="carousel-caption">
                              <h1>50% off</h1>
                            <h1>Easy shopping</h1>                      
                            <p>for your complete family</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <center><img class="img" src="resources/images/11.gif" alt="Third slide"></center>
                    <div class="container">
                        <div class="carousel-caption">
                            <h1></h1>
                            <p>Grocerry world!!!!</p>
                        </div>
                    </div>
                </div>
                 <div class="item">
                    <center><img class="img" src="resources/images/carou2.jpg" alt="forth slide" height="40%" width="40%"></center>
                  <div class="cointainer">
                        <div class="carousel-caption">
                            <h1>MORE U LOVE MORE U CAN BUY</h1>
                            <p>online shopping can make your life more easier!!</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" ></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
</section>


<section class="section-space">
<div class="container">
	<div class="row">
		<div class="col-md-5">
			<a href="#"><img style="height: 500px;" class="img-responsive"  alt="All in one website" src="resources/images/logo2.png"></a>
		</div>
		<div class="col-md-7">	
			<h2 class="about_h2" style="font-family: 'Pacifico', cursive;color:black;">Grocerry<span style="color:#00aeef;">E</span>Shop</h2>
    		<h2 class="about_h2" style="color:white;">Feel Free to Shop</h2>
			<div class="home_about">	
				<p>Who we are &nbsp;
		
	 Grocerry world is a young and vibrant company that aims to provide quality products. 
We are providing all type of Grocerry Items in single website.
Grocerry world aims at providing a hassle free and enjoyable shopping experience to shoppers across the country with the widest range of brands and products on its portal.
Grocerry world is a young and vibrant company that aims to provide quality products. 		
  
Grocerry world brings you the best that has to offer around the world at a single place.
We are deliver the products with Good Quality. 
Shopping is easy with us.
And just in case you didn't quite like what you bought, no problem, we'd be happy to take it back with our hassle free Return Policy.
We endeavour to build that same destination in India by giving customers more of what they want vast selection, low prices, fast and reliable delivery, and a trusted and convenient online shopping experience and provide sellers a world-class e-commerce platform.
and in case you wish to know more, feel free to write to us at www.easyshop@gmail.com.

  &nbsp;
 &nbsp;

Happy Shopping!!</p>
			
				<a class="ghost-color-btn" href="aboutus">Read More<i class="fa fa-chevron-right" aria-hidden="true"></i></a>
			</div>
		</div>
	</div>
</div>
</section>
<section class="container">
<div class="row">
<div class="column">
<div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front">
      <a><img class="img-responsive"  alt="E-Shop" src="resources/images/carou4.jpg" style="height:200px!important"></a>
    </div>
    <div class="flip-box-back">
      <h2 class="glyphicon glyphicon-eye-open" style="color: #00aeef;"> Vision</h2>
      <h1 style="font-family: 'Pacifico'; font-size:24px;">We continuously innovate to be the best destination</h1>
      <h1 style="font-family: 'Pacifico'; font-size:24px;"> for our customers and partners.</h1>
    </div>
  </div>
</div>
</div>
<div class="column">
<div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front">
            <a><img class="img-responsive"  alt="E-Shop" src="resources/images/Mission.png" style="height:250px!important"></a>
      
    </div>
    <div class="flip-box-back">
      <h2 class="glyphicon glyphicon-screenshot" style="color: #00aeef;"> Mission </h2>
      <p class="glyphicon glyphicon-send"><br>
      <h1 style="font-family: 'Pacifico'; font-size:24px;">We use our technology to bring brands and shoppers closer together,</h1>
      <h1 style="font-family: 'Pacifico'; font-size:24px;"> Making the world feel like a smaller place.</h1>
    </div>
  </div>
</div>
</div>
</div>
</section>
<section class="section-space background_bg">
<div class="container">
	<h2 class="product_h2" style="font-family: 'Lobster';">New Arrival</h2>
	<div class="row">
		<div class="col-md-3">
			<a href="#"><img class="img-responsive"  alt="E-Shop" src="resources/images/dryfruit1.jpg"></a>
		</div>
		<div class="col-md-3">	
			<a href="#"><img class="img-responsive"  alt="E-Shop" src="resources/images/veg2.jpg"></a>			
		</div>
		<div class="col-md-3">	
			<a href="#"><img class="img-responsive"  alt="E-Shop" src="resources/images/badam.jpg"></a>			
		</div>
		<div class="col-md-3">	
			<a href="#"><img class="img-responsive"  alt="E-Shop" src="resources/images/carousel2.jpg"></a>			
		</div>
	</div>
</div>
</section>
  <center><div class="footer-area-bottom">
                    <div class="container">
                        <p style="color:black;">© 2019 Grocerry World All Rights Reserved. &nbsp;</p>
                    </div>
                </div></center>


</body>
</html>