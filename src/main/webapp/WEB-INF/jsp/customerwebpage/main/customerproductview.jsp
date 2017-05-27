<%@include file="/WEB-INF/jsp/customerwebpage/header.jsp"%>

<%@page import="project.ims.entity.Product" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                        <li class="grow">
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
                    <li><a class="navbar-active" href="/customerproductview">Collection</a></li>

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
                            <li><a class="" href="/checkout">Checkout</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navigation -->
</header>

<div class="container">
    <div class="row product_display">

        <h2 class="text-center">New Arrivals</h2>
        <br><br>
        <%--products list--%>
            <c:forEach var="filename" items="${filename}">
                <div class="col-xs-6 col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <div class="sub_thumbnail">
                            <img src="${filename.productImage}" name = "filename" class=""  alt="">
                            <div class="slide_new">
                                <a>
                                    <i class="fa fa-search-plus fa-2x" data-toggle="modal" data-target="#myModal" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                        <div class="caption">
                            <h5>${filename.productName}</h5>
                            <div class="text-center">
                                <form:form method="POST" action="/addtocart/${filename.productId}">
                                    <form:hidden path="" name="quantity" value="1"></form:hidden>
                                    <c:choose>
                                        <c:when test="${empty loggedIn.username}">
                                            <a href="/login" class="btn btn-default"> Add to Cart </a>
                                        </c:when>
                                        <c:otherwise>
                                            <form:button type="submit" class="btn btn-default "> Add to Cart </form:button>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="customerproductdetails/${filename.productId}" class="btn btn-success" role="button">View Details</a>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        <%--product list end--%>
    </div>
</div>

<!-- Sart Modal -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <%--<div class="modal-header">--%>
                    <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
                        <%--<i class="fa fa-times"></i>--%>
                    <%--</button>--%>
                <%--</div>--%>

                <img src="/public/customer/images/city.jpg" class="img-responsive">
            </div>
        </div>
    </div>
</div>
<!--  End Modal -->

<%@include file="/WEB-INF/jsp/customerwebpage/footer.jsp"%>
