
<%@include file="/WEB-INF/jsp/header.jsp"%>

<%@page import="project.ims.entity.Category"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper">
<%@include file = "/WEB-INF/jsp/category/categorysider.jsp" %>
	<div class="main-panel">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand" href="categoryview.jsp">Category
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
								<a href="/admin/category/categoryinsertform">
									<button type="submit"
										class="btn btn-info btn-fill btn-wd">Add
										Category</button>
								</a>
							
						</div>
					</div>
				</div>
				<%--header part end--%>

				<div class="row">
					<div class="col-md-12">
						<div class="card">

							<div class="content table-responsive table-full-width">
								<table class="table table-striped" id = "tblData">
									<thead>
										<th>Category Id</th>
										<th>Category Name</th>
										<th>Parent Category</th>
										<th>Action</th>
									</thead>
									<tbody>
										<c:forEach var="category1" items="${categoryinfo}">
											<tr>
												<td>${category1.categoryId}</td>
												<td>${category1.categoryName}</td>
												<td>${category1.parentId.categoryName}</td>
												<td><c:choose>
														<c:when test="${category1.categoryId == 1}">
														</c:when>
														<c:otherwise>
															<a href="/category/categoryedit/${category1.categoryId}"
																class="btn btn-fill btn-success btn-sm"> Edit </a>

															<a href="/admin/category/categorydelete/${category1.categoryId}"
																class="btn btn-fill btn-warning btn-sm"
																onclick="if (!confirm('Are you sure you want to delete this Category?'))return false;">
																Delete</a>
														</c:otherwise>
													</c:choose></td>
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
