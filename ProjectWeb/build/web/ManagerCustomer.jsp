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

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div style="padding-left: 50px" class="container">
                <a  href="home"><img src="image/500_F_315061039_JPz3A8Yd64Ugsy2T6Ez6E9IPwAhs3ftD.jpg" alt="" width="150" height="150" /></a> 
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul style="padding-left: 100px" class="navbar-nav m-auto">
                        <c:if test="${account1==null}">
                            <li class="nav-item">
                                <a class="nav-link" href="adminlogin.jsp">Login</a>
                            </li>
                        </c:if>
                        <c:if test="${account1!=null}">
                            <li style="padding-left: 200px" class="nav-item">
                                <a class="nav-link" href="Logout">LogOut</a>
                            </li>
                        </c:if>
                        <c:if test="${account1!=null}">
                            <li  class="nav-item">
                                <a class="nav-link text-success" href="adminlogin.jsp">Hello ${account1.userName}</a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link text-success" href="Login2.jsp">Login As Customer</a>
                        </li>
                    </ul>

                    </form>
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
                        <ul class="list-group ">

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
                    <div class="table-title">
                        <div class="row">
                            <div style="padding-left: 16px"class="row-sl-20">
                                <h2>Manage Customer</h2>
                            </div>
                            <div style="float: right; padding-left: 300px;padding-top: 10px" class="add_to_cart_block">
                                <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Customer</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>CID</th>
                                <th>Full Name</th>
                                <th>Address</th>
                                <th>Phone</th>

                                <th>Username</th>
                                <th>Password</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listCu}" var="o">
                                <tr>

                                    <td>${o.cid}</td>
                                    <td>${o.fullName}</td>
                                    <td>
                                        ${o.address}
                                    </td>
                                    <td>${o.phone} </td>
                                    <td>${o.userName} </td>
                                    <td>${o.password} </td>
                                    <td>
                                        <a href="loadCus?cid=${o.cid}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="deletecus?cid=${o.cid}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div id="addEmployeeModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="addcus" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Add Customer</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input name="fullname" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input name="address" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input name="phone" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input name="username" type="text" class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Password</label>
                                        <input name="password" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <input type="submit" class="btn btn-success" value="Add">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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