
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Panner.jsp"></jsp:include>
        <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        <div class="container">

            <h2>Checkout</h2>


            <div class="row">
                <div class="col-8"><form id="validate" action="checkout" method="post">
                        <div class="col-50"style="display: grid;" >
                             <h3>Billing Address</h3>
                            <label><i class="fa fa-user"></i>DateCreate</label>
                            <input type="text" id="fname" class="input-text" name="date" placeholder="2000/06/06" required>
                            <label><i class="fa fa-envelope"></i> Total</label>
                            <input type="text" id="email" class="input-text"  name="total" placeholder="${total}" required>
                            <label><i class="fa fa-address-card-o"></i> Full Name</label>
                            <input type="text" id="adr" class="input-text"  name="name" placeholder="Nguyen Van A" required>
                            <label><i class="fa fa-institution"></i> Address</label>
                            <input type="text" id="city" class="input-text"  name="addr" placeholder="Ha Noi" required>
                            <label><i class="fa fa-institution"></i> Phone</label>
                            <input type="text" id="city" class="input-text"  name="phone" placeholder="09999848444" required>
                        </div>
                        <div style="margin: 10px auto">
                            <button type="submit" class="btn btn-success" >Order</button>  
                        </div>
                        
                    </form>
                </div>
                <div class="col-4">
                    <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i>  </span></h4>
                    <c:forEach items="${list}" var="o">
                        <p><a href="#" style="text-decoration: none;color: black;">
                                <div style=" white-space: nowrap;     overflow: hidden; text-overflow: ellipsis;">${o.bookName}</div></a> <span class="price">$${o.price}</span></p> </c:forEach> 
                        <hr>
                        <p>Total <span class="price" style="color:black"><b>$${total}</b></span></p></div>
            </div>
        </div>


        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3">
                        <h5>About</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <p class="mb-0">
                            Make a life better
                        </p>
                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                        <h5>Informations</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><a href="https://www.instagram.com/mm.leduc/">Instagram</a></li>
                            <li><a href="https://www.facebook.com/thunderclapran/">FaceBook</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 col-lg-3 col-xl-3">
                        <h5>Contact</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><i class="fa fa-home mr-2"></i> 19009198</li>
                            <li><i class="fa fa-envelope mr-2"></i> thunderclapran@gmail.com</li>
                            <li><i class="fa fa-phone mr-2"></i> 0374295268</li>
                        </ul>
                    </div>
                    <div class="col-12 copyright mt-3">

                        <p class="text-right text-muted">created with <i class="fa fa-heart"></i> by <a href="https://www.facebook.com/thunderclapran/"><i>Trần Tiến Mạnh</i></a> | <span>HÀ NỘI</span></p>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
