<%@include file="/WEB-INF/jsp/header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="project.ims.entity.Customer"%>


<div class="wrapper">
	<%@include file="/WEB-INF/jsp/customer/customeradminsider.jsp"%>

	<div class="main-panel">

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand" href="customeradminview.jsp">Customer
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

				<div class="row">
					<div class="col-md-12">
						<div class="card">

							<div class="content table-responsive table-full-width">
								<table class="table table-striped" id="tblData">
									<thead>
										<th>Customer Id</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Email</th>
										<th>Contact</th>
										<th>Username</th>
										<th>User Status</th>
										<th>Street</th>
										<th>Action</th>
									</thead>
									<tbody>
										<c:forEach var="customer1" items="${customer}">
											<tr>
												<td>${customer1.customerId}</td>
												<td>${customer1.userdetailsId.firstName}</td>
												<td>${customer1.userdetailsId.lastName}</td>
												<td>${customer1.userdetailsId.email}</td>
												<td>${customer1.userdetailsId.contact}</td>
												<td>${customer1.loginId.username}</td>
												<td><c:choose>
														<c:when test="${customer1.loginId.userStatus}">
															<span class="label label-success">Active</span>
														</c:when>
														<c:otherwise>
															<span class="label label-danger">Inactive</span>
														</c:otherwise>

													</c:choose></td>
												<td>${customer1.addressId.street}</td>
												<td><a
													href="/customer/customeredit/${customer1.customerId}"
													class="btn btn-fill btn-success"> Edit </a></td>
											</tr>
										</c:forEach>
									</tbody>
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


