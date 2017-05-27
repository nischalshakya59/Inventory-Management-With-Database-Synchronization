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
    <%-----------------------------------------mathi ko navigation end------------------------------------------%>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-7">
                        <div class="card">
                            <div class="">
                                <h4 class="table-title col-md-10">Add Product</h4>
                            </div>
                            <div class="content">
                                <form:errors path="product1.*"/>
                                <form:form method="POST" enctype="multipart/form-data" action="/productinsert" >
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="productName" class="form-group">Product Name</form:label>

                                                <form:input path="productName" class="form-control border-input" type="text" placeholder="Enter the Product Name" required ="required"/>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="productPrice" class="form-group">Price</form:label>

                                                <form:input path="productPrice" class="form-control border-input" type="text" placeholder="Enter the Price" required ="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="productQuantity" class="form-group">Quantity</form:label>

                                                <form:input path="productQuantity" class="form-control border-input" type="text" placeholder="Enter the Quantity" required ="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="productAttribute" class="form-group">Attribute</form:label>

                                                <form:textarea path="productAttribute" class="form-control border-input" type="text" placeholder="Enter the Attribute" required ="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="productDescription" class="form-group">Description</form:label>

                                                <form:textarea path="productDescription" class="form-control border-input" type="text" placeholder="Enter the Description" required ="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="productReorderLevel" class="form-group">Reorder Level</form:label>

                                                <form:input path="productReorderLevel" class="form-control border-input" type="text" placeholder="Enter the Reorder Level" required ="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="productImage" class="form-group">Image</form:label>

                                                <form:input path="productImage" name="productImage" class="form-control" type="file"  required ="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    <%--<div class="row">--%>
                                        <%--<div class="col-md-12">--%>
                                            <%--<div class="form-group">--%>

                                                <%--<form:label path="${brandinfo.brandName}" class="form-group">Brand</form:label>--%>

                                                <%--<form:input path="${brandinfo.brandName}" name = "brandName" class="form-control border-input" type="text" placeholder="Enter the brand" required ="required"/>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                                <form:label path="" class="form-group">Brand</form:label>
                                                <form:select name = "brandId" path="" itemLabel="Select Brand" class="form-control border-input" type="text"  required ="required">
                                                   <c:forEach var="brand1" items="${brandinfo}">
                                                       <form:option value="${brand1.brandId}">
                                                           ${brand1.brandName}
                                                       </form:option>

                                                   </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                                <form:label path="" class="form-group">Category</form:label>
                                                <form:select name = "categoryId" path="" itemLabel="Select Category" class="form-control border-input" type="text"  required ="required">
                                                    <c:forEach var="category1" items="${categoryinfo}">
                                                        <form:option value="${category1.categoryId}">
                                                            ${category1.categoryName}
                                                        </form:option>

                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">

                                                <form:label path="" class="form-group">Supplier</form:label>
                                                <form:select name = "supplierId" path="" itemLabel="Select Supplier" class="form-control border-input" type="text"  required ="required">
                                                    <c:forEach var="supplier1" items="${supplierinfo}">
                                                        <form:option value="${supplier1.supplierId}">
                                                            ${supplier1.userdetailsId.firstName}
                                                        </form:option>

                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">Save</button>
                                    </div>
                                </form:form>
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
