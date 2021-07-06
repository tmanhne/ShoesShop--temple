

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

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
            <div class="shopping-cart">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                    <!-- Shopping cart table -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Số Lượng</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Đơn Giá</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Thành Tiền</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Xóa Và Update số lượng</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${sessionScope.listCart}" var="l">
                                            <form action="updateCart?pid=${l.pid}" method="post">
                                                <c:set var="total" value="${total +l.price*l.quantity }"></c:set>
                                                    <tr>
                                                        <td>
                                                            <figure class="media">
                                                                <div class="img-wrap"><img width="300" height="300" src="${l.image}" class="img-thumbnail img-sm"></div>
                                                            <figcaption class="media-body">,
                                                                <h6 class="title text-truncate">${l.pName} </h6>
                                                            </figcaption>
                                                        </figure> 
                                                    </td>
                                                    <td> 
                                                        <input name="updateQuantity" style="text-align: center" type="number" value="${l.quantity}" onchange="">
                                                    </td>
                                                    <td> 
                                                        <div class="price-wrap"> 
                                                            <var style="font-weight: bold"  class="price"> ${l.price}</var> 
                                                        </div> 
                                                    </td>
                                                    <td style="font-weight: bold"> 
                                                        ${l.price*l.quantity}
                                                    </td>
                                                    <td class="text-right"> 
                                                        <button type="submit"  class="btn btn-outline-success" data-toggle="tooltip" data-original-title="Save"><i class="fa fa-refresh" aria-hidden="true"></i></button> 
                                                        <a href="removeCart?pid=${l.pid}" class="btn btn-outline-danger">Delete</a>
                                                    </td>
                                                </tr>
                                            </form>


                                        </c:forEach>


                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div> 
        <form action="checkOut"method="post">
            <div class="row py-5 p-4 bg-white rounded shadow-sm">

                <div class="col-lg-6">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                    <div class="p-4">
                        <ul class="list-unstyled mb-4">
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong>${total}</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                <h5 class="font-weight-bold">${total} VNĐ </h5>
                            </li>
                        </ul><a href="checkOut?total1=${total}" class="btn btn-dark rounded-pill py-2 btn-block">Mua hàng</a>
                    </div>
                </div>
            </div>                       
        </form>                  


    </body>

</html>
</html>
