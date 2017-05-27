<%@include file="/WEB-INF/jsp/customerwebpage/header.jsp"%>

<%@page import="project.ims.entity.Category" %>
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

    <div class="col-md-10">
        <div class="similar_product">
            <h4 class="text-center"> ${categoryinfo.categoryName} </h4><br><br>
            <c:choose>
                <c:when test="${categoryinfo.parentId.categoryName == 'No Parent Category'}">
                    <c:forEach var="filename" items="${productall}">

                        <c:choose>
                            <c:when test="${categoryinfo.categoryName == filename.categoryId.parentId.categoryName}">
                                <div class="col-xs-6 col-sm-6 col-md-4">
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
                                                    <a href="/customerproductdetails/${filename.productId}" class="btn btn-success" role="button">View Details</a>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <c:forEach var="filename" items="${productall}">
                        <c:choose>
                            <c:when test="${filename.categoryId.categoryName==categoryinfo.categoryName}">
                                <div class="col-xs-6 col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <img src="${filename.productImage}" name = "filename" class=""  alt="">
                                        <div class="caption ">
                                            <h5>${filename.productName}</h5>
                                            <a href="#" class="btn btn-default" role="button">Add to Cart</a>
                                            <a href="/customerproductdetails/${filename.productId}" class="btn btn-success" role="button">View Details</a>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="col-md-2">
        <div class="details-right">
            <%--CATEGORY--%>
            <div class="link-box list-group list-unstyled">
                <h5 class="link-box-header list-group-item">Category</h5>
                <c:forEach var="category1" items="${categoryall}">
                    <c:choose>
                        <c:when test="${category1.categoryName == 'No Parent Category'}"></c:when>
                        <c:otherwise>
                            <a class="list-group-item" href="/customerproductview/category/${category1.categoryId}" role="button"> ${category1.categoryName} </a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>

            <%--BRAND--%>
            <div class="link-box list-group list-unstyled">
                <h5 class="link-box-header list-group-item">Brand</h5>
                <c:forEach var="brand" items="${brandall}">
                    <a class="list-group-item" href="/customerproductview/brand/${brand.brandId}">${brand.brandName}</a>
                </c:forEach>
            </div>

            <%--SUPPLIER--%>
            <div class="link-box list-group list-unstyled">
                <h5 class="link-box-header list-group-item">Supplier</h5>
                <c:forEach var="supplier" items="${supplierall}">
                    <a class="list-group-item" href="/customerproductview/supplier/${supplier.supplierId}">${supplier.userdetailsId.firstName}</a>
                </c:forEach>
            </div>

        </div>
    </div>
</div>


<%@include file="/WEB-INF/jsp/customerwebpage/footer.jsp"%>
