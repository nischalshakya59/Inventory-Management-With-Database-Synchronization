<%----------------------------------------------starting---------------------------------------------------%>
<%@include file="/WEB-INF/jsp/header.jsp"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="wrapper">
<%@include file="/WEB-INF/jsp/product/productsider.jsp"%>
   
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
                    <a class="navbar-brand" href="productview.jsp">Product Information</a>
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
                    <div class="col-lg-12 col-md-7">
                        <div class="card">
                            <div class="">
                                <h4 class="table-title col-md-10">Edit Product</h4>  <%--panel vitra aaune main heading--%>
                            </div>
                            <div class="content">
                                <form:errors path="product1.*"/>
                                <form:form method="POST" enctype="multipart/form-data" action="/productedit">

                                    <%------------------------------------------input fields and name ko lagi-------------------------------------------%>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Product Name</form:label>
                                                <form:input path="" name = "productName"
                                                            value = "${productinfo.productName}"  type="text"
                                                            class="form-control border-input"
                                                            placeholder="Enter Product Name" required ="required" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Price</form:label>
                                                <form:input path="" name = "productPrice"
                                                            value = "${productinfo.productPrice}"  type="text"
                                                            class="form-control border-input"
                                                            placeholder="Enter Product Price" required ="required" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Quantity</form:label>
                                                <form:input path="" name = "productQuantity"
                                                            value = "${productinfo.productQuantity}"  type="text"
                                                            class="form-control border-input"
                                                            placeholder="Enter Product Quantity" required ="required" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Description</form:label>
                                                <form:input path="" name = "productDescription"
                                                            value = "${productinfo.productDescription}"  type="text"
                                                            class="form-control border-input"
                                                            placeholder="Enter Product Description" required ="required" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Attribute</form:label>
                                                <form:input path="" name = "productAttribute"
                                                            value = "${productinfo.productAttribute}"  type="text"
                                                            class="form-control border-input"
                                                            placeholder="Enter Product Attribute" required ="required" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Brand</form:label>
                                                <form:select name = "brandId" path="" itemLabel="" class="form-control border-input" type="text"  required ="required">

                                                    <form:option value="${brandinfo.brandId}">
                                                        ${brandinfo.brandName}
                                                    </form:option>

                                                    <c:forEach var="brand1" items="${brand}">
                                                        <c:choose>
                                                            <c:when test="${brand1.brandName==brandinfo.brandName}"></c:when>
                                                            <c:otherwise>
                                                                <form:option value="${brand1.brandId}">${brand1.brandName}
                                                                </form:option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>

                                                </form:select>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Category</form:label>
                                                <form:select name = "categoryId" path="" itemLabel="" class="form-control border-input" type="text"  required ="required">

                                                    <form:option value="${productinfo.categoryId.categoryId}">
                                                        ${productinfo.categoryId.categoryName}
                                                    </form:option>

                                                    <c:forEach var="category1" items="${categoryinfo}">
                                                        <c:choose>
                                                            <c:when test="${category1.categoryName==productinfo.categoryId.categoryName}"></c:when>
                                                            <c:otherwise>
                                                                <form:option value="${category1.categoryId}">${category1.categoryName}
                                                                </form:option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>

                                                </form:select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Supplier</form:label>
                                                <form:select name = "supplierId" path="" itemLabel="" class="form-control border-input" type="text"  required ="required">

                                                    <form:option value="${supplierinfo.supplierId}">
                                                        ${supplierinfo.userdetailsId.firstName}
                                                    </form:option>

                                                    <c:forEach var="supplier1" items="${supplier}">
                                                        <c:choose>
                                                            <c:when test="${supplier1.userdetailsId.firstName==supplierinfo.userdetailsId.firstName}"></c:when>
                                                            <c:otherwise>
                                                                <form:option value="${supplier1.supplierId}">${supplier1.userdetailsId.firstName}
                                                                </form:option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>

                                                </form:select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Reorder Level</form:label>
                                                <form:input path="" name = "productReorderLevel"
                                                            value = "${productinfo.productReorderLevel}"  type="text"
                                                            class="form-control border-input"
                                                            required ="required" />
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Image</form:label>

                                                <%--<img src="${productinfo.productImage}" name = "productImage" class="img-responsive" alt="">--%>
                                                <%--<br>--%>

                                                    <form:input path="" value="${productinfo.productImage}" name="productImage"
                                                     type="file"
                                                    class="form-control" required ="required" />

                                            </div>
                                        </div>
                                    </div>

                                    <form:hidden path="" name = "productEntrydate" value="${productinfo.productEntrydate}"/>

                                    <form:hidden path = "" name = "productId" value = "${productinfo.productId}"/>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">Update</button>
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



