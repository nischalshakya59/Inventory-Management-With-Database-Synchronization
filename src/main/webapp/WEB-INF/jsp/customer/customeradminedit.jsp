<%----------------------------------------------starting---------------------------------------------------%>
<%@include file="/WEB-INF/jsp/header.jsp"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="forrm" uri="http://www.springframework.org/tags/form" %>

<div class="wrapper">

    <%@include file="/WEB-INF/jsp/customer/customeradminsider.jsp"%>
    <%--------------------------------------------------sidebar end-----------------------------------------------%>
    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="customeradminview.jsp">Customer Information</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
                                <p>Stats</p>
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-bell"></i>
                                <p class="notification">5</p>
                                <p>Notifications</p>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">
                                <i class="ti-settings"></i>
                                <p>Settings</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

        <%----------------------------------------mathi ko navigation end------------------------------------------%>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <%---------------------------------------------edit garne main area/panel-------------------------------------------%>
                    <div class="col-lg-12 col-md-7">
                        <div class="card">
                            <div class="">
                                <h4 class="table-title col-md-10">Edit Customer</h4>  <%--panel vitra aaune main heading--%>
                            </div>
                            <div class="content">
                                <form:errors path="customer1.*"/>
                                <form:form method="POST">

                                    <%------------------------------------------input fields and name ko lagi-------------------------------------------%>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="firstName" class="form-group">First Name:</form:label>
                                                <form:input path="firstName" class="form-control border-input" name="firstName" value="${customer1.userdetailsId.firstName}" type="text" readonly="true"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="lastName" class="form-group">Last Name:</form:label>
                                                <form:input path="lastName" class="form-control border-input" name="lastName" value="${customer1.userdetailsId.lastName}" type="text" readonly="true"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="email" class="form-group">Email:</form:label>
                                                <form:input path="email" class="form-control border-input" name="email" value="${customer1.userdetailsId.email}" type="text" readonly="true"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="contact" class="form-group">Contact:</form:label>
                                                <form:input path="contact" class="form-control border-input" name="contact" value="${customer1.userdetailsId.contact}" type="text" readonly="true"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Username:</form:label>
                                                <form:input path="" class="form-control border-input" name="username" value="${customer1.loginId.username}" type="text" readonly="true"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                                <form:label path="" class="form-group">User Status:</form:label>
                                                <p><c:choose>
                                                    <c:when test="${customer1.loginId.userStatus}">
                                                        <span class="label label-success">Active</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="label label-danger">Inactive</span>
                                                    </c:otherwise>
                                                </c:choose>
                                                </p>
                                            <%--<form:input path="" class="form-control border-input" name="userStatus" value="${customer1.loginId.userStatus}" type="text" readonly="false"/>--%>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Street:</form:label>
                                                <form:input path="" class="form-control border-input" name="street" value="${customer1.addressId.street}" type="text" readonly="true"/>
                                            </div>
                                        </div>
                                    </div>
                                    <%------------------------------------------button ko lagi if needed-------------------------------------------%>
                                    <div class="text-center">
                                        <a href="/customer/customeradminedit1/${customer1.customerId}" class="btn btn-fill btn-success">
                                            Active
                                        </a>
                                        <a href="/customer/customeradminedit0/${customer1.customerId}" class="btn btn-fill btn-success">
                                            Block
                                        </a>
                                    </div>
                                </form:form>
                                <%------------------------------------------form ko end point-------------------------------------------%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

        <%@include file="/WEB-INF/jsp/footer1.jsp"%>
    </div>
</div>
<%@include file="/WEB-INF/jsp/footer2.jsp"%>
