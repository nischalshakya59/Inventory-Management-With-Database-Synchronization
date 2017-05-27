<%@include file="/WEB-INF/jsp/header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h1>Backup and Restore Data</h1>
<form:form method="POST" enctype="multipart/form-data"
	action="/brandrestore">
	<form:label path="">File To Restore</form:label>

	<form:input path="filepath" name="filepath" type="file"
		required="required" />
	<button type="submit" class="btn btn-info btn-fill btn-wd">Save</button>
</form:form>



