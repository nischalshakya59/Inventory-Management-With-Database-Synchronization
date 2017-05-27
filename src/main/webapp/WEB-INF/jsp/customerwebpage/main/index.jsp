<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/jsp/customerwebpage/header.jsp"%>

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
                    <li><a class="navbar-active" href="/index">Home</a></li>
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

<%--carousel start--%>
<div class="section hidden-xs" id="">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 hidden-sm hidden-xs">
                <div class="link-box list-group list-unstyled"  role="group" aria-label="Vertical button group">

                    <div class="dropdown">
                        <button class="btnnew btn-default dropdown-toggle  btn-lg btn-block" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            Category
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu  btn-lg btn-block" aria-labelledby="dropdownMenu1">
                            <li>
                                <c:forEach var="category1" items="${categoryinfo}">
                                    <c:choose>
                                        <c:when test="${category1.categoryName == 'No Parent Category'}"></c:when>
                                        <c:otherwise>
                                            <a class="list-group-item " href="/customerproductview/category/${category1.categoryId}" role="button"> ${category1.categoryName} </a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </li>
                        </ul>
                    </div>


                    <%--<button class="btnnew btn-neutral dropdown-toggle btn-lg btn-block" type="button">--%>
                        <c:forEach var="category1" items="${categoryinfo}">
                            <c:choose>
                                <c:when test="${category1.parentId.categoryId == 1}">
                                    <c:choose>
                                        <c:when test="${category1.categoryId==1}">

                                        </c:when>
                                        <c:otherwise>
                                            <button class="btnnew btn-neutral dropdown-toggle btn-lg btn-block" type="button">
                                                <a  href="/customerproductview/category/${category1.categoryId}">${category1.categoryName}</a>
                                            </button>

                                        </c:otherwise>
                                    </c:choose>

                                </c:when>
                                <c:otherwise></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    <%--</button>--%>

                    <div class="dropdown">
                        <button class="btnnew btn-default dropdown-toggle btn-lg btn-block" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            Brand
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu btn-lg btn-block" aria-labelledby="dropdownMenu1">
                            <li><c:forEach var="brand" items="${brandinfo}">
                                <a class="list-group-item" href="/customerproductview/brand/${brand.brandId}">${brand.brandName}</a>
                            </c:forEach></li>
                        </ul>
                    </div>

                    <button class="btnnew btn-neutral dropdown-toggle btn-lg btn-block" type="button">
                        Microsoft
                    </button>

                </div>
            </div>

            <div class="col-md-9">
                <!-- Carousel Card -->
                <div class="card-carousel">
                    <div id="carousel-example-generic" class="carousel slide"  data-interval="3000">

                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="/public/customer/images/bg1.jpg"  alt="Awesome Image">
                                <div class="carousel-caption">
                                    <h1> Study & play bundle.</h1>
                                    <p class="">Students save up to 25% on Surface and Xbox.</p><br>
                                    <a class="btnnew btn-primary">Learn more</a>
                                </div>
                            </div>
                            <div class="item">
                                <img src="/public/customer/images/bg2.jpg"  alt="Awesome Image">
                                <div class="carousel-caption">

                                </div>
                            </div>
                            <div class="item">
                                <img src="/public/customer/images/bg3.jpg"  alt="Awesome Image">
                                <div class="carousel-caption">

                                </div>
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <i class="material-icons">keyboard_arrow_left</i>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <i class="material-icons">keyboard_arrow_right</i>
                        </a>

                    </div>
                </div>
                <!-- End Carousel Card -->
            </div>
        </div>
    </div>
</div>
<%--carousal end--%>

<%--content start--%>
<div class="container">
    <br>
    <h2 class=" text-center">Trending Products</h2>
    <br><br>

    <%--<label class="line text-center"></label>--%>

    <div class="row product_display">

    <%--products list--%>
        <div class="col-xs-6 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/public/customer/images/pc.jpg" alt="...">
                <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/public/customer/images/pc1.jpg" alt="...">
                <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/public/customer/images/pc2.jpg" alt="...">
                <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/public/customer/images/pc3.jpg" alt="...">
                <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/public/customer/images/pc4.jpg" alt="...">
                <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/public/customer/images/pc5.jpg" alt="...">
                <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/public/customer/images/pc6.jpg" alt="...">
                <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/public/customer/images/pc7.jpg" alt="...">
                <div class="caption">
                    <h3>Thumbnail label</h3>
                    <p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                </div>
            </div>
        </div>
    <%--product list end--%>
    </div>
</div>
<%--content end--%>
<script>
    $(document).ready(function(){
    // Activate Carousel
    $("#carousel-example-generic").carousel("cycle");
    });
</script>

<%@include file="/WEB-INF/jsp/customerwebpage/footer.jsp"%>