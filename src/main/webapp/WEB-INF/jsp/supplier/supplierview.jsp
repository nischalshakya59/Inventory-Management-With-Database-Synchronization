<%@include file="/WEB-INF/jsp/header.jsp"%>

<%@page import="project.ims.entity.Brand"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper">
<%@include file="/WEB-INF/jsp/supplier/suppliersider.jsp"%>
	<div class="main-panel">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand" href="suppilerview.jsp">Suppiler
						Information</a>
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
								<a href="supplierinsertform">
									<button type="submit"
										class="btn btn-info btn-fill btn-wd">Add
										Suppiler</button>
								</a>
							
						</div>
					</div>
				</div>
				<%--header part end--%>

				<div class="row">
					<div class="col-md-12">
						<div class="card">

							<div class="content table-responsive table-full-width">
								<table class="table table-striped" id="tblData">
									<thead>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Email</th>
										<th>Contact</th>
										<th>Country</th>
										<th>Zone</th>
										<th>District</th>
										<th>City</th>
										<th>Street</th>
										<th>Action</th>
									</thead>
									<c:forEach var="supplierdetails" items="${supplierinfo}">
										<tr>
											<td>${supplierdetails.userdetailsId.firstName}</td>
											<td>${supplierdetails.userdetailsId.lastName}</td>
											<td>${supplierdetails.userdetailsId.email}</td>
											<td>${supplierdetails.userdetailsId.contact}</td>
											<td>${supplierdetails.addressId.country}</td>
											<td>${supplierdetails.addressId.zone}</td>
											<td>${supplierdetails.addressId.district}</td>
											<td>${supplierdetails.addressId.city}</td>
											<td>${supplierdetails.addressId.street}</td>

											<td><a href="/supplier/supplieredit/${supplierdetails.supplierId}"
												class="btn btn-success btn-fill"> Edit </a> <a
												href="/admin/supplierdel/${supplierdetails.supplierId}"
												class="btn btn-warning btn-fill"
												onclick="if (!confirm('Are you sure you want to delete?'))
                                                           return false;">
													Delete </a></td>
										</tr>
									</c:forEach>
								</table>
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
<%@include file="/WEB-INF/jsp/pagination.jsp"%>
<%@include file="/WEB-INF/jsp/footer2.jsp"%>

