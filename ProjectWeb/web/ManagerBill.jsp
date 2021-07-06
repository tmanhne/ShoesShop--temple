
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
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a  href="home"><img src="image/500_F_315061039_JPz3A8Yd64Ugsy2T6Ez6E9IPwAhs3ftD.jpg" alt="" width="150" height="150" /></a> 
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <c:if test="${account1==null}">
                            <li class="nav-item">
                                <a class="nav-link" href="adminlogin.jsp">Login</a>
                            </li>
                        </c:if>
                        <c:if test="${account1!=null}">
                            <li class="nav-item">
                                <a class="nav-link" href="Logout">LogOut</a>
                            </li>
                        </c:if>
                        <c:if test="${account1!=null}">
                            <li class="nav-item">
                                <a class="nav-link text-success" href="adminlogin.jsp">Hello ${account1.userName}</a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link text-success" href="Login2.jsp">Login As Customer</a>
                        </li>
                    </ul>


                </div>
            </div>
        </nav>
        <section style="" class="jumbotron text-center">
            <div class="container">
                <!--                <h1 style="font-style: italic; font-family: serif; font-weight: bold;font-size: 65px;color: white " class="jumbotron-heading">In life if you are runner up then I will make you first </h1>
                                <p style="font-style: italic; font-family: serif;font-size: 35px;color:blue  " class="lead text-muted mb-0">Beautiful clothes are your passport to happiness</p>-->
                <img displat src="image/123140440-set-of-banners-shoes-shop-new-collection-vector-illustration-.jpg"/>

            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="admin">Home</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Manager</div>
                        <ul class="list-group category_block">

                            <li class="list-group-item text-white">
                                <a href="CustomerManager">Customer</a>
                            </li>
                            <li class="list-group-item text-white">
                                <a href="ProductManager">Product</a>
                            </li>
                            <li style=""class="list-group-item text-white">
                                <a href="BillManager">Bill process</a>
                            </li>
                        </ul>
                    </div>


                </div>

                <div class="col-sm-9">
                    <form action="filter" method="POST">
                        <label class="filter"></label>
                        <select name="filter">
                            <option value="-1" ${param.filter==-1 ? 'selected' : ''}>ALL</option>
                            <option value="0" ${param.filter==0 ? 'selected' : ''}>Wait</option>
                            <option value="1" ${param.filter==1 ? 'selected' : ''}>DONE</option>
                            <option value="2" ${param.filter==2 ? 'selected' : ''}>PROCESS</option>
                        </select>
                        <input type="submit" value="Search" />
                    </form>
                    <div  class="row">

                        <table style="background-color: white" border="2">
                            <thead>
                                <tr>
                                    <th>BID</th>
                                    <th>Date Create</th>
                                    <th>Total</th>
                                    <th>Full Name</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>status</th>
                                    
                                    <th>Cancel order</th>
                                    <th> </th>
                                </tr>
                            </thead>

                            <c:forEach var="o1" items="${billss}">
                                <form action="process?bid=${o1.bid}" method="POST">
                                    <tr>

                                        <td>${o1.bid}</a></td>
                                        <td>${o1.dateCreate}</td>
                                        <td>${o1.total}</td>
                                        <td>${o1.recName}</td>
                                        <td>${o1.address}</td>
                                        <td>${o1.recPhone}</td>
                                        <c:if test="${o1.status==3}">
                                            <td>
                                                Done
                                            </td>
                                        </c:if>

                                        <c:if test="${o1.status!=3}">
                                            <td>
                                                <select name="status" onchange="this.form.submit()">
                                                    <option style="color: red" value="1">Wait</option>
                                                    <c:if test="${o1.status==2}">
                                                        <option value="2" selected>Process</option>
                                                    </c:if>
                                                    <c:if test="${o1.status!=2}">
                                                        <option style="color: green;font-weight: bold"value="2">Process</option>
                                                    </c:if>
                                                        <option style="color: blue" value="3">Done</option>
                                                </select>
                                            </td>
                                        </c:if>
                                           <c:if test="${o1.status!=3}">
                                            <td><a href="deletest?bid1=${o1.bid}" onclick="return confirm('Are you sure you want to delete this item?');">Cancel order</a></td>
                                        </c:if> 
                                       <td style="font-weight: lighter; color: blue"><a href="billDetail?bid=${o1.bid}">View BillDetail</td>
                                    </tr>
                                </form>
                            </c:forEach>
                        </table>
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
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
