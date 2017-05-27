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


<div class="container">
    <form:form method="POST" action="/customerview/${customer1.customerId}">

        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="firstName">First Name:</form:label>
            <form:input cssClass="form-control" path="firstName" name="firstName" value="${customer1.userdetailsId.firstName}" placeholder = "Enter First Name" type="text" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="lastName">Last Name:</form:label>
            <form:input cssClass="form-control" path="lastName" name="lastName" value="${customer1.userdetailsId.lastName}"  placeholder = "Enter Last Name" type="text" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="email">Email:</form:label>
            <form:input cssClass="form-control" path="email" name="email" value="${customer1.userdetailsId.email}"  placeholder = "Enter Email" type="text" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="contact">Contact:</form:label>
            <form:input cssClass="form-control" path="contact" name="contact" value="${customer1.userdetailsId.contact}"  placeholder = "Enter Contact" type="text" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="">Username:</form:label>
            <form:input cssClass="form-control" path=""  name="username" value="${customer1.loginId.username}" placeholder = "Enter Username" type="text" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="">Password:</form:label>
            <form:input cssClass="form-control" path=""  name="password" value="${customer1.loginId.password}" placeholder = "Enter Password" type="password" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="">Country:</form:label>
            <form:input cssClass="form-control" path=""  name="country" value="${customer1.addressId.country}" placeholder = "Enter Country" type="text" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="">Zone:</form:label>
            <form:input cssClass="form-control" path="" name="zone" value="${customer1.addressId.zone}" placeholder = "Enter Zone" type="text" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="">District:</form:label>
            <form:input cssClass="form-control" path="" name="district" value="${customer1.addressId.district}" placeholder = "Enter District" type="text" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="">City:</form:label>
            <form:input cssClass="form-control" path="" name="city" value="${customer1.addressId.city}" placeholder = "Enter City" type="text" required = "required"/>
        </div>
        <div class="form-group has-reg">
            <form:label cssClass="control-label_new" path="">Street:</form:label>
            <form:input cssClass="form-control" path="" name="street" value="${customer1.addressId.street}" placeholder = "Enter Street" type="text" required = "required"/>
        </div>

        <form:hidden path="" name="userdetailsId" value="${customer1.userdetailsId}"/>
        <form:hidden path="" name="loginId" value="${customer1.loginId}"/>
        <form:hidden path="" name="addressId" value="${customer1.addressId}"/>

        <div class="form-group has-reg text-center">
            <form:button type="submit" class="btnnew btn-primary ">Update</form:button>
        </div>
    </form:form>
    <br><br>
</div>


<%@include file="/WEB-INF/jsp/customerwebpage/footer.jsp"%>
