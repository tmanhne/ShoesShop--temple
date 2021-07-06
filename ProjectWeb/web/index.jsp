
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="boostrap/home2.css" rel="stylesheet" id="bootstrap-css">
        <script src="boostrap/home2.js"></script>
        <script src="boostrap/home.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="boostrap/home.bootstrap.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
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
                <div class="row">
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                            <ul class="list-group category_block">
                            <c:forEach items="${listC}" var="o">
                                <li class="list-group-item text-white">
                                    <a href="CateControl?cid=${o.cateID}">${o.cateName}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                   
                 
                </div>

                <div class="col-sm-9">
                    <div class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="#" title="View Product">${o.pName}</a></h4>
                                        <p class="card-text show_txt">${o.pName}</p>
                                        <p style="font-weight: bold;color: red "class="card-text show_txt">${o.desciption}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p style="font-weight: bold"class="btn-group">${o.price} VNĐ</p>
                                            </div>
                                            
                                            <div class="col">
                                                <a href="cart?pid=${o.pid}" class="btn btn-success btn-block">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                      
                    </div>
                </div>

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
                            <li><a href="https://www.instagram.com/t.t.manhh/">Instagram</a></li>
                            <li><a href="https://www.facebook.com/tmanh61/">FaceBook</a></li>
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
                        
                        <p class="text-right text-muted">created with <i class="fa fa-heart"></i> by <a href="https://www.facebook.com/tmanh61/"><i>Trần Tiến Mạnh</i></a> | <span>Hòa Bình</span></p>
                    </div>                </div>
            </div>
        </footer>
    </body>
</html>
