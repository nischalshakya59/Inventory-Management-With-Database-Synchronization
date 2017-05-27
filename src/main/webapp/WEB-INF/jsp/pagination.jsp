<script type="text/javascript" src="/public/pagination/js/jquery.js"></script>

<script type="text/javascript"
	src="/public/pagination/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="/public/pagination/js/dataTables.bootstrap.min.js"></script>

<script type="text/javascript">
	$('#tblData').DataTable({
		"pagingType" : "full_numbers",
		"searching" : true,
		"bPaginate": true,
		"bLengthChange": false,
		"bFilter": true,
		"bInfo": true,
		"bAutoWidth": true,
		"pageLength" : 8,


//		"showNEntries" : false,
//		"info": false


	})
</script>