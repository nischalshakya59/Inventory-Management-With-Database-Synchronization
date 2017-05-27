<%--
  Created by IntelliJ IDEA.
  User: Inspiron
  Date: 9/27/2016
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/WEB-INF/jsp/customerwebpage/header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                        <form:form  method="POST" action="/admin/adminlogin">

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


<%--<form:form  method="POST" action="/admin/adminlogin">--%>

    <%--<div class="form-group has-reg">--%>
        <%--<form:label cssClass="control-label_new" path="username" >Username</form:label>--%>
        <%--<form:input path="" name="username" type="text" class="form-control" placeholder="User Name..." required="required"></form:input>--%>
    <%--</div>--%>

    <%--<div class="form-group has-reg">--%>
        <%--<form:label cssClass="control-label_new" path="password">Password</form:label>--%>
        <%--<form:input path="" name="password" type="password" placeholder="Password..." class="form-control" required="required"></form:input>--%>
    <%--</div>--%>

    <%--<div class="form-group text-center">--%>
        <%--<button type="submit" class="btnnew btn-primary">Get Started</button>--%>
    <%--</div>--%>
<%--</form:form>--%>

<%@include file="/WEB-INF/jsp/customerwebpage/footer.jsp"%>