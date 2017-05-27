<%----------------------------------------------starting---------------------------------------------------%>
<%@include file="/WEB-INF/jsp/header.jsp"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="wrapper">
<%@include file="/WEB-INF/jsp/supplier/suppliersider.jsp"%>
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
                    <a class="navbar-brand" href="suppilerview.jsp">Suppiler Information</a>
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
                                <h4 class="table-title col-md-10">Edit Supplier</h4>  <%--panel vitra aaune main heading--%>
                            </div>
                            <div class="content">
                                <form:errors path="supplier1.*"/>
                                <form:form method="POST" action="/supplieredit">

    <%------------------------------------------input fields and name ko lagi-------------------------------------------%>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">First Name</form:label>    
                                                <form:input path="" name = "firstName"
                                                            value = "${supplierinfo.userdetailsId.firstName}"  type="text" 
                                                            class="form-control border-input" 
                                                            placeholder="Enter First Name" required ="required" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Last Name</form:label>    
                                                <form:input path="" name = "lastName" value = "${supplierinfo.userdetailsId.lastName}"  type="text" 
                                                            class="form-control border-input" 
                                                            placeholder="Enter Last Name" required ="required" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Email</form:label>    
                                                <form:input path="" name = "email"
                                                            value = "${supplierinfo.userdetailsId.email}"  type="email" 
                                                            class="form-control border-input" 
                                                            placeholder="Enter Email" required ="required" />
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Contact</form:label>    
                                                <form:input path="" name = "contact" value = "${supplierinfo.userdetailsId.contact}"  type="text" 
                                                            class="form-control border-input" 
                                                            placeholder="Enter Contact" required ="required" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Country</form:label>    
                                                <form:input path="" name = "country" value = "${supplierinfo.addressId.country}"  type="text" 
                                                            class="form-control border-input" 
                                                            placeholder="Enter Country" required ="required" />
                                            </div>
                                        </div>
                                    </div>  

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Zone</form:label>    
                                                <form:input path="" name = "zone" value = "${supplierinfo.addressId.zone}"  type="text" 
                                                            class="form-control border-input" 
                                                            placeholder="Enter Zone" required ="required" />
                                            </div>
                                        </div>
                                    </div>  
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">District</form:label>    
                                                <form:input path = "" name = "district" value = "${supplierinfo.addressId.district}"  type="text" 
                                                            class="form-control border-input" 
                                                            placeholder="Enter District" required ="required" />
                                            </div>
                                        </div>
                                    </div>  
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">City</form:label>    
                                                <form:input path="" name = "city" value = "${supplierinfo.addressId.city}"  type="text" 
                                                            class="form-control border-input" 
                                                            placeholder="Enter District" required ="required" />
                                            </div>
                                        </div>
                                    </div>  
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <form:label path="" class="form-group">Street</form:label>    
                                                <form:input path="" name = "street" value = "${supplierinfo.addressId.street}"  type="text" 
                                                            class="form-control border-input" 
                                                            placeholder="Enter Street" required ="required" />
                                            </div>
                                        </div>
                                    </div>  
                                    <form:hidden path = "" name = "supplierId" value = "${supplierinfo.supplierId}"/>
                                    <form:hidden path = "" name = "addressId" value = "${addressinfo.addressId}"/>
                                    <form:hidden path = "" name = "userdetailsId" value = "${userinfo.userdetailsId}"/>

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



