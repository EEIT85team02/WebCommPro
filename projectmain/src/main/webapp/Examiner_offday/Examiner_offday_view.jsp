<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="../css/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
<script src="../js/jquery-1.12.3.min.js"></script>
<script src="../js/bootstrap/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.0-rc.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">

<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<style>
.navbar-inverse {
    background-image: linear-gradient(to bottom,#E4C00D 0,rgba(249, 68, 27, 0.97) 100%);
}
.Main_Content {
	margin-top: 100px;
}

#ok {
	color: blue;
}



Toggle {
	color: green;
}

label, input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>
</head>
<body>
	<jsp:include page="/top/ExamierTop.jsp" />

	<table id="studentTable" class="table table-bordered">
		<tbody>

		</tbody>
	</table>



	<div class="container">
		<div class="Main_Content">
			<div class="row">

				<div class="col-md-12">
					<hr>
					<table id="StuTable" class="display" cellspacing="0" width="100%">
						<thead>

							<tr>
								<th class="col-md-3 col-xs-3">���u�N��</th>
								<th class="col-md-2 col-xs-3">���u�а���渹</th>
								<th class="col-md-2 col-xs-3">�а��}�l���</th>
								<th class="col-md-3 col-xs-3">�а��������</th>
								<th class="col-md-2 col-xs-3">�а��Ѽ�</th>
								<th class="col-md-3 col-xs-3">¾�ȥN�z�H�N��</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr>
								<th>���u�а���渹</th>
								<th>�а��}�l���</th>
								<th>�а��������</th>
								<th>�а��Ѽ�</th>
								<th>¾�ȥN�z�H</th>
								<th>���u�N��</th>
							</tr>
						</tfoot>
					</table>

<!-- <script> -->
<%-- <%session.setAttribute("emp_id","7004");%> --%>
<!-- </script> -->

<script>


var emp_id= <%=session.getAttribute("emp_id")%>;
console.log(emp_id);
$(function() {
	//�w�qtable��ƨӷ�json�A�P�e�����------>�}�l

	table = $('#StuTable')
			.DataTable(
					{

						"ajax" : {

							"url" : "/projectmain/Examiner_offday/showExaminerOffDay_controller.do?emp_id="+emp_id


						},

						"oLanguage" : {
							"sProcessing" : "��ƥ��B�z��...",
							"sLengthMenu" : "��� _MENU_ ���O��",
							"sZeroRecords" : "�L�ŦX���",
							"sInfo" : "�ثe�O���G_START_ �� _END_, �`���ơG_TOTAL_",
							"sInfoEmpty" : "��ܲ� 0 �� 0 �����G�A�@ 0 ��",
							"sInfoFiltered" : "(�q _MAX_ �����G�L�o)",
							"sSearch" : "�j��:",
							"oPaginate" : {
								"sFirst" : "����",
								"sPrevious" : "�W��",
								"sNext" : "�U��",
								"sLast" : "����"
							}
						},
						"bJQueryUI" : true,
						"bProcessing" : true,
						"sPaginationType" : "full_numbers",

					});

})

						
</script>
</body>
</html>
