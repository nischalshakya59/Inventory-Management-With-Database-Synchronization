<%@include file="/WEB-INF/jsp/customerwebpage/header.jsp"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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


<body class="bodycolor">

    <div class="signup-page ">
        <div class="container-fluid log-in">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                <div class="card card-nav-tabs">
                    <div class="header header-back">
                        <h2 class="text-center">Login</h2>
                    </div>
                    <div class="content">
                        <div class="tab-content">
                            <form:form  method="POST" action="/login">

                                <div class="form-group has-reg">
                                    <form:label cssClass="control-label_new" path="username" >Username</form:label>
                                    <form:input path="" name="username" type="text" class="form-control" placeholder="User Name..." required="required"></form:input>
                                </div>

                                <div class="form-group has-reg">
                                    <form:label cssClass="control-label_new" path="password">Password</form:label>
                                    <form:input path="" name="password" type="password" placeholder="Password..." class="form-control" required="required"></form:input>
                                </div>

                                <div class="form-group text-center">
                                    <button type="submit" class="btnnew btn-primary">Get Started</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

<%@include file="/WEB-INF/jsp/customerwebpage/footer.jsp"%>