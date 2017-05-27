<%----------------------------------------------starting---------------------------------------------------%>
<%@include file="/WEB-INF/jsp/header.jsp"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="wrapper">
	<%@include file="/WEB-INF/jsp/category/categorysider.jsp"%>
	<%--------------------------------------------------sidebar end-----------------------------------------------%>
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

		<%----------------------------------------mathi ko navigation end------------------------------------------%>

		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<%---------------------------------------------edit garne main area/panel-------------------------------------------%>
					<div class="col-lg-12 col-md-7">
						<div class="card">
							<div class="">
								<h4 class="table-title col-md-10">Edit Category</h4>
								<%--panel vitra aaune main heading--%>
							</div>
							<div class="content">
								<form:errors path="category1.*" />
								<form:form method="POST" action="/categoryedit">

									<%------------------------------------------input fields and name ko lagi-------------------------------------------%>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<form:label path="categoryName" class="form-group">Category Name:</form:label>
												<form:input path="categoryName"
													value="${categoryinfo.categoryName}" type="text"
													class="form-control border-input"
													placeholder="Enter Category Name" required="required" />
												<form:hidden path="categoryId"
													value="${categoryinfo.categoryId}" />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<form:label path="parentId" class="form-group">Parent Category</form:label>

												<form:select name="parentId" path=""
													itemLabel="${categoryinfo.parentId.categoryName}"
													class="form-control border-input" type="text">
													<form:option value="${categoryinfo.categoryId}">${categoryinfo.parentId.categoryName}
                                                    </form:option>
													<c:forEach var="category1" items="${category}">
														<c:choose>
															<c:when
																test="${category1.categoryName==categoryinfo.parentId.categoryName}"></c:when>
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
									<%------------------------------------------button ko lagi if needed-------------------------------------------%>
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
