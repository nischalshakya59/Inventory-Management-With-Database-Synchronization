<%--
  Created by IntelliJ IDEA.
  User: Inspiron
  Date: 9/1/2016
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>

<%@include file="/WEB-INF/jsp/header.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="wrapper">
    <%@include file="/WEB-INF/jsp/admin/sidebar.jsp"%>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span> <span
                            class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Dashboard</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#" class="dropdown-toggle"
                               data-toggle="dropdown"> <i class="ti-panel"></i>
                            <p>Stats</p>
                        </a></li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                data-toggle="dropdown"> <i class="ti-bell"></i>
                            <p class="notification">5</p>
                            <p>Notifications</p> <b class="caret"></b>
                        </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                            </ul></li>
                        <li><a href="#"> <i class="ti-settings"></i>
                            <p>Settings</p>
                        </a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <%--header part--%>
                <div class="row">
                    <div class="col-md-12">
                        <%--button ani search ko section--%>
                        <div class="card headerpad">
                            <div class="input-group-sm">
                                <h3>The Shopping Bag</h3>
                            </div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--header part end--%>

                <div class="col-md-9 cart-items">
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
                    <a class="btn btn-block btn-primary text-center" href="/admin/dashboard">
                        <i class="fa fa-shopping-cart"></i>
                        Continue Shopping</a>

                    <div class="price-details">
                        <dl class="dl-horizontal">
                            <h4>Price Details</h4>

                            <dt>Total:</dt>
                            <dd>${total}</dd>

                            <dt>Discount:</dt>
                            <dd>${discount}</dd>

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
                                <a class="btn btn-block btn-primary text-center" href="/bill">
                                    <i class="fa fa-shopping-bag"></i>
                                    Place Order</a>
                            </c:otherwise>
                        </c:choose>

                    </div>



            </div>
        </div>

        </div>

        <%@include file="/WEB-INF/jsp/footer1.jsp"%>
    </div>

<%@include file="/WEB-INF/jsp/footer2.jsp"%>