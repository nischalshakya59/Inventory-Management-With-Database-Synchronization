<%@include file="/WEB-INF/jsp/header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h1>Backup and Restore Data</h1>
<form:form method="POST" enctype="multipart/form-data"
	action="/download">
	<form:label path="filename" class="form-group">Enter the file name to save</form:label>

	<form:input path="filename" class="form-control border-input"
		type="text" placeholder="Enter the File Name" required="required" />
		<br>
	<button type="submit" class="btn btn-info btn-fill btn-wd">Download</button>
</form:form>



