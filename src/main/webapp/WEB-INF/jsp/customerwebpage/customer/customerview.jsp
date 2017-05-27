<%@include file="/WEB-INF/jsp/customerwebpage/header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                            <li><a class="navbar-active" href="/customerprofile">Profile</a></li>
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


<%--<body class="bodycolor">--%>
<div class="container profile">
    <div class="col-md-10 col-md-offset-1 col-sm-6 col-sm-offset-1">
        <!-- Tabs with icons on Card -->
        <div class="card card-nav-tabs">

            <div class="header header-back">
                <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
                <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                        <ul class="nav nav-tabs" data-tabs="tabs">
                            <li class="active">
                                <a href="#profile" data-toggle="tab">
                                    <i class="fa fa-user"></i>
                                    Profile
                                </a>
                            </li>
                            <li>
                                <a href="#messages" data-toggle="tab">
                                    <i class="fa fa-envelope"></i>
                                    Order
                                </a>
                            </li>
                            <li>
                                <a href="#settings" data-toggle="tab">
                                    <i class="fa fa-gear"></i>
                                    Settings
                                </a>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="tab-content">
                    <div class="tab-pane active" id="profile">
                        <h3>Account Informations</h3>
                        <table class="table table-responsive table-striped">
                            <tr>
                                <td>First Name:</td>
                                <td>${customer1.userdetailsId.firstName}</td>
                            </tr>

                            <tr>
                                <td>Last Name:</td>
                                <td>${customer1.userdetailsId.lastName}</td>

                            </tr>

                            <tr>
                                <td>Email:</td>
                                <td>${customer1.userdetailsId.email}</td>

                            </tr>

                            <tr>
                                <td>Contact:</td>
                                <td>${customer1.userdetailsId.contact}</td>

                            </tr>

                            <tr>
                                <td>Username:</td>
                                <td>${customer1.loginId.username}</td>

                            </tr>

                            <tr>
                                <td>Country:</td>
                                <td>${customer1.addressId.country}</td>

                            </tr>

                            <tr>
                                <td>Zone:</td>
                                <td>${customer1.addressId.zone}</td>

                            </tr>

                            <tr>
                                <td>District:</td>
                                <td>${customer1.addressId.district}</td>
                            </tr>

                            <tr>
                                <td>City:</td>
                                <td>${customer1.addressId.city}</td>

                            </tr>

                            <tr>
                                <td>Street:</td>
                                <td>${customer1.addressId.street}</td>
                            </tr>

                        </table>
                    </div>

                    <div class="tab-pane" id="messages">
                        <p>Informations about the transactions</p>

                        <div class="">
                            <c:forEach var="orderD" items="${allorderdetails}">
                                <c:forEach var="orders" items="${allorder}">
                                    <c:choose>
                                        <c:when test="${orders.orderDetailsId.orderDetailsId == orderD.orderDetailsId}">
                                            <table class="table table-responsive table-striped" id="flip">
                                                    <%--table headings--%>
                                                <th class="col-md-9">Order</th>
                                                <th>Status</th>

                                                <tr>
                                                        <%--order date--%>
                                                    <td>
                                                        Date :${orderD.orderDate}
                                                    </td>

                                                        <%--status info--%>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${orders.orderDetailsId.orderStatus}">
                                                                <span class="label label-success">Delivered</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="label label-info">Pending</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>


                                                <table class="table" id="panel">
                                                    <th class="col-md-9 danger">Product</th>
                                                    <th class="danger">Quantity</th>
                                                    <c:forEach var="ct" items="${allcart}">
                                                        <c:choose>
                                                            <c:when test="${orders.orderId==ct.orderId.orderId}">
                                                                <tr>
                                                                    <td>
                                                                        ${ct.productId.productName}
                                                                    </td>

                                                                    <td >
                                                                        ${ct.quantity}
                                                                    </td>
                                                                </tr>
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>
                                                </table>

                                            </table><br><br>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </c:forEach>
                        </div>

                    </div>

                    <div class="tab-pane" id="settings">

                        <a href="customeredit/${customer1.customerId}" class="btnnew btn-success">Edit</a>

                        <a href="customerdel/${customer1.customerId}" class="btnnew btn-danger"
                           onclick="if(!confirm('Are you sure u want to delete?')) return false;">
                            Delete</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="/WEB-INF/jsp/customerwebpage/footer.jsp"%>