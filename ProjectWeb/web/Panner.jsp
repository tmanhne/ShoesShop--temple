<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav  class="navbar navbar-expand-md navbar-dark bg-dark">
            <div  class="container">
                <a  href="home"><img src="image/500_F_315061039_JPz3A8Yd64Ugsy2T6Ez6E9IPwAhs3ftD.jpg" alt="" width="150" height="150"  /></a> 
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <c:if test="${account==null}">
                            <li class="nav-item">
                                <a class="nav-link" href="Login2.jsp">Login as Customer</a>
                            </li>
                        </c:if>
                        <c:if test="${account!=null}">
                            <li class="nav-item">
                                <a class="nav-link" href="Logout">LogOut</a>
                            </li>
                        </c:if>
                        <c:if test="${account!=null}">
                            <li class="nav-item">
                                <a class="nav-link text-success" href="Login2.jsp">Welcome ${account.userName}</a>


                            </li>
                        </c:if>
                        <c:if test="${account!=null}">
                            <li class="nav-item">
                                <a class="nav-link text-success" href="Login2.jsp">RollNumber: ${acc.cid}</a>
                            </li>
                        </c:if>
                        <c:if test="${account!=null}">
                            <li class="nav-item">
                                <a class="nav-link text-success" href="Login2.jsp">Full Name: ${acc.fullName}</a>
                            </li>
                        </c:if> 
                        <c:if test="${account==null}">
                            <li class="nav-item">
                                <a class="nav-link text-success" href="adminlogin.jsp">Login as Admin</a>
                            </li>
                        </c:if>
                    </ul>

                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>

                        <a class="btn btn-success btn-sm ml-3" href="Cart.jsp">
                            <i class="fa fa-shopping-cart"></i> Cart
                            <span class="badge badge-light"></span>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
        <section style="" class="jumbotron text-center">
            <div class="container">
                
                <!--                <h1 style="font-style: italic; font-family: serif; font-weight: bold;font-size: 65px;color: white " class="jumbotron-heading">In life if you are runner up then I will make you first </h1>
                                <p style="font-style: italic; font-family: serif;font-size: 35px;color:blue  " class="lead text-muted mb-0">Beautiful clothes are your passport to happiness</p>-->
                <img displat src="image/123140440-set-of-banners-shoes-shop-new-collection-vector-illustration-.jpg" style="width: 100%;"/>

            </div>
        </section>
    </body>
</html>
