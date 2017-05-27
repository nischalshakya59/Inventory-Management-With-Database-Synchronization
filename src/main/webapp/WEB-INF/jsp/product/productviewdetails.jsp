<%@include file="/WEB-INF/jsp/header.jsp"%>

<%@page import="project.ims.entity.Product"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<a class="navbar-brand" href="productviewdetails.jsp">Product
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
							<div class="col-md-2"></div>
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
					</div>
				</div>
				<%--header part end--%>

				<div class="row">
					<div class="col-md-4">
						<div class="image_left">
							<img src="${productinfo.productImage}" name = "productinfo"
								 class="img-rounded" height="400" width="300">
						</div>

						<div class="line"></div><br>

						<div class="text-center">
							<a href="/productviewdetails/productedit/${productinfo.productId}"
							   class="btn btn-fill btn-success btn-sm"> Edit </a>
							<a class="space"></a>
							<a href="/admin/product/productviewdetails/productdel/${productinfo.productId}"
							   class="btn btn-fill btn-warning btn-sm"
							   onclick="if (!confirm('Are you sure you want to delete?'))
                                               return false;">
								Delete </a>
						</div>
					</div>

					<div class="col-md-6">
						<div class="details-center">
							<h3>${productinfo.productName}</h3>
							<label class=""></label>

							<p>Price:  Rs.${productinfo.productPrice}</p>
							<p>${productinfo.productAttribute}</p>
							<p>${productinfo.productDescription}</p>

							<label class=""></label>
							<p>Brand:  ${brand.brandName}</p>
							<p>Category:  ${productinfo.categoryId.categoryName}</p>
							<p>Supplier:  ${supplier.userdetailsId.firstName} ${supplier.userdetailsId.lastName}</p>

							<label class=""></label>
							<c:choose>
								<c:when test="${productinfo.productQuantity < productinfo.productReorderLevel}">
									<p class="notify">Remaining Quantity:${productinfo.productQuantity}</p>
								</c:when>

								<c:otherwise>
									<p>Remaining Quantity:${productinfo.productQuantity}</p>
								</c:otherwise>
							</c:choose>


							<p>Reorder Level: ${productinfo.productReorderLevel}</p>
							<p>Entry Date: ${productinfo.productEntrydate}</p>

							<c:choose>
							<c:when test="${not empty productinfo.productModifieddate}">
							<p>Modified Date: ${productinfo.productModifieddate}
								</c:when>

								<c:otherwise>

								</c:otherwise>
								</c:choose>

						</div>

					</div>

				</div>
				<div class="description_block">

				</div>


				<div class="clearfix"></div>
			</div>
		</div>

		<%@include file="/WEB-INF/jsp/footer1.jsp"%>
	</div>

<%@include file="/WEB-INF/jsp/footer2.jsp"%>