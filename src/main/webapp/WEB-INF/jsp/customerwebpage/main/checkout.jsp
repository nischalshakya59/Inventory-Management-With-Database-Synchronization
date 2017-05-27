<%@include file="/WEB-INF/jsp/customerwebpage/header.jsp"%>

<%@page import="project.ims.entity.Category" %>
<%@page import="project.ims.entity.Product" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class=" wrapper navbar-style">
    <!-- TOPBAR -->
    <div class="topBar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 hidden-sm hidden-xs">
                    <img src="/public/customer/images/logo.png" height="70">
                </div>

                <div class="col-md-5 col-xs-12">
                    <div class="input-group form-group has-reg">
                        <input type="text" class="form-control" placeholder="Search for..."/>
                        <span class="input-group-btn">
                          <button class="btn btn-default" type="button">
                              <i class="fa fa-search "></i>
                          </button>
                         </span>
                    </div>
                </div>

                <div class="col-md-5 col-xs-12">
                    <ul class="list-inline topBar_header">
                        <li class="">
                            <c:choose>
                                <c:when test="${empty loggedIn.username}">
                                    <a href="/login">Log in</a>
                                    <a href="/registercustomer">Register</a>
                                </c:when>
                                <c:otherwise>
                                    <a>Hello, ${loggedIn.username}!</a>
                                    <a href="/logout" >Log out</a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="">
                            <a href="/checkout" class="">
                                <i class="fa fa-shopping-basket"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- NAVBAR -->
    <nav class="navbar navbar-transparent">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="" href="/index">Home</a></li>
                    <li><a class="" href="/customerproductview">Collection</a></li>

                    <li><a class="" href="/contact">Contact</a></li>
                    <c:choose>
                        <c:when test="${empty loggedIn.username}">

                        </c:when>
                        <c:otherwise>
                            <li><a class="" href="/customerprofile">Profile</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${empty loggedIn.username}">

                        </c:when>
                        <c:otherwise>
                            <li><a class="navbar-active" href="/checkout">Checkout</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navigation -->
</header>


<div class="container">

    <div class="checkout">

        <div class="col-md-9 cart-items">
            <h3 class="">My Shopping Bag <span class="small"></span></h3>


            <c:choose>
                <c:when test="${empty cart}">
                    <h2 class="">
                    <img src="/public/customer/images/cart2.jpg">
                    </h2>
                </c:when>
                <c:otherwise>
                    <c:forEach var="cart1" items="${allcart}">
                        <div class="cart_items">
                            <div class="media">
                                <div class="media-left media-middle">
                                    <a href="#">
                                        <img class="media-object img-rounded" src="${cart1.productId.productImage}" width="150" height="200" alt="...">
                                    </a>
                                </div>
                                <div class="media-body">

                                    <h4 class="media-heading">${cart1.productId.productName}</h4><br>
                                    <dl class="dl-horizontal">

                                        <dt>Price:</dt>
                                        <dd>Rs. ${cart1.productId.productPrice}</dd>

                                        <dt>Attribute:</dt>
                                        <dd>${cart1.productId.productAttribute}</dd>

                                        <dt>Quantity:</dt>
                                        <dd>${cart1.quantity}</dd>
                                    </dl>
                                    <a href ="/cartdel/${cart1.productId.productId}" class="btn btn-danger btn-sm" >Remove from Cart</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>


        </div>

        <div class="col-md-3 cart_total">
            <a class="btnnew btn-block btn-primary text-center" href="/customerproductview">
                <i class="fa fa-shopping-cart"></i>
                Continue to Cart</a>

            <div class="price-details">
                <dl class="dl-horizontal">
                    <h4>Price Details</h4>

                    <dt>Total:</dt>
                    <dd>${total}</dd>

                    <dt>Discount:</dt>
                    <dd>${discount}</dd>

                    <dt>Delivery Charges:</dt>
                    <dd>250</dd>

                    <lable></lable>

                    <ul class="list-unstyled total_price">
                        <li class="last_price"> <h4>Total</h4></li>
                        <li class="last_price"><span>Rs. ${grand}</span></li>
                        <div class="clearfix"> </div>
                    </ul>

                </dl>

                <c:choose>
                    <c:when test="${empty cart}">
                        <a class="btn btn-block btn-primary disabled text-center " href="#">
                            <i class="fa fa-shopping-bag"></i>
                            Place Order</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btnnew btn-block btn-primary  text-center" href="/orderplace">
                            <i class="fa fa-shopping-bag"></i>
                            Place Order</a>
                    </c:otherwise>
                </c:choose>

            </div>

            <%--<div class="price-details">--%>
                <%--<ul class="list-unstyled">--%>
                    <%--<li>--%>
                    <%--<li>Total: <span >Rs. 44500.00</span> </li>--%>
                    <%--<li>Discount: <span>Rs. 2225.00</span></li>--%>
                    <%--<li>Delivery Charges: Rs. 250</li>--%>
                    <%--<div class="clearfix"></div>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<br>--%>
            <%--<ul class="list-unstyled total_price">--%>
                <%--<li class="last_price"> <h4>TOTAL</h4></li>--%>
                <%--<li class="last_price"><span>Rs. 42275.00</span></li>--%>
                <%--<div class="clearfix"> </div>--%>
            <%--</ul>--%>

            <%--<a class="btnnew btn-block btn-primary text-center" href="/customerproductview">--%>
                <%--<i class="fa fa-shopping-bag"></i>--%>
                <%--Place Order</a>--%>

            </div>
        <div class="clearfix"> </div>
    </div>

</div>

<%@include file="/WEB-INF/jsp/customerwebpage/footer.jsp"%>