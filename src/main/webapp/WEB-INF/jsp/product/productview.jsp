<%@include file="/WEB-INF/jsp/header.jsp"%>

<%@page import="project.ims.entity.Product"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="wrapper">
<%@include file="/WEB-INF/jsp/product/productsider.jsp"%>
	<div class="main-panel">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand" href="productview.jsp">Product
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
							<div class="col-md-2">
								<a href="productinsertform">
									<button type="submit"
										class="btn btn-info btn-block btn-fill btn-wd">Add
										Product</button>
								</a>
							</div>
							<div class="col-md-7 headerpad"></div>
							<%--search button--%>
							<div class="input-group col-md-3">
								<input type="text" class="form-control border-input"
									placeholder="Search..."> <span class="input-group-btn">
									<button class="btn btn-block btn-fill" type="button">
										<i class="ti-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="card"></div>
							</div>
							<%--header part end--%>

							<%--product image display--%>


							<c:forEach var="filename" items="${filename}">

								<div class="col-xs-6 col-md-3">
									<div class="text-center">
										<div class="thumbnail">

											<img src="${filename.productImage}" name="filename"
												class="img-responsive" alt="">
											<div class="caption">
												<h6 id = "tblData">${filename.productName}</h6>
												<p>
													<a href="/product/productviewdetails/${filename.productId}"
														class="btn btn-success btn-fill" role="button">View
														Details</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<%--end of product image display--%>

						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="/WEB-INF/jsp/footer1.jsp"%>
	</div>
</div>
<%@include file="/WEB-INF/jsp/footer2.jsp"%>
